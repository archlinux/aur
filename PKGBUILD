# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=osmid
pkgver=0.8.0
pkgrel=2
pkgdesc="A lightweight, portable, easy to use tool to convert MIDI to OSC and OSC to MIDI"
arch=(x86_64)
url="https://github.com/llloret/osmid"
license=(
  GPL2
  MIT
)
groups=(pro-audio)
depends=(
  gcc-libs
  glibc
)
makedepends=(
  alsa-lib
  cmake
  libx11
)
source=($url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('279159790c0214780576cca6483883f71c19923a0bb623b62d7ea6f9ac08f82144c09b1237ffafcf8bba88fbd4fee3bd956570dee8f5f160c88538ce18ccaf8e')
b2sums=('3544d7a4de0ba1a82ad8d42ff9997cc518ded825ffa73491e665552769047005f97ff52138e3b5653beb37d57ab336c3bfc9aa68527c5646b60c132e8af61117')

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
    alsa-lib libasound.so
  )

  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $pkgname-$pkgver/LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 $pkgname-$pkgver/README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
