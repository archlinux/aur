# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Andrew Whatson <whatson@gmail.com>
# Contributor: Jake <aur@ja-ke.tech>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Hans Janssen <hans@janserv.xs4all.nl>
# Contributor: Edoardo Morandi <morandidodo@gmail.com>

pkgname=simgear
pkgver=2020.3.19
_pkgver=${pkgver%.*}
pkgrel=1
pkgdesc="A set of open-source libraries designed to be used as building blocks for quickly assembling 3d simulations, games, and visualization applications."
arch=('x86_64')
url="http://home.flightgear.org/"
license=('GPL')
depends=('glu' 'glut' 'freealut' 'plib' 'openscenegraph')
makedepends=('boost' 'cmake' 'mesa')
options=('staticlibs')
source=(
    "https://downloads.sourceforge.net/project/flightgear/release-${_pkgver}/${pkgname}-${pkgver}.tar.bz2"
    "compositor-pass-missing-array-include.patch"
)
sha256sums=(
    '3b937c5b94422478e5d79114bdcd6c78e43a0a6ffba97544a86d441c3f9e8c3a'
    '81f817ba0f54952ac5fea32ec717275cdb9804f9801def9ae1a00f019bcf968b'
)

prepare() {
    cd "$pkgname-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/compositor-pass-missing-array-include.patch"
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
