# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=dune-curvedgeometry
_tarver=2.9
_tar="${_tarver}/${pkgname}-releases-${_tarver}.tar.gz"
pkgver=${_tarver}
pkgrel=1
pkgdesc="Implementation of curved dune geometries by lagrange parametrization"
arch=(x86_64)
url="https://dune-project.org/modules/${pkgname}"
license=('LGPL3' 'custom:GPL2 with runtime exception')
groups=(dune-iwr)
depends=('dune-geometry>=2.9.0')
makedepends=(doxygen graphviz)
optdepends=('doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software'
  'dune-localfunctions: for Lagrange local finite elements'
  'dune-grid: for create YaspGrid mesh'
  'dune-vtk: for write VTK files')
source=(https://gitlab.com/iwr/${pkgname}/-/archive/releases/${_tar})
sha512sums=('0702b2d5665c207cacb56c0b1f538e945e4ceccf4f270603eea5c296192f04b37a4ec1d4c14668a07977c5bf34c93c2b56cc34781a6a2c2a1db4b155f7802d74')

build() {
  cmake \
    -S ${pkgname}-releases-${_tarver} \
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
  install -Dm644 ${pkgname}-releases-${_tarver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  find "${pkgdir}" -type d -empty -delete
}
