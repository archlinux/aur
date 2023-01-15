# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Dominik Heidler <dheidler@gmail.com>

pkgname=gqrx
pkgver=2.15.9
pkgrel=4
pkgdesc="Interactive SDR receiver waterfall for many devices."
arch=(x86_64)
url="http://gqrx.dk/"
license=(GPL3)
depends=(gcc-libs glibc hicolor-icon-theme libvolk qt6-base qt6-svg)
makedepends=(
  boost
  cmake
  gnuradio
  gnuradio-osmosdr
  libpulse
  libvolk
)
source=(https://github.com/gqrx-sdr/$pkgname/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha256sums=('4a826b468b2fb38a59cbe1f1b566e62c3114509186a7a25ba27dc92833f3eb44')
b2sums=('0864e8b33efe12cbc77dc75bf9bb2c5938655e40710a99ff72da2f1bdb43bc4c2f964c1fe4d88136891417c16eed16444d8fad699f80ab8fe164bb18d62d23f6')

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -S $pkgname-$pkgver
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  depends+=(
    gnuradio libgnuradio-{analog,blocks,digital,fft,filter,network,pmt,runtime}.so
    gnuradio-osmosdr libgnuradio-osmosdr.so
    libpulse libpulse.so libpulse-simple.so
  )

  DESTDIR="$pkgdir" cmake --install build
}
