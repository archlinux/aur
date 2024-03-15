## Release 1.0.0 on 2024-03-15

- Update format and options of the configuration file. `pacautomation.conf` now
  uses the TOML format. New switches to control whether pacautomation checks
  for orphans or pacfiles were added. Checking for package updates and
  downloading them can now be independently configured. The option `tmp_db` to
  set the location of the temporary package database was removed.
- Warn if an unmerged `pacautomation.conf.pacnew` is found.
- Include more information in error messages. This applies to both, desktop
  notifications and the logged output.
- Use more fine-grained `ReadWritePaths` and restrict the main service to the
  files and directories it actually needs.
- Also, quite a bit refactoring was done on internals and the test suite was
  expanded.
