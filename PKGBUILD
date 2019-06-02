# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Hannes Graeuler < hgraeule [at] uos [dot] de >

pkgname=sfcgal
pkgver=1.3.6
pkgrel=1
pkgdesc="Wrapper around the CGAL library that intents to implement 2D and 3D operations on OGC standards models"
arch=('i686' 'x86_64')
url="https://oslandia.github.io/SFCGAL/index.html"
license=('GPL2')
provides=('sfcgal')
depends=('cgal>=4.1' 'boost' 'gmp' 'mpfr' 'openscenegraph')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Oslandia/SFCGAL/archive/v${pkgver}.tar.gz"
        "cgal-4.14.patch")
sha256sums=('5840192eb4a1a4e500f65eedfebacd4bc4b9192c696ea51d719732dc2c75530a'
            '64b7c850fc7ed576e5a13c69ce5e8352ef63d800c4dcea23c77883ca9231d6ed')

prepare() {
  cd ${srcdir}/SFCGAL-${pkgver}
  # Fix for use with cgal version 4.14
  # See https://github.com/Oslandia/SFCGAL/pull/189
  patch -Np1 -i ${srcdir}/cgal-4.14.patch
}

build() {
  cd ${srcdir}/SFCGAL-${pkgver}
  mkdir -p build && cd build
  cmake -Wno-dev \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DSFCGAL_BUILD_EXAMPLES=0 \
    -DSFCGAL_BUILD_TESTS=0 \
    ..
  make
}

package() {
  cd ${srcdir}/SFCGAL-${pkgver}/build
  make DESTDIR=${pkgdir} install
  # Remove conflict with cgal package
  rm -rf ${pkgdir}/usr/include/CGAL
}
