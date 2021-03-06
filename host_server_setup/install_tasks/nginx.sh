#!/bin/bash

echo "-- Installing nginx"
sudo yum install nginx -y
sudo service nginx start
if [ `curl -sL -w "%{http_code}\\n" "http://localhost/" -o /dev/null` -ne 200 ]; then
  echo "ERROR: nginx not up"
else
  echo "nginx is up"  
fi

if [`curl http://127.0.0.1:8080/hello` -ne "Hello, World!”]; then
  echo “app is down!”
else
  echo “app is up”
fi
