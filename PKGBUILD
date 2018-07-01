# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Michel Zou <xantares09@hotmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: rubenvb vanboxem <dottie> ruben <attie> gmail <dottie> com

_targets="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-gcc-fs
pkgver=8.1.0
_islver=0.18
pkgrel=1
pkgdesc="Cross GCC for the MinGW-w64 cross-compiler with builtin filesystem support"
arch=('x86_64')
url="http://gcc.gnu.org"
license=('GPL' 'LGPL' 'FDL' 'custom')
depends=('zlib' 'libmpc'
	 'mingw-w64-crt' 'mingw-w64-binutils' 'mingw-w64-winpthreads'
	 'mingw-w64-headers')
makedepends=("gcc-ada")
#checkdepends=('dejagnu') # Windows executables could run on Arch through bin_mft and Wine
optdepends=()
provides=('mingw-w64-gcc-base' 'mingw-w64-gcc')
conflicts=('mingw-w64-gcc')
replaces=()
backup=()
options=('!strip' 'staticlibs' '!emptydirs' '!buildflags')
#source=(https://sources.archlinux.org/other/gcc/gcc-${pkgver/+/-}.tar.xz{,.sig}
source=(https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz{,.sig}
       "http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2"
        bz85638.patch
        gcc-8.1.0-filesystem.patch)
validpgpkeys=(F3691687D867B81B51CE07D9BBE43771487328A9  # bpiotrowski@archlinux.org
              13975A70E63C361C73AE69EF6EEB81F8981C74C7  # richard.guenther@gmail.com
              33C235A34C46AA3FFB293709A328C3A2C3C45C06) # Jakub Jelinek <jakub@redhat.com>
sha256sums=('1d1866f992626e61349a1ccd0b8d5253816222cdc13390dcfaa74b093aa2b153'
            'SKIP'
            '6b8b0fd7f81d0a957beb3679c81bbb34ccc7568d5682844d8924424a0dadcb1b'
            'd2a13f550ca7f9131ef14239e8f994b37c81fc8c59f73aff5edab170f5ed6124'
            '256bd8757e5f90c85e0b332120122af2491d6d5be350a42af481fbdc884569c0')

prepare() {
  ln -sf gcc-${pkgver/+/-} gcc
  cd "$srcdir"/gcc
  # link isl for in-tree builds
  ln -sf ../isl-${_islver} isl

  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85638
  patch -p0 -i "$srcdir"/bz85638.patch

  # Fix up std::filesystem
  # TODO: Build a new version of this patch optimized for 8.1.0
  patch -p1 -i "$srcdir"/gcc-8.1.0-filesystem.patch
}

build() {
  for _target in ${_targets}; do
    mkdir -p "$srcdir"/gcc-build-${_target} && cd "$srcdir"/gcc-build-${_target}

    "$srcdir"/gcc/configure --prefix=/usr --libexecdir=/usr/lib \
        --target=${_target} \
        --enable-languages=c,lto,c++,objc,obj-c++,fortran,ada \
        --enable-shared --enable-static \
        --enable-threads=posix --enable-fully-dynamic-string --enable-libstdcxx-time=yes \
        --with-system-zlib --enable-cloog-backend=isl \
        --enable-lto --disable-dw2-exceptions --enable-libgomp \
        --disable-multilib --enable-checking=release --enable-libstdcxx-filesystem-ts=yes
    make all
  done
}

package() {
  for _target in ${_targets}; do
    cd "$srcdir"/gcc-build-${_target}
    make DESTDIR="$pkgdir" install
    ${_target}-strip "$pkgdir"/usr/${_target}/lib/*.dll
    strip "$pkgdir"/usr/bin/${_target}-*
    strip "$pkgdir"/usr/lib/gcc/${_target}/${pkgver:0:5}/{cc1*,collect2,gnat1,f951,lto*}
    ln -s ${_target}-gcc "$pkgdir"/usr/bin/${_target}-cc
    # mv dlls
    mkdir -p "$pkgdir"/usr/${_target}/bin/
    mv "$pkgdir"/usr/${_target}/lib/*.dll "$pkgdir"/usr/${_target}/bin/
  done
  strip "$pkgdir"/usr/bin/*
  # remove unnecessary files
  rm -r "$pkgdir"/usr/share
  rm -f "$pkgdir"/usr/lib/libcc1.so*
  rm -f "$pkgdir"/usr/lib/libcc1.a
}
