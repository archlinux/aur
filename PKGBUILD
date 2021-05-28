# The PKGBUILD is directly dumped from asp
# Maintainer: chn <g897331845@gmail.com>

pkgname=mingw-w64-gcc-11
pkgver=11.1.0
_islver=0.24
pkgrel=1
pkgdesc="Cross GCC for the MinGW-w64 cross-compiler"
arch=('x86_64' 'aarch64')
url="https://gcc.gnu.org"
license=('GPL' 'LGPL' 'FDL' 'custom')
groups=('mingw-w64-toolchain' 'mingw-w64')
depends=('zlib' 'libmpc' 'mingw-w64-crt' 'mingw-w64-binutils' 'mingw-w64-winpthreads' 'mingw-w64-headers')
makedepends=("gcc-ada>=${pkgver:0:2}")
provides=('mingw-w64-gcc')
conflicts=('mingw-w64-gcc')
options=('!strip' 'staticlibs' '!emptydirs' '!buildflags')
source=(https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz{,.sig}
       "http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2"
       https://raw.githubusercontent.com/msys2/MINGW-packages/master/mingw-w64-gcc/0020-libgomp-Don-t-hard-code-MS-printf-attributes.patch)
sha512sums=('fd6bba0f67ff48069d03073d1a9b5e896383b1cfc9dde008e868e60a9ec5014a837d56af0ecbf467b3fb9b37ec74a676e819a18b44393a0a3c4280175b5d7ad8'
            'SKIP'
            'aab3bddbda96b801d0f56d2869f943157aad52a6f6e6a61745edd740234c635c38231af20bc3f1a08d416a5e973a90e18249078ed8e4ae2f1d5de57658738e95'
            '8266eae8b3be5557e8cd79c21b6326db7cd83604db6d6ad83923798650fcd8d0f9f1f4ed424c816a48e91f21fb1852ab9272c73100b219f07d3bbb566bfd6fae')


_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  ln -sf gcc-${pkgver/+/-} gcc
  cd gcc

  # https://sourceforge.net/p/mingw-w64/bugs/853/
  patch -p1 -i ../0020-libgomp-Don-t-hard-code-MS-printf-attributes.patch

  # mmapio.c:69:14: error: implicit declaration of function ‘getpagesize’
  sed -i 's|\-Werror||g' libbacktrace/configure

  # link isl for in-tree builds
  ln -sf ../isl-${_islver} isl
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p "$srcdir"/build-${_arch} && cd "$srcdir"/build-${_arch}
    "$srcdir"/gcc/configure --prefix=/usr --libexecdir=/usr/lib \
        --target=${_arch} \
        --with-bugurl=https://bugs.archlinux.org/ \
        --enable-languages=c,lto,c++,ada,objc,obj-c++,fortran \
        --enable-shared --enable-static \
        --enable-threads=posix --enable-fully-dynamic-string \
        --enable-libstdcxx-time=yes --enable-libstdcxx-filesystem-ts=yes \
        --with-system-zlib --enable-cloog-backend=isl \
        --enable-lto --enable-libgomp \
        --disable-multilib --enable-checking=release \
        --disable-sjlj-exceptions --with-dwarf2
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
