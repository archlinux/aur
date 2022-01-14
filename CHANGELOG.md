## Release 0.16.3 on 2022-01-14

- Fix broken icon reference for informational notifications.

## Release 0.16.2 on 2022-01-14

- Use icons in notifications that are more consistent with KDE Plasma.
- Run very basic test suite when building the package.
- Include PYC files for all optimization levels in package.

## Release 0.16.1 on 2021-12-27

- Fix internal error which caused the script to fail if an orphaned package was
  found.
- Fix version comparison between packages; was only relevant for ordering the
  package order in the log and command line.

## Release 0.16.0 on 2021-12-22

- Add the command line option `--config` with which the default config file
  location can be overridden.
- Use less memory while handling packages (requires dataclass's `slots` keyword
  in Python 3.10).
