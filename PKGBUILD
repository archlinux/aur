# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=dune-vtk
_tarver=v2.8.0
_tar="${_tarver}/${pkgname}-${_tarver}.tar.gz"
pkgver=${_tarver/v/}
pkgrel=1
pkgdesc="File reader and writer for the VTK XML Format"
arch=('x86_64')
url="https://dune-project.org/modules/${pkgname}"
license=('LGPL3' 'custom:GPL2 with runtime exception')
depends=('dune-grid>=2.8.0' 'dune-localfunctions>=2.8.0')
makedepends=('doxygen' 'graphviz')
optdepends=('doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software')
source=(https://gitlab.dune-project.org/extensions/${pkgname}/-/archive/${_tar})
sha512sums=('ba9d96a743a0322e126e7c2168c81b1b74d1142d0c73c0024b9c721c5fc10c5eaaf7a867db2a4fb8be3e8e311e74dbb935ff327c87fd3e370657da62aa0a0c6e')

prepare() {
  sed -i 's/^Version: '"${pkgver%.0}"'/Version: '"${pkgver}"'/' ${pkgname}-${_tarver}/dune.module
}

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
  install -Dm644 ${pkgname}-${_tarver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  find "${pkgdir}" -type d -empty -delete
}
