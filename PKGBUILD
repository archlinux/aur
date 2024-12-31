# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Peter Lewis <plewis@aur.archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Jesse Juhani Jaara <jesse.jaara@gmail.com>

pkgname=lib32-libmikmod
pkgver=3.3.12
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
b2sums=('5bbade5a17ea7fdb79c27936575cc5ccc70a0581a1a3a88479cc60ca7640dfe6f83d84687024a60a1e79f20fd9d0acab9fef82ee6d9d089017f7dafab6ef27e0')

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
