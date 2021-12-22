## Release 0.16.0 on 2021-12-22

- Add the command line option `--config` with which the default config file
  location can be overridden.
- Use less memory while handling packages (requires dataclass's `slots` keyword
  in Python 3.10).