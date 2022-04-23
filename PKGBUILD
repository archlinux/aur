# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=dune-subgrid
_tarver=2.8
_tar="${_tarver}/${pkgname}-releases-${_tarver}.tar.gz"
pkgver=${_tarver//-/_}
pkgrel=1
pkgdesc="Allows you to mark a subset of the elements of a given grid"
arch=('x86_64')
url="https://dune-project.org/modules/${pkgname}"
license=('GPL2')
depends=("dune-grid>=${_tarver}.0")
makedepends=('doxygen' 'graphviz')
source=(https://gitlab.dune-project.org/extensions/${pkgname}/-/archive/releases/${_tar})
sha512sums=('34892aa58e74054cd590244e0a1211f9a4d72c7945ac48080f7b25f9c26de88a32b81b3c0e24a7ce15c18c1ce37cd7b0b90330e3cde309eadd30f15d35c7b613')

build() {
  cmake \
    -S ${pkgname}-releases-${_tarver} \
    -B build-cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE \
    -DENABLE_HEADERCHECK=ON \
    -DCMAKE_DISABLE_FIND_PACKAGE_Vc=TRUE \
    -Wno-dev
  cmake --build build-cmake --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  install -Dm644 ${pkgname}-releases-${_tarver}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  find "${pkgdir}" -type d -empty -delete
}
