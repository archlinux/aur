# yandex-music (AUR)

Repackages the official Yandex Music `.deb` for Arch. `origin` is the AUR: a push
reaches users immediately, so confirm the app works first.

The new version and its sha512 are in the manifest at
`https://music-desktop-application.s3.yandex.net/stable/latest-linux.yml`.
Check the `.deb` against it: the hash in `PKGBUILD` only confirms what was downloaded.

A build is ready to push when:

- the `package()` patches actually applied: `sed` does not fail if Yandex changes
  the `.desktop` file, so inspect the result in `pkg/`;
- the app from `pkg/` started with a throwaway profile (`XDG_CONFIG_HOME`,
  `XDG_CACHE_HOME`, `--user-data-dir`), and its `logs/main.log` contains
  `Updater is inactive`, `desktop:application:ready` and requests with status 200.
  An open window does not prove this.

Treat a log error as a regression only if the previous version does not show it
under the same conditions: the logs are noisy and depend on the environment. Login
and playback cannot be checked this way, so tell the maintainer they were not tested.

Removing `app-update.yml` and `package-type` with `rm` disables auto-updates. If the
build fails on them, work out how the updater behaves now instead of dropping the line.

Commit message: `Update version to <pkgver>`.
