# Contributor: Brian Bidulock <bidulock@openss7.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ctwm-bzr
pkgver=4.1.0.beta706
pkgrel=1
pkgdesc="Claude's Tab Window Manager"
arch=('i686' 'x86_64')		
url="http://ctwm.org/"
license=('custom:MIT/X Consortium')
provides=('ctwm')
conflicts=('ctwm')
depends=('libxmu' 'libxpm' 'libjpeg')
makedepends=('breezy' 'cmake')
source=("${pkgname%-bzr}::bzr+https://code.launchpad.net/~ctwm/ctwm/trunk")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname//-bzr/}
  printf $s%s $(cat VERSION|tr - .|sed 's+post+r+') $(bzr revno)
}

build() {
  cd ${pkgname//-bzr/}
  [ -d build ] || mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd ${pkgname//-bzr/}
  cd build
  sed -e 's,/lib64/,/lib/,g' -i cmake_install.cmake
  make DESTDIR="$pkgdir" install
  install -Dm0644 ../COPYRIGHT "$pkgdir"/usr/share/licenses/$pkgname/COPYRIGHT
}
