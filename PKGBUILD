# Maintainer: sfn
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=kfr
pkgver=7.0.1
pkgrel=1
pkgdesc="Fast, modern C++ DSP framework, FFT, Sample Rate Conversion,
FIR/IIR/Biquad Filters (SSE, AVX, AVX-512, ARM NEON)"
url="https://www.kfrlib.com/"
arch=(x86_64)
license=('GPL-2')
makedepends=(cmake)
depends=()
source=("${pkgname}::git+https://github.com/kfrlib/kfr#tag=$pkgver")
sha256sums=('3bb23bf010c2319b6362348582c65b74a8921c790f07bf51d22de1b30bb38ec7')

CFLAGS+=" -ffat-lto-objects" # lto problems with static libs
CXXFLAGS+=" -ffat-lto-objects" # lto problems with static libs

build() {
  mkdir -p "$srcdir/${pkgname}/build"
  cd "$srcdir/${pkgname}/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
  		-DCMAKE_BUILD_TYPE=Release \
        -DKFR_ENABLE_DFT=ON \
        -DKFR_ENABLE_MULTIARCH=ON \
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
        ..
  make
}

package() {
  cd "${srcdir}/${pkgname}/build"
  DESTDIR=${pkgdir} make install
}
