# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>

pkgname=mingw-w64-fribidi
pkgver=1.0.2
pkgrel=1
pkgdesc="A Free Implementation of the Unicode Bidirectional Algorithm (mingw-w64)"
arch=('any')
license=('LGPL')
url="http://fribidi.org"
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' '!libtool' 'staticlibs')
makedepends=('mingw-w64-gcc' 'mingw-w64-meson' 'git')
_commit=f2c9d50722cb60d0cdec3b1bafba9029770e86b4  # tags/v1.0.2^0
source=("git+https://github.com/fribidi/fribidi#commit=$_commit")
md5sums=('SKIP')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/fribidi/build-${_arch} && cd ${srcdir}/fribidi/build-${_arch}

    ${_arch}-meson .. -D docs=false
    ninja
  done
}

check() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/fribidi/build-${_arch}
    meson test ..
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/fribidi/build-${_arch}
    DESTDIR="${pkgdir}" ninja install

    ${_arch}-strip -s ${pkgdir}/usr/${_arch}/bin/*.exe
    ${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
  done
}
