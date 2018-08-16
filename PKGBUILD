# Maintainer : Karl-Felix Glatzer <karl.glatzer@gmx.de>
pkgname=mingw-w64-x264
pkgver=155.r0a84d986
pkgrel=1
epoch=2
pkgdesc='Open Source H264/AVC video encoder (mingw-w64)'
arch=('any')
url='http://www.videolan.org/developers/x264.html'
license=('GPL')
depends=('mingw-w64-crt' 'mingw-w64-ffmpeg' 'mingw-w64-l-smash')
#provides=('mingw-w64-libx264.so')
options=(!strip !buildflags staticlibs)
makedepends=('mingw-w64-gcc' 'git' 'nasm')
_commit='0a84d986e7020f8344f00752e3600b9769cc1e85'
source=(git://git.videolan.org/x264.git#commit=${_commit})
md5sums=('SKIP')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd x264
  local _ver=$(grep '#define X264_BUILD' x264.h | cut -d' ' -f3)
  local _rev=$(git rev-parse --short HEAD)

  echo ${_ver}.r${_rev}
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/build-${_arch} && cd ${srcdir}/build-${_arch}

    unset LDFLAGS CPPFLAGS
    ${srcdir}/x264/configure --host=${_arch} \
      --cross-prefix="${_arch}-" \
      --enable-shared \
      --enable-static

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
