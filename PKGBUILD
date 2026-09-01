# Maintainer: bemxio <bemxiov@protonmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Peter Jung <ptr1337@archlinux.org>

pkgname=mingw-w64-gcc-msvcrt
pkgver=16.2.0
pkgrel=1
pkgdesc="Cross GCC for the MinGW-w64 cross-compiler (w/ MSVCRT as C runtime library)"
arch=('x86_64')
url="https://gcc.gnu.org"
license=(GPL-3.0-with-GCC-exception GFDL-1.3-or-later)
groups=('mingw-w64-toolchain-msvcrt' 'mingw-w64-msvcrt')
depends=(
  bash
  libgcc
  libstdc++
  glibc
  gmp
  libisl
  libmpc
  mingw-w64-binutils
  mingw-w64-crt-msvcrt
  mingw-w64-headers-msvcrt
  mingw-w64-winpthreads
  mpfr
  python
  zlib
  zstd
)
provides=("mingw-w64-gcc=${pkgver}")
conflicts=('mingw-w64-gcc')
# gcc-d doesn't build as of 13.1.0
makedepends=('gcc-ada')
options=('staticlibs' '!emptydirs' '!buildflags')
source=(https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz{,.sig})
validpgpkeys=(D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62  # Jakub Jelinek <jakub@redhat.com>
              13975A70E63C361C73AE69EF6EEB81F8981C74C7) # richard.guenther@gmail.com
sha512sums=('c51c30ca7422d0cbecf504b2e0f33c3aca31e0f90a76b65217f465163fa6fa17b3f5de39e145c47e5bab90ac0ce7fff3b03c8d553ae36e01faaea5a50f8648d1'
            'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  ln -sf gcc-${pkgver/+/-} gcc
  cd gcc

  # mmapio.c:69:14: error: implicit declaration of function ‘getpagesize’
  sed -i 's|\-Werror||g' libbacktrace/configure
  # Ada fails to compile, fix it with including the correct headers
  sed -i '/#include "mingw32.h"/a #include <stdlib.h>' gcc/ada/rtinit.c
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p "$srcdir"/build-${_arch} && cd "$srcdir"/build-${_arch}
    "$srcdir"/gcc/configure --prefix=/usr --libexecdir=/usr/lib \
        --target=${_arch} \
        --with-bugurl=https://bugs.archlinux.org/ \
        --enable-languages=ada,c,c++,fortran,lto,objc,obj-c++ \
        --enable-shared --enable-static \
        --enable-threads=posix --enable-fully-dynamic-string \
        --enable-libstdcxx-time=yes --enable-libstdcxx-filesystem-ts=yes \
        --with-system-zlib --enable-cloog-backend=isl \
        --enable-lto --enable-libgomp \
        --disable-multilib --enable-checking=release \
        --disable-sjlj-exceptions --with-dwarf2 \
        --enable-tls
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/build-${_arch}
    make DESTDIR="$pkgdir" install
    ${_arch}-strip "$pkgdir"/usr/${_arch}/lib/*.dll
    strip "$pkgdir"/usr/bin/${_arch}-*
    strip "$pkgdir"/usr/lib/gcc/${_arch}/${pkgver}/{cc1*,collect2,gnat1,f951,lto*}
    ln -s ${_arch}-gcc "$pkgdir"/usr/bin/${_arch}-cc
    # mv dlls
    mkdir -p "$pkgdir"/usr/${_arch}/bin/
    mv "$pkgdir"/usr/${_arch}/lib/*.dll "$pkgdir"/usr/${_arch}/bin/
  done
  strip "$pkgdir"/usr/bin/*
  # remove unnecessary files
  rm -r "$pkgdir"/usr/share
  rm "$pkgdir"/usr/lib/libcc1.*
}
