# Maintainer: sfn
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=kfr
pkgver=6.3.1
pkgrel=1
pkgdesc="Fast, modern C++ DSP framework, FFT, Sample Rate Conversion,
FIR/IIR/Biquad Filters (SSE, AVX, AVX-512, ARM NEON)"
url="https://www.kfrlib.com/"
arch=(x86_64)
license=('GPL-2')
makedepends=(cmake)
depends=()
source=("${pkgname}-${pkgver}::git+https://github.com/kfrlib/kfr#tag=$pkgver")
sha256sums=('c382d7bf97b3422917a28afb3269355f4fb80baccc6210c2ba53dd2ed981dfa5')

CFLAGS+=" -ffat-lto-objects" # lto problems with static libs
CXXFLAGS+=" -ffat-lto-objects" # lto problems with static libs

build() {
  mkdir -p "$srcdir/${pkgname}-${pkgver}/build"
  cd "$srcdir/${pkgname}-${pkgver}/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
  		-DCMAKE_BUILD_TYPE=Release \
        -DKFR_ENABLE_DFT=ON \
        -DKFR_ENABLE_MULTIARCH=ON \
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
        ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  DESTDIR=${pkgdir} make install
}
