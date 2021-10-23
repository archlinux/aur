## Release 0.15.1 on 2021-10-23

- Reported packages and files are now sorted with `vercmp`.
- Under the hood `pacman-conf` is used to get pacman's configuration.
- Improve performance when checking for expired packages and pacman's log file
  is large.
- Newly downloaded files are logged.