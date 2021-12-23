# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=dune-curvedgeometry
_tarver=2.8
_tar="${_tarver}/${pkgname}-releases-${_tarver}.tar.gz"
pkgver=${_tarver}
pkgrel=1
pkgdesc="Implementation of curved dune geometries by lagrange parametrization"
arch=('x86_64')
url="https://dune-project.org/modules/${pkgname}"
license=('LGPL3' 'custom:GPL2 with runtime exception')
groups=('dune-iwr')
depends=('dune-geometry>=2.8.0')
makedepends=('doxygen' 'graphviz')
optdepends=('doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software'
  'dune-localfunctions: for Lagrange local finite elements'
  'dune-grid: for create YaspGrid mesh'
  'dune-vtk: for write VTK files')
source=(https://gitlab.com/iwr/${pkgname}/-/archive/releases/${_tar})
sha512sums=('ea3aff59674d90bba0240eafe8a099b16bbcd35113821aced3d7ddd2d9343a2c3dd74e2567da7af497c6fed61ada8407b00dde2c65078f23d40e76c239a58ff1')

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
