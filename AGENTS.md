# Before upgrading spendo-git

Run `./update-pkgver.sh` in this directory to sync the hardcoded `pkgver` in
`PKGBUILD` and `.SRCINFO` with the upstream HEAD.

This prevents `paru` from re-evaluating `pkgver()` against live git and
falsely flagging the package as upgradable every time.
