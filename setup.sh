#!/bin/bash
apk update
apk add tinyproxy
apk add curl
sed -i 's/^Allow 127.0.0.1$/Allow 0.0.0.0\/0/' /etc/tinyproxy/tinyproxy.conf
echo "while true;do" >> ~/.profile
echo "if ( http_proxy=127.0.0.1:8888 curl example.org );then" >> ~/.profile
echo "continue"
echo "else"
echo -e "tinyproxy &\ncat /dev/location > /dev/null &\nps aux | grep tinyproxy | grep -v grep\ngrep '^Allow' /etc/tinyproxy/tinyproxy.conf" >> ~/.profile
echo "fi" >> ~/.profile
echo "done" >> ~/.profile
source ~/.profile
