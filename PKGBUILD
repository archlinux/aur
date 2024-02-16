# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Dominik Heidler <dheidler@gmail.com>

pkgname=gqrx
pkgver=2.17.4
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
)
source=(https://github.com/gqrx-sdr/$pkgname/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha256sums=('06be55cd8ccadd3cb08218a4234f94c5c2bcd9e7b63a775650e473115e93d4e7')
b2sums=('30e34a6277d88922739c0ab6398628055002edc61375f29279a000c36eb1023895927f7f339ae55a2b1b1ae63c526f52689b6191250dd250eb44eee779090546')

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
