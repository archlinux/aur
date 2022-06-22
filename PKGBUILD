# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=dolfinx
pkgdesc="Next generation FEniCS problem solving environment"
pkgver=0.4.1
pkgrel=1
arch=(any)
url="https://github.com/FEniCS/${pkgname}"
license=(LGPL3)
makedepends=(cmake)
depends=(boost xsimd python-fenics-ffcx hdf5-openmpi petsc parmetis)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz ${pkgname}_openmpi.patch::${url}/commit/c8164e88e2cd2ec3af0b7426deee1987421920ec.diff)
sha512sums=('b0824e48ad2ea23db7ca93af390891a09bd6a975f28501fc870dcf555d951764625b04614d4c28eeecb690bb95e9443ba6be52ae4e31ea51c5475fdd7710c56b'
  '1e7ba9361e3296db65350d24ed1bb080c9a5d38f254fa6d7721b230774a273d49d5f606de67adc14dcc5e1527be7c7ce8276eaac9c4662a8d7e5d7aa441b8249')

prepare() {
  cd ${pkgname}-${pkgver}
  # https://github.com/FEniCS/dolfinx/issues/2229
  patch -p1 -i ../${pkgname}_openmpi.patch
}

build() {
  cmake \
    -S ${pkgname}-${pkgver}/cpp \
    -B build-cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -Wno-dev
  cmake --build build-cmake --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  install -Dm 644 ${pkgname}-${pkgver}/COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
