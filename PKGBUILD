# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=contractor-bzr
pkgver=r136
pkgrel=1
pkgdesc='A service for sharing data between apps'
arch=('i686' 'x86_64')
url='https://launchpad.net/contractor'
license=('GPL3')
groups=('pantheon-unstable')
depends=('libgee')
makedepends=('bzr' 'cmake' 'seahorse' 'vala')
optdepends=('brasero: Burn Disc context menu entries'
            'file-roller: Archive context menu entries'
            'gnome-bluetooth: Bluetooth context-menu entry'
            'inkscape: Inkscape context menu entry')
provides=('contractor')
conflicts=('contractor')
source=('bzr+lp:contractor'
        'bzr+http://bazaar.launchpad.net/~elementary-os/contractor/elementary-contracts/')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd contractor

  echo "r$(bzr revno)"
}

build() {
  cd contractor

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd contractor/build

  make DESTDIR="${pkgdir}" install

  install -dm 755 "${pkgdir}"/usr/share/contractor
  for _app in brasero file-roller gnome-bluetooth gnome-wallpaper inkscape; do
    install -m 644 "${srcdir}"/elementary-contracts/${_app}/*.contract "${pkgdir}"/usr/share/contractor/
  done
  install -dm 755 "${pkgdir}"/usr/lib/svg-contracts
  install -m 755 "${srcdir}"/elementary-contracts/inkscape/inkscape-export.sh "${pkgdir}"/usr/lib/svg-contracts
}

# vim: ts=2 sw=2 et:
