# Maintainer: Andrew Whatson <whatson@gmail.com>
# Contributor: Jake <aur@ja-ke.tech>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Hans Janssen <hans@janserv.xs4all.nl>

pkgname=simgear
pkgver=2020.3.5
_pkgver=${pkgver%.*}
pkgrel=1
pkgdesc="A set of open-source libraries designed to be used as building blocks for quickly assembling 3d simulations, games, and visualization applications."
arch=('x86_64')
url="http://home.flightgear.org/"
license=('GPL')
depends=('glu' 'glut' 'freealut' 'plib' 'openscenegraph')
makedepends=('boost' 'cmake' 'mesa')
options=('staticlibs')
source=("https://downloads.sourceforge.net/project/flightgear/release-${_pkgver}/${pkgname}-${pkgver}.tar.bz2"
        'fix-split-iterator.patch')
sha256sums=('eb42497da30e13354098e8d08b72633dc9321b3452fcef15b98dfdd30c511c41'
            '98d0601342dfcb9125cb3002666603b150450cd86b9a4c5b29d235ed8341aaa6')

prepare() {
  cd "$srcdir"/simgear-${pkgver}
  patch -p1 -i ../fix-split-iterator.patch
}

build() {
  rm -rf "$srcdir"/simgear-build
  mkdir "$srcdir"/simgear-build
  cd "$srcdir"/simgear-build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_TESTS=off \
    ../simgear-${pkgver}
  make
}

package() {
  cd "$srcdir"/simgear-build
  make DESTDIR="$pkgdir" install
}
