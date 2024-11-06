# Maintainer: Josh Hoffer < hoffer dot joshua at gmail dot com >
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lukas Böger <dev___AT___lboeger___DOT___de>
pkgname=dune-typetree
_tarver=2.10.0
_tar="${_tarver}/${pkgname}-${_tarver}.tar.gz"
pkgver="${_tarver}"
pkgrel=1
pkgdesc="Template library for constructing and operating on statically typed trees of objects"
arch=(x86_64)
url="https://dune-project.org/modules/${pkgname}"
license=(LGPL-3.0-or-later LicenseRef-GPL-2.0-only-with-DUNE-exception)
depends=("dune-common>=${pkgver}")
makedepends=(doxygen graphviz)
optdepends=('doxygen: Generate the class documentation from C++ sources'
  'graphviz: Graph visualization software')
options=(!emptydirs)
source=(https://dune-project.org/download/${_tar}{,.asc})
sha512sums=('c5e2ba7e5ba3cb47b188d76f747378d3316b3e6b2f1c57bb75724f1f1f92ebba90b549f8bf4f9cc2720764fb47f08941deaed582b31e390eb62333a32c0f6060'
            'SKIP')
validpgpkeys=('703607A1FD9AF4205E735522B95BE0EFB19724A1') # Simon Praetorius <simon.praetorius@tu-dresden.de>

build() {
  cmake \
    -S ${pkgname}-${pkgver} \
    -B build-cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=20 \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_C_FLAGS='-Wall -fdiagnostics-color=always' \
    -DCMAKE_CXX_FLAGS="-Wall -fdiagnostics-color=always -mavx" \
    -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE \
    -DENABLE_HEADERCHECK=ON \
    -Wno-dev
  cmake --build build-cmake --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  install -Dm644 ${pkgname}-${pkgver}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
