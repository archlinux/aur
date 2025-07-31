# Maintainer: Sylvain POULAIN <sylvain.poulain at giscan dot com>
# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Hannes Graeuler < hgraeule [at] uos [dot] de >

pkgname=sfcgal
pkgver=2.2.0
pkgrel=1
pkgdesc="Wrapper around the CGAL library that intents to implement 2D and 3D operations on OGC standards models"
arch=('i686' 'x86_64')
url="https://gitlab.com/Oslandia/SFCGAL"
license=('GPL3')
provides=('sfcgal')
depends=('cgal' 'boost-libs' 'gmp' 'mpfr' 'openscenegraph')
#replaces=('sfcgal')
makedepends=('git' 'cmake' 'boost')
source=("https://gitlab.com/Oslandia/sfcgal/-/archive/v${pkgver}/SFCGAL-v${pkgver}.tar.gz")
sha256sums=('bb6bb77ddb58523d8c229764de23699f99c1a7011d873419afd2a67df85602a2')

build() {
  cd "${srcdir}/SFCGAL-v${pkgver}"
  mkdir -p build && cd build
  cmake -Wno-dev \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_EXE_LINKER_FLAGS="-lgmp -lmpfr" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DGMP_INCLUDE_DIR=/usr/include \
    -DGMP_LIBRARIES=/usr/lib/libgmp.so \
    -DSFCGAL_BUILD_EXAMPLES=1 \
    -DSFCGAL_BUILD_TESTS=0 \
    ..
  make
}

package() {
  cd ${srcdir}/SFCGAL-v${pkgver}/build
  make DESTDIR=${pkgdir} install
  # Remove conflict with cgal package
  rm -rf ${pkgdir}/usr/include/CGAL
}
