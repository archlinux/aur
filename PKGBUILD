# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=dolfinx
pkgdesc="Next generation FEniCS problem solving environment"
pkgver=0.5.0
pkgrel=1
arch=(x86_64)
url="https://github.com/FEniCS/${pkgname}"
license=(LGPL3)
makedepends=(cmake)
depends=(boost xsimd python-fenics-ffcx hdf5-openmpi petsc parmetis pugixml)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
  ${pkgname}_algorithm.patch::${url}/pull/2323.patch)
sha512sums=('9bb93c155ca16386934e2643e8afa93fbbc5ffaf2fdf176013cf1eb4bad702a2d2b424568ac41dbe87a43d872fccc2eea66508fafd287748a99c5632c6b76e97'
  '6809d75b74e962dbd7a6bd0de1cb2a76c94192490f0eb1edc5dc82087c4a31b0cc55b141b4eb95d25ce0ffde5f122ff5b5b5ae848cf1d9976d5e5fa4b73c7675')

prepare() {
  cd ${pkgname}-${pkgver}
  # https://github.com/FEniCS/dolfinx/issues/2319
  patch -p1 -i ../${pkgname}_algorithm.patch
}

build() {
  cmake \
    -S ${pkgname}-${pkgver}/cpp \
    -B build-cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=20 \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -Wno-dev
  cmake --build build-cmake --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  install -Dm 644 ${pkgname}-${pkgver}/COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
