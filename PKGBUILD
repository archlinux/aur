# Maintainer: Josh Hoffer < hoffer dot joshua at gmail dot com >
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lukas Böger <dev___AT___lboeger___DOT___de>
pkgname=dune-typetree
_tarver=2.9
_tar="${_tarver}/${pkgname}-releases-${_tarver}.tar.gz"
pkgver="${_tarver}"
pkgrel=1
pkgdesc="Template library for constructing and operating on statically typed trees of objects"
arch=(x86_64)
url="https://dune-project.org/modules/${pkgname}"
license=('LGPL3' 'custom:GPL2 with runtime exception')
depends=("dune-common>=${pkgver}")
makedepends=(doxygen graphviz)
optdepends=('doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software')
source=(https://gitlab.dune-project.org/staging/${pkgname}/-/archive/releases/${_tar})
sha512sums=('ad6465dd95a05aee189a859413070755e21d212ad7eff335dbe4792c3cb72d6d8a66987540ff4bc7b6c61f99c465ceb005ef75d05b91cac60a892ab3446e047b')

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
    -DCMAKE_C_FLAGS='-Wall -fdiagnostics-color=always' \
    -DCMAKE_CXX_FLAGS="-Wall -fdiagnostics-color=always -mavx" \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE \
    -DENABLE_HEADERCHECK=ON \
    -Wno-dev
  cmake --build build-cmake --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  install -Dm644 ${pkgname}-releases-${_tarver}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  find "${pkgdir}" -type d -empty -delete
}
