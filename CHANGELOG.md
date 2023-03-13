
# Changelog

* 0.0.8 (Released on 02.01.2023)
    * Add option to `influx` to log to a backup file in case the database is unavailable
    * Calculate `%downtime` since startup if no ping ever succeded
    * Wait instead of shutting down when no default gateway was found (may happen if the service is started too early)
    * Fixed missing decimal places for pings greater than 99ms
    * Report targets which we stopped pinging
        * may happen if we're stuck on resolving a domain name 
    * Shut down after pressing ctrl + c
    * Support for `%sut` (start uptime) placeholder
    * Loglevels are now per target
    * Report if there is a dependency loop
    * Influx now has a timeout (10s for connecting; in total 30s for the request to be processed by the server)
    * Influx: support for ipv6
    * Cache which replacements need to be done in placeholders (command.cmd, log.message, influx.linedata)
    * Calculate time taken for resolving hostnames (debug output)
    * `down-new` also supports `delay`
    * `%sdt` is now set when the first ping fails (if `num_pings` is greater than 1)

* 0.0.7 (Released on 09.09.2022)
    * Pings now follow period more closely (and no longer shift)
        * Previously some shift occured as we waited `period` time between pings (and did not include actions which may take some time)
    * `timeout` for the `command` action
    * action `influx` for inserting data into [InfluxDB](https://www.influxdata.com/)
    * `%timestamp` is replaced with the unix timestamp
    * Allow development without gateway
    * `datetime_format` (defined in srd.c) will replace `%%ms` (really double percentage sign) with the milliseconds of the current time 
    * Fix no message when `loglevel` is invalid
    * Potential performance improvements
    * targets can now be IPv6 addresses
    * New setting `header` for action `log` (usefull for creating CSV files)

* 0.0.6 (Released on 19.08.2022)
    * **Breaking**: `down-again`, `up-again` renamed to `down-new` and`up-new`
    * Own ping implementation (running as root is no longer needed to ping)
        * We now use approximately 2.5 times less CPU time (userspace and kernel times)
    * `%status` placeholder for `success` or `failed` depending if the ping was answered or not
    * `datetime_format` (from srd.conf) is regarded when printing the current time in stdout
    * Event `down-again` which runs if a previous ping succeeded and now fails
    * Fixed potential very rare race condition when printing
    * Fix `%lat_ms` not always beeing replaced
    * Make `datetime_format` optional in `srd.conf`
    * `up-new` actions are triggered at startup
    * `%uptime` placeholder
    * Update README.md
    * Support `%ip` placeholder in log.path

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
