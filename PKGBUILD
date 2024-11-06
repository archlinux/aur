# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=dune-grid-glue
_tarver=2.10
_tar="${_tarver}/${pkgname}-releases-${_tarver}.tar.gz"
pkgver=${_tarver}
pkgrel=1
pkgdesc="Transfer data between independent DUNE grids"
arch=(x86_64)
url="https://dune-project.org/modules/${pkgname}"
license=(LGPL-3.0-or-later LicenseRef-GPL-2.0-only-with-DUNE-exception)
depends=("dune-grid>=${pkgver}")
makedepends=(doxygen graphviz)
optdepends=('doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software')
options=(!emptydirs)
source=(https://gitlab.dune-project.org/extensions/${pkgname}/-/archive/releases/${_tar})
sha512sums=('3f5290d6a105e51f9136c4fb02c5525f059fe581ebcc292d716b2326831f7884cedfc217fe8d6de0a756720820fca8b93b63f0da1efa758d13f008b300100afd')

build() {
  cmake \
    -S ${pkgname}-releases-${_tarver} \
    -B build-cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=20 \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE \
    -DENABLE_HEADERCHECK=ON \
    -Wno-dev
  cmake --build build-cmake --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  install -Dm644 ${pkgname}-releases-${_tarver}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
