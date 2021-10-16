## Release 0.15.0 on 2021-10-12

- The pre-download of upgrades and cache cleaning is now optional. Both are
  enabled by default via two new options `enable` inside the configuration file.
- Introduced two new configuration sections `[UPGRADES]` and `[CACHE]`.
  Moved the configuration option `expiry_days` to a latter section.
- Upon first installation of the package, the user is reminded to enable the
  included systemd timer.
- Include this changelog in newly created pacautomation packages.