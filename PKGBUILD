# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=dune-foamgrid
_tarver=2.8.0
_tar="${_tarver}/${pkgname}-${_tarver}.tar.gz"
pkgver=${_tarver}
pkgrel=1
pkgdesc="Implementation of the dune-grid interface that implements one- and two-dimensional grids in a physical space of arbitrary dimension"
arch=('x86_64')
url="https://www.dune-project.org/modules/${pkgname}"
license=('LGPL3' 'custom:GPL2 with runtime exception')
depends=('dune-grid>=2.8.0')
makedepends=('doxygen' 'graphviz')
optdepends=('doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software')
source=(https://gitlab.dune-project.org/extensions/${pkgname}/-/archive/${_tar})
sha512sums=('22461026de973d72f5094a9010b61fac0e92c74105bc31765b29a4eb73350c3cbbd2e805985fdc5874816a140cda0cd73945e480deb894a12c522eabe22a8343')

build() {
  cmake \
    -S ${pkgname}-${_tarver} \
    -B build-cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE \
    -DENABLE_HEADERCHECK=ON \
    -Wno-dev
  cmake --build build-cmake --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  install -Dm644 ${pkgname}-${_tarver}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  find "${pkgdir}" -type d -empty -delete
}
