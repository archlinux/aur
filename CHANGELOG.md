## Release 0.17.0 on 2022-01-18

- Desktop notifications should now work on GNOME as well.
- Changed default name of the log file from `pacautomation.pacman.log` to
  `pacautomation.log`.
- The formatting of notification was tweaked slightly.
- All desktop notifications now use the urgency level "normal"; it was
  unspecified before.
- Improved sandboxing of pacautomation's background service. Many parts of the
  system are now read only or hidden such as `/home`.
- Extended the test suite.