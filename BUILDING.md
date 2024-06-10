# Building

### Check For Updates

- [upstream](https://www.keepalived.org/download.html)

### Process

- make changes as needed
- update PKGBUILD > pkgver to new upstream version
- increment PKGBUILD > pkgrel
- test locally as needed
- generate new .SRCINFO: `makepkg --printsrcinfo > .SRCINFO`
- add changes to git: `git add`
- commit: `git commit -m '...'`
- push to origin: `git push origin`
- push to aur: `git push aur`
