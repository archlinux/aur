# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=dune-subgrid
_tarver=2.10
_tar="${_tarver}/${pkgname}-releases-${_tarver}.tar.gz"
pkgver="${_tarver}"
pkgrel=1
pkgdesc="Allows you to mark a subset of the elements of a given grid"
arch=(x86_64)
url="https://dune-project.org/modules/${pkgname}"
license=(GPL-2.0-or-later)
depends=("dune-grid>=${_tarver}")
makedepends=(doxygen graphviz)
options=(!emptydirs)
source=(https://gitlab.dune-project.org/extensions/${pkgname}/-/archive/releases/${_tar})
sha512sums=('86474b87fd1e31889dd23bd5192c805c4d7bed479a21aa4e5e5353be72d82dbe28edc12660c81f830676d067888c371b5526283c3d5bc77bf118a2ee6088e8ae')

build() {
  cmake \
    -S ${pkgname}-releases-${_tarver} \
    -B build-cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=20 \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_C_FLAGS='-Wall -fdiagnostics-color=always' \
    -DCMAKE_CXX_FLAGS="-Wall -fdiagnostics-color=always -mavx" \
    -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE \
    -DENABLE_HEADERCHECK=ON \
    -DCMAKE_DISABLE_FIND_PACKAGE_Vc=TRUE \
    -Wno-dev
  cmake --build build-cmake --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  install -Dm644 ${pkgname}-releases-${_tarver}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
