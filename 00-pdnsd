#!/bin/sh

INTERFACE=$1
STATUS=$2

# $INIT should be either "init" (System V) or "systemd".
INIT=`cat /proc/1/comm`

no_valid_init() {
  echo 'No valid init system set. Please select either "init" or "systemd".'
  exit 1
}

pdnsd_is_running() {
  # Check whether pDNSd is running.
  case "$INIT" in
    'systemd')
      systemctl is-active pdnsd.service -q
      return $?
    ;;
    'init')
      [ 'STARTED' = `rc.d list|grep pdnsd|cut -f1 -d']'|cut -d'[' -f2` ]
      return $?
    ;;
    *)
      no_valid_init
    ;;
  esac
}

pdnsd_init_command() {
  # Give pDNSd a command through the init system
  case "$INIT" in
    'systemd')
      exec systemctl $1 pdnsd.service
    ;;
    'init')
      exec rc.d $1 pdnsd
    ;;
    *)
      no_valid_init
    ;;
  esac
}

pdnsd_going_up() {
  if ! pdnsd_is_running; then
    # pDNSd isn't running. Start it.
    pdnsd_init_command start
  else
    # pDNSd is running. Restart it.
    pdnsd_init_command restart
  fi
}

pdnsd_going_down() {
  # Check for active interface, take offline if none is active
  if [ 'connected' != `nm-tool|grep State|cut -f2 -d' '` ]; then
    pdnsd_init_command stop
  else
    # If another interface is active, restart so we're sure we're using
    # the active connection.
    pdnsd_init_command restart
  fi
}

case "$STATUS" in
  up)
    pdnsd_going_up
  ;;
  vpn-up)
    pdnsd_going_up
  ;;
  down)
    pdnsd_going_down
  ;;
  vpn-down)
    pdnsd_going_down
  ;;
esac
