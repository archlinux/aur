# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Peter Lewis <plewis@aur.archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Jesse Juhani Jaara <jesse.jaara@gmail.com>

pkgname=lib32-libmikmod
pkgver=3.3.13
pkgrel=1
pkgdesc="Module player library supporting many formats, including MOD, S3M, IT and XM (32-bit)"
url="https://mikmod.sourceforge.net"
license=(LGPL-2.0-or-later)
arch=(x86_64)
depends=(
  lib32-glibc
  libmikmod
)
makedepends=(
  cmake
  git
  lib32-alsa-lib
  lib32-libpulse
  ninja
)
provides=(libmikmod.so)
source=(
  "git+https://git.code.sf.net/p/mikmod/mikmod#tag=libmikmod-$pkgver"
)
b2sums=('4a5001249655eae7b6a93c4d3a79de93ae58b702bc3fa7ebc5fa16d8006b749f4eeb365fdcf0ea8fa0d47affa1932f99a31e9bfdaab516b0e1d5ee873cc3c5c6')

prepare() {
  cd mikmod
}

build() {
  local cmake_options=(
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_LIBDIR=lib32
    -D CMAKE_INSTALL_PREFIX=/usr
    -D ENABLE_DL=1
  )

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  cmake -S mikmod/libmikmod -B build -G Ninja "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -r "$pkgdir"/usr/{bin,include}
}

# vim:set sw=2 sts=-1 et:
