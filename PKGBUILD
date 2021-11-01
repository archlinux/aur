# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=dune-vtk
_tarver=2.8
_tar="${_tarver}/${pkgname}-releases-${_tarver}.tar.gz"
pkgver=${_tarver}
pkgrel=1
pkgdesc="File reader and writer for the VTK XML Format"
arch=('x86_64')
url="https://dune-project.org/modules/${pkgname}"
license=('LGPL3' 'custom:GPL2 with runtime exception')
depends=('dune-grid>=2.8.0' 'dune-localfunctions>=2.8.0')
makedepends=('doxygen' 'graphviz')
optdepends=('doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software')
source=(https://gitlab.dune-project.org/extensions/${pkgname}/-/archive/releases/${_tar})
sha512sums=('f6e76ff97168bcd22b9273375a9c12e908b298740dcd14e6d5d40338b419d3b191c2d2b95e0c7c1e10f2c50c4deb80fcdc637ecf13855e2379cc9fc66b24976e')

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
