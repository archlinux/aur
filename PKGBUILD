pkgname=mingw-w64-gcc132
pkgver=13.2.0
pkgrel=1
pkgdesc="Cross GCC for the MinGW-w64 cross-compiler"
arch=('x86_64' 'aarch64')
url="https://gcc.gnu.org"
license=('GPL' 'LGPL' 'FDL' 'custom')
groups=('mingw-w64-toolchain' 'mingw-w64')
depends=('zlib' 'libisl' 'libmpc' 'mingw-w64-crt' 'mingw-w64-binutils' 'mingw-w64-winpthreads' 'mingw-w64-headers')
# gcc-d doesn't build as of 13.1.0
makedepends=("gcc-ada")
provides=("mingw-w64-gcc")
conflicts=("mingw-w64-gcc")
options=('!strip' 'staticlibs' '!emptydirs' '!buildflags')
source=(https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz{,.sig})
validpgpkeys=(D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62  # Jakub Jelinek <jakub@redhat.com>
              13975A70E63C361C73AE69EF6EEB81F8981C74C7) # richard.guenther@gmail.com
sha512sums=('d99e4826a70db04504467e349e9fbaedaa5870766cda7c5cab50cdebedc4be755ebca5b789e1232a34a20be1a0b60097de9280efe47bdb71c73251e30b0862a2'
            'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  ln -sf gcc-${pkgver/+/-} gcc
  cd gcc

  # mmapio.c:69:14: error: implicit declaration of function ‘getpagesize’
  sed -i 's|\-Werror||g' libbacktrace/configure
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
