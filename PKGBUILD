# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=dune-subgrid
_tarver=2.9
_tar="${_tarver}/${pkgname}-releases-${_tarver}.tar.gz"
pkgver="${_tarver}"
pkgrel=1
pkgdesc="Allows you to mark a subset of the elements of a given grid"
arch=(x86_64)
url="https://dune-project.org/modules/${pkgname}"
license=('GPL2')
depends=("dune-grid>=${_tarver}")
makedepends=(doxygen graphviz)
source=(https://gitlab.dune-project.org/extensions/${pkgname}/-/archive/releases/${_tar})
sha512sums=('6f89b0bbf3b5d34a985da98e3c46d652019ea012cc3e38904b87f0a3cf1192ab7eb9385846c157aa6d704ec0ffc2bad6ee7dc0ea3f5adad177cbb1d006c52c86')

prepare() {
  sed -i 's/^Version: '"${pkgver}"'-git/Version: '"${pkgver}"'/' ${pkgname}-releases-${_tarver}/dune.module
}

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
    -DCMAKE_C_FLAGS='-Wall -fdiagnostics-color=always' \
    -DALLOW_CXXFLAGS_OVERWRITE=ON \
    -DCMAKE_CXX_FLAGS="-Wall -fdiagnostics-color=always -mavx" \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
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