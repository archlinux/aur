# Maintainer: Sylvain POULAIN <sylvain.poulain at giscan dot com>
# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Hannes Graeuler < hgraeule [at] uos [dot] de >

pkgname=sfcgal
pkgver=2.3.0
pkgrel=2
pkgdesc="Wrapper around the CGAL library that intents to implement 2D and 3D operations on OGC standards models"
arch=('i686' 'x86_64')
url="https://gitlab.com/Oslandia/SFCGAL"
license=('GPLv2+')
provides=('sfcgal')
depends=('cgal' 'boost-libs' 'gmp' 'mpfr' 'openscenegraph' 'eigen')
#replaces=('sfcgal')
makedepends=('git' 'cmake' 'boost')
source=("https://gitlab.com/Oslandia/sfcgal/-/archive/v${pkgver}/SFCGAL-v${pkgver}.tar.gz"
       "fix_boos189.patch::https://gitlab.com/sfcgal/SFCGAL/-/merge_requests/539.patch"
)
sha256sums=('5f6aa1838e5ae31523ebf410cde0240b7a88d7e062b7ffff945e4fae2aaba0fa'
            'c65259a0d4916083fa8b0a5ab57f6d7f781d5a9739b25a8c254f5ae4edd2cc98')


prepare() {
  cd "${srcdir}/SFCGAL-v${pkgver}"
  # Fix build with Boost 1.89
  # See https://gitlab.com/sfcgal/SFCGAL/-/merge_requests/539
  # patch -Np1 -i "$srcdir"/fix_boos189.patch

}

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
    -DSFCGAL_WITH_EIGEN=ON \
    -DSFCGAL_BUILD_VIEWER=1 \
    -DSFCGAL_BUILD_EXAMPLES=1 \
    -DSFCGAL_BUILD_TESTS=1 \
    ..
  make
}

package() {
  cd ${srcdir}/SFCGAL-v${pkgver}/build
  make DESTDIR=${pkgdir} install
  # Remove conflict with cgal package
  rm -rf ${pkgdir}/usr/include/CGAL
}
