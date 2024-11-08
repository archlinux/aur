# Building

### Check For Updates

- [upstream](https://www.keepalived.org/download.html)

### Process

- make changes as needed
- update PKGBUILD > pkgver to new upstream version
    + __note:__ also update the PKGBUILD > md5sums with the md5sum of the new release!
- increment PKGBUILD > pkgrel
- test locally as needed
- generate new .SRCINFO: `makepkg --printsrcinfo > .SRCINFO`
- add changes to git: `git add`
- commit: `git commit -m '...'`
- push to origin: `git push origin`
- push to aur: `git push aur`

You should see the new version in [aur](https://aur.archlinux.org/packages/keepalived-openrc) right away; however, it may take ~5-10m to be available for pull/install.
