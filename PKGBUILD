# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Dominik Heidler <dheidler@gmail.com>

pkgname=gqrx
pkgver=2.17
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
sha256sums=('ff2ef407605a5c0236d5654ef8696f8cd578c1096e39cc01df8300c583b01b11')
b2sums=('98f2810fea3001a11650e7d655f0f0630d0fc4d538f0b2e44e8862a35f86066048e293aed7bbb98c92d4efe8e46e1484f32f498f7d5c09ed299c48bc61e43d84')

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
