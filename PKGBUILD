# Maintainer: David Runge <dave@sleepmap.de>
pkgname=crypted-backups-git
pkgver=0.1.r11.gf07a4a2
_pkg=crypted-backups
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
source=("${_pkg}::git://sleepmap.de/software/${_pkg}.git")
noextract=()
sha512sums=('SKIP')

build() {
  cd "$srcdir"
}

pkgver() {
  cd "$srcdir/$_pkg"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/$_pkg"
  install -d ${pkgdir}/usr/lib/systemd/scripts/
  install -Dm 755 scripts/* ${pkgdir}/usr/lib/systemd/scripts/
  install -Dm 644 README.rst ${pkgdir}/usr/share/doc/${_pkg}/README.rst
  install -d ${pkgdir}/usr/lib/systemd/system/
  install -Dm 644 system/* ${pkgdir}/usr/lib/systemd/system/
  install -d ${pkgdir}/usr/lib/systemd/user/
  install -Dm 644 user/* ${pkgdir}/usr/lib/systemd/user/
  install -Dm 644 config/system/${_pkg} ${pkgdir}/etc/${_pkg}
  install -Dm 644 config/user/${_pkg} ${pkgdir}/etc/skel/".${_pkg}"
}

# vim:set ts=2 sw=2 et:
