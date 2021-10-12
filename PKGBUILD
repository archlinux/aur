# Maintainer : Karl-Felix Glatzer <karl.glatzer@gmx.de>
pkgname=mingw-w64-x264
pkgver=0.163.r3060.5db6aa6
pkgrel=1
epoch=3
pkgdesc='Open Source H264/AVC video encoder (mingw-w64)'
arch=('any')
url='http://www.videolan.org/developers/x264.html'
license=('GPL')
depends=('mingw-w64-crt' 'mingw-w64-l-smash')
#provides=('mingw-w64-libx264.so')
options=(!strip !buildflags staticlibs)
makedepends=('mingw-w64-gcc' 'git' 'nasm')
_commit=5db6aa6cab1b146e07b60cc1736a01f21da01154
source=(git+https://code.videolan.org/videolan/x264.git#commit=${_commit})
sha256sums=(SKIP)
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd x264

  ./version.sh | grep X264_POINTVER | sed -r 's/^#define X264_POINTVER "([0-9]+\.[0-9]+)\.([0-9]+) (.*)"$/\1.r\2.\3/'
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/build-${_arch} && cd ${srcdir}/build-${_arch}

    unset LDFLAGS CPPFLAGS
    ${srcdir}/x264/configure --host=${_arch} \
      --cross-prefix="${_arch}-" \
      --enable-shared \
      --enable-static \
      --disable-avs

    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/build-${_arch}
    make DESTDIR="$pkgdir" \
      bindir=/usr/${_arch}/bin \
      libdir=/usr/${_arch}/lib \
      includedir=/usr/${_arch}/include \
      install install-cli install-lib-shared

    ${_arch}-strip -s ${pkgdir}/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
  done
}

# vim:set ts=2 sw=2 et:
