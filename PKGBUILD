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
pkgrel=2
pkgdesc="A set of open-source libraries designed to be used as building blocks for quickly assembling 3d simulations, games, and visualization applications."
arch=('x86_64')
url="http://home.flightgear.org/"
license=('GPL')
depends=('glu' 'glut' 'freealut' 'plib' 'openscenegraph')
makedepends=('boost' 'cmake' 'mesa')
source=("${pkgname}-${pkgver}.tar.bz2"::"https://downloads.sourceforge.net/project/flightgear/release-${_pkgver}/${pkgname}-${pkgver}.tar.bz2"
        "compositor-pass-missing-array-include.patch")
sha256sums=('3b937c5b94422478e5d79114bdcd6c78e43a0a6ffba97544a86d441c3f9e8c3a'
            '81f817ba0f54952ac5fea32ec717275cdb9804f9801def9ae1a00f019bcf968b')

prepare() {
    cd "$pkgname-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/compositor-pass-missing-array-include.patch"
}

build() {
  mkdir -p "$srcdir"/sgbuild
  cd "$srcdir"/sgbuild
  cmake \
    -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
    -DSIMGEAR_SHARED=ON \
    -DENABLE_TESTS=OFF \
    ../simgear-${pkgver}
  make
}

package() {
  cd "$srcdir"/sgbuild
  make DESTDIR=${pkgdir} install
}
