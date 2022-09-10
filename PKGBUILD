# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=basix
pkgdesc="FEniCS finite element basis evaluation library"
pkgver=0.5.0.post0
pkgrel=2
arch=(x86_64)
url="https://github.com/FEniCS/${pkgname}"
license=(MIT)
depends=(lapack xtensor)
makedepends=(cmake)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
  ${pkgname}_docs.patch::${url}/pull/592.patch)
sha512sums=('cadce6b4935200714f4f25b0fd72a9ee3484ab319104b9c80d2653218787418bf8f42bee7c3dcec83669c809460538442b4244474a5bbe59688b207b6b892faf'
  '9b931a9637f6c7821e68bc2893b73230e07afd3c06ba4f7752b06184da4649ef7bb3474ef651bdbe800cc6a8da5f3a95d98c092d7a15b44ef7d6a32b5e70def6')

prepare() {
  cd ${pkgname}-${pkgver}
  # https://github.com/FEniCS/basix/issues/591
  patch -p1 -i ../${pkgname}_docs.patch
}

build() {
  cmake \
    -S ${pkgname}-${pkgver}/cpp \
    -B build-cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_CXX_STANDARD=20 \
    -DCMAKE_CXX_COMPILER=g++ \
    -DDOWNLOAD_XTENSOR_LIBS=OFF \
    -DXTENSOR_OPTIMIZE=ON \
    -Wno-dev
  cmake --build build-cmake --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build-cmake --target install
  install -Dm 644 ${pkgname}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
