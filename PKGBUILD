# Maintainer: Krzysztof Demir Kuźniak <krzys...@gmail.com>

pkgname=x86_64-kuznix-elf-gcc
pkgver=15.2.0
pkgrel=1
pkgdesc="GCC cross compiler for x86_64-kuznix-elf (C and C++)"
arch=('x86_64')
url="https://gcc.gnu.org"
license=('GPL3')
depends=('glibc' 'gmp' 'mpfr' 'libmpc' 'zlib')
makedepends=('binutils' 'x86_64-kuznix-elf-binutils' 'make' 'texinfo' 'flex' 'bison' 'patch' 'gcc')
options=('!strip' '!buildflags' 'staticlibs')

# Use Polish mirror
source=("ftp://ftp.icm.edu.pl/pub/gnu/gcc/gcc-${pkgver}/gcc-${pkgver}.tar.xz")
sha256sums=('SKIP')

_target=x86_64-kuznix-elf
_prefix=/opt/kuznix-tools
_builddir="gcc-build"

build() {
  cd "$srcdir"
  rm -rf "$_builddir"
  mkdir "$_builddir" && cd "$_builddir"

  ../gcc-${pkgver}/configure \
    --target=${_target} \
    --prefix=${_prefix} \
    --disable-nls \
    --enable-languages=c,c++ \
    --without-headers \
    --disable-shared \
    --disable-multilib \
    --disable-threads \
    --disable-libssp \
    --disable-libquadmath \
    --disable-libatomic \
    --disable-libgomp \
    --disable-libstdcxx-pch \
    --with-newlib

  make all-gcc
}

check() {
  cd "$_builddir"
  make -k check || true
}

package() {
  cd "$_builddir"
  make DESTDIR="$pkgdir" install-gcc
}
