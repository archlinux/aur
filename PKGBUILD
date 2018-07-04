# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>

pkgname=mingw-w64-fribidi
pkgver=1.0.4
pkgrel=2
pkgdesc="A Free Implementation of the Unicode Bidirectional Algorithm (mingw-w64)"
arch=('any')
license=('LGPL')
url="http://fribidi.org"
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' '!libtool' 'staticlibs')
makedepends=('mingw-w64-gcc' 'mingw-w64-meson' 'mingw-w64-wine' 'git')
_commit=902618192f1cdb4430e4f2dfc032d9fb36fccc5b  # tags/v1.0.4^0
source=("git+https://github.com/fribidi/fribidi#commit=$_commit")
md5sums=('SKIP')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  export NEED_WINE=1
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/fribidi/build-${_arch} && cd ${srcdir}/fribidi/build-${_arch}

    ${_arch}-meson .. --default-library both -D docs=false
    ninja
  done
}

check() {
  export NEED_WINE=1
  for _arch in ${_architectures}; do
    cd ${srcdir}/fribidi/build-${_arch}
    meson test ..
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/fribidi/build-${_arch}
    DESTDIR="${pkgdir}" ninja install

    #FIXME: Ranlib (isn't meson supposed to do this?)
    ${_arch}-ranlib ${pkgdir}/usr/${_arch}/lib/*.a

    ${_arch}-strip -s ${pkgdir}/usr/${_arch}/bin/*.exe
    ${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
  done
}
