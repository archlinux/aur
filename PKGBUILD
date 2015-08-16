# Maintainer: David Runge <dave@sleepmap.de>
pkgname=crypted-backups-git
pkgver=0.1.r0.g3700dbe
_basename=crypted-backups
pkgrel=1
pkgdesc="Backup scripts using systemd timer/service units and gpg encryption"
arch=('any')
url="https://sleepmap.de/projects/crypted-backups"
license=('GPL3')
groups=()
depends=('xz')
makedepends=('git')
provides=('crypted-backups')
conflicts=('crypted-backups')
replaces=()
backup=('etc/crypted-backups')
options=()
install=
source=('bare/crypted-backups::git://sleepmap.de/crypted-backups.git')
noextract=()
md5sums=('SKIP')

build() {
  cd "$srcdir"
}

pkgver() {
  cd "$srcdir/$_basename"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/$_basename"
  install -d ${pkgdir}/usr/lib/systemd/scripts/
  install -Dm 755 scripts/* ${pkgdir}/usr/lib/systemd/scripts/
  install -Dm 644 README.md ${pkgdir}/usr/share/doc/${_basename}/README.md
  install -d ${pkgdir}/usr/lib/systemd/system/
  install -Dm 644 system/* ${pkgdir}/usr/lib/systemd/system/
  install -d ${pkgdir}/usr/lib/systemd/user/
  install -Dm 644 user/* ${pkgdir}/usr/lib/systemd/user/
  install -Dm 644 config/system/${_basename} ${pkgdir}/etc/${_basename}
  install -Dm 644 config/user/${_basename} ${pkgdir}/etc/skel/".${_basename}"
}

# vim:set ts=2 sw=2 et:
