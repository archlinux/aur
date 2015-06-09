# Maintainer : Karl-Felix Glatzer <karl.glatzer@gmx.de>
pkgname=mingw-w64-x264
pkgver=144.20150223
pkgrel=1
epoch=1
pkgdesc='free library for encoding H264/AVC video streams (mingw-w64)'
arch=('any')
url='http://www.videolan.org/developers/x264.html'
license=('GPL')
depends=('mingw-w64-crt')
#provides=('mingw-w64-libx264.so')
options=(!strip !buildflags staticlibs)
makedepends=('mingw-w64-gcc' 'yasm' 'git')
source=(git://git.videolan.org/x264.git#commit=c8a773ebf)
md5sums=('SKIP')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd x264
  local _ver=$(grep '#define X264_BUILD' x264.h | cut -d' ' -f3)
  local _date=$(git log -1 --format="%cd" --date=short | tr -d -)

  echo ${_ver}.${_date}
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/build-${_arch} && cd ${srcdir}/build-${_arch}

    unset LDFLAGS CPPFLAGS
    ${srcdir}/x264/configure --host=${_arch} \
      --cross-prefix="${_arch}-" \
      --enable-win32thread \
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
      install

    ${_arch}-strip --strip-unneeded ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
    rm ${pkgdir}/usr/${_arch}/bin/*.exe
  done
}

# vim:set ts=2 sw=2 et:
