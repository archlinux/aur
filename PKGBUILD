# Maintainer: shadowvolt <v3259914@gmail.com>

pkgname=i686-elf-gcc-baremetal
pkgver=15.2.0
pkgrel=2
pkgdesc="GCC for cross-compiler to i686-elf (bare metal)"
arch=('x86_64')
url="https://gcc.gnu.org/"
license=('GPL-3.0-or-later')
depends=('i686-elf-binutils-baremetal')
makedepends=('gmp' 'libmpc' 'mpfr' 'libisl')
options=(!debug)

_target=i686-elf
_prefix=/opt/i686-elf
_cores=$(nproc)

source=(
  "https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz"
  "https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz.sig"
)
sha256sums=('a7b39bc69cbf9e25826c5a60ab26477001f7c08d85cec04bc0e29cabed6f3cc9'
            'SKIP')

validpgpkeys=('D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62')

prepare() {
  cd "$srcdir/gcc-$pkgver"
}

build() {
  cd "$srcdir"
  mkdir -p build-gcc
  cd build-gcc

  ../gcc-$pkgver/configure \
    --target=$_target \
    --prefix=$_prefix \
    --disable-nls \
    --enable-languages=c,c++ \
    --without-headers \
    --disable-hosted-libstdcxx

  make -j$_cores all-gcc
  make -j$_cores all-target-libgcc
  make -j$_cores all-target-libstdc++-v3
}

package() {
  cd "$srcdir/build-gcc"

  make DESTDIR="$pkgdir" install-gcc
  make DESTDIR="$pkgdir" install-target-libgcc
  make DESTDIR="$pkgdir" install-target-libstdc++-v3

  rm -rf "$pkgdir/usr/src/debug"
}

provides=("$_target-gcc")
conflicts=("$_target-gcc")

