FROM --platform=linux/amd64 alpine
# ADD VERSION .
# Install needed packages

RUN echo "<http://dl-4.alpinelinux.org/alpine/edge/community/>" >> /etc/apk/repositories
RUN echo "<http://dl-4.alpinelinux.org/alpine/edge/testing/>" >> /etc/apk/repositories
RUN apk update && apk add openssl easy-rsa openvpn iptables bash
RUN rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

# Configure tun
RUN mkdir -p /dev/net \
  && mknod /dev/net/tun c 10 200
