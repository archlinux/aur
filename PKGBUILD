# Maintainer: David Runge <dave@sleepmap.de>
pkgname=rts-git
pkgver=r11.45d13ba
_basename=rts
pkgrel=2
pkgdesc="Collection of scripts and systemd services to be used exclusively on linux-rt.\ Enables setting CPU scheduling policies and priorities (amongst others) (during boot) using tuna."
arch=('any')
url="https://sleepmap.de/projects/rts"
license=('GPL3')
groups=()
depends=('linux-rt' 'tuna')
makedepends=('git')
provides=('rts')
conflicts=('rts')
replaces=()
backup=('etc/rts/rts')
options=()
install=
source=('bare/rts::git://sleepmap.de/rts.git')
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
  install -Dm 644 LICENSE ${pkgdir}/usr/share/licenses/${_basename}/LICENSE
  install -d ${pkgdir}/usr/lib/systemd/system/
  install -Dm 644 system/* ${pkgdir}/usr/lib/systemd/system/
  install -d ${pkgdir}/etc/${_basename}/examples/
  install -Dm 644 config/examples/* ${pkgdir}/etc/${_basename}/examples/
  install -Dm 644 config/${_basename} ${pkgdir}/etc/${_basename}/${_basename}
}

# vim:set ts=2 sw=2 et:
