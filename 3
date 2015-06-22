#!/bin/sh
exec 2>&1

PATH=/command:/sbin:/bin:/usr/sbin:/usr/bin

if [ -x /etc/runit/reboot ]
then
 export RUNLEVEL=6
else
 export RUNLEVEL=0
fi

echo 'Waiting for services to stop...'
sv -w196 force-stop /etc/runit/runsvdir/current/*
sv exit /etc/runit/runsvdir/current/*

echo 'Shutdown...'

/etc/rc.shutdown
