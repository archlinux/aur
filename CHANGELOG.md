Added a default argument to the setconfig command and a makeconfig command

type ./jura setconfig default to restore the default options

If for some reason the config.jura file gets deleted, you can restore it with the default configuration by openening jura or running the makeconfig command

type ./jura makeconfig to ensure the config exists, if not it will be created

**Bug fixes**

fixed a bug that did not allow for a custom config to be set if it was outside of the folder where the binary was made

fixed the bug that did not restore the terminal emulator properly

**Full Changelog**: https://github.com/Nooberieno/jura/compare/3.2...3.3