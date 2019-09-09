# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=pixelpulse2-git
pkgver=1.0.4.r1.g972b7e8
pkgrel=1
pkgdesc="A user interface for analog systems exploration."
arch=('i686' 'x86_64')
url="https://github.com/analogdevicesinc/Pixelpulse2"
license=('custom:MPLv2')
depends=('libusb' 'qt5-quickcontrols')
makedepends=('git')
install=${pkgname}.install
source=("$pkgname::git+https://github.com/analogdevicesinc/Pixelpulse2.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  git submodule update --init
}

build() {
  cd $pkgname
  mkdir -p build
  cd build
  qmake-qt5 ..
  make
}

package() {
  cd $pkgname

  # Install the license
  install -d "$pkgdir"/usr/share/licenses/pixelpulse2-git/
  install -m 644 LICENSE "$pkgdir"/usr/share/licenses/pixelpulse2-git/

  # Install the executable
  install -d "$pkgdir"/usr/bin/
  install -m 755 build/pixelpulse2 "$pkgdir"/usr/bin/

  # freedesktop.org support
  install -d "$pkgdir"/usr/share/applications/
  install -m 644 debian/pixelpulse2.desktop "$pkgdir"/usr/share/applications/
  install -d "$pkgdir"/usr/share/icons/
  install -m 644 debian/pp2.png "$pkgdir"/usr/share/icons/
}
