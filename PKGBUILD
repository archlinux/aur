# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-dpms-helper-bzr
pkgver=r1
pkgrel=1
pkgdesc='Script and settings for X DPMS'
arch=('any')
url='https://code.launchpad.net/~elementary-pantheon/elementaryos/pantheon-dpms-helper'
license=('GPL')
groups=('pantheon-unstable')
depends=('gnome-settings-daemon')
provides=('pantheon-dpms-helper')
conflicts=('pantheon-dpms-helper')
replaces=('elementary-dpms-helper-bzr')
makedepends=('bzr' 'cmake')
source=('bzr+lp:~elementary-pantheon/elementaryos/pantheon-dpms-helper')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-dpms-helper

  echo "r$(bzr revno)"
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  cmake ../pantheon-dpms-helper \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DGSETTINGS_COMPILE='OFF'

  make
}

package() {
  cd build

  make DESTDIR="${pkgdir}" install

  cd ../pantheon-dpms-helper/dpms

  install -dm 755 "${pkgdir}"/{etc/xdg/autostart,usr/bin}
  install -m 755 pantheon-dpms-helper "${pkgdir}"/usr/bin/
  install -m 644 pantheon-dpms-helper.desktop "${pkgdir}"/etc/xdg/autostart/
}

# vim: ts=2 sw=2 et:
