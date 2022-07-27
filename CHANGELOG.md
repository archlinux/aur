
# Changelog


* (Planned) 1.0
    * Support config name as dependencies
    * Own ping
    * `%success` placeholder (binary)
    * Print if a command is ill formed for sh
        * capture stderr?
    * `down-again` (print how long an IP was online)
    * `down-start` one message if host went down
    * `up-start` one message if host is up
    * print to stdout action `stdout` with message
    * time test for actions: `command` versus `log`
    * `%uptime` placeholder

<br />

* [WIP] 0.0.6
    *

* 0.0.5
    * new ERROR loglevel (nothing logged regarding connections)
    * Fix free when using a reboot action
    * Added `datetime_format` as a configuration in srd.conf
    * Action `log` now supports `user` which sets the owner of the logfile (only on creation)
    * Added `%downtime` placeholder for the downtime in days, hours, minutes and seconds

* 0.0.4
    * Fix some memory not getting deallocated
    * Fix host beeing reported as up due to a race condition when pinging
    * Do not stop service if we cannot create a ping object
    * New action: `log` to file (see README.md for documentation)
    * `up-again` variables: for %sdt (start downtime) and %now
        * available in `log.message` and `command.cmd`

* 0.0.3
    * Do not start if gateway IP cannot be determined
    * Do not start if a dependency is non-existent
    * systemd-service: run srd after network-online.target
    * configure num_pings (number of pings sent)
    * add configuration 'run_if' to actions to define when it is run
        * down, up, always, up-again
    * print latency in command with `%lat_ms`

* 0.0.2
    * Rename to "Simple Reaction Daemon" to reflect that any command can be executed and not some magic to reconnect

* 0.0.1
    * Initial release
