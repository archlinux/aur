# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Dominik Heidler <dheidler@gmail.com>

pkgname=gqrx
pkgver=2.16
pkgrel=1
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
sha256sums=('eab65f490da22c3f276366f418af37803bd0d51d8d31b1ce7fdd4cac47932456')
b2sums=('0523be1f678c8966a0f973776ed4db71b9856334df528996a1790f74454124e72a3cbe51ae75dae3b5d02794a5dde8c0d06a0ea69d5886bd5678f630504c84df')

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
