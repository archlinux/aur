# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-ffmpeg-minimal
pkgver=5.1.2
pkgrel=1
epoch=1
pkgdesc="Complete solution to record, convert and stream audio and video (mingw-w64)"
arch=('any')
url="http://ffmpeg.org/"
license=('LGPL')
depends=(
  'mingw-w64-crt'
  'mingw-w64-bzip2'
  'mingw-w64-zlib'
)
options=(!strip !buildflags staticlibs)
makedepends=('mingw-w64-gcc' 'mingw-w64-pkg-config' 'git' 'yasm')
provides=('mingw-w64-ffmpeg')
conflicts=('mingw-w64-ffmpeg')
_tag=1326fe9d4c85cca1ee774b072ef4fa337694f2e7
source=("git+https://git.ffmpeg.org/ffmpeg.git#tag=${_tag}")
sha256sums=('SKIP')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd ffmpeg
  git describe --tags | sed 's/^n//'
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}"/build-${_arch} && cd "${srcdir}"/build-${_arch}

    "${srcdir}"/ffmpeg/configure \
      --prefix="/usr/${_arch}" \
      --enable-cross-compile \
      --cross-prefix="${_arch}-" \
      --target-os=mingw32 \
      --arch=${_arch%%-*} \
      --disable-debug \
      --disable-stripping \
      --enable-zlib \
      --enable-shared \
      --disable-doc \
      --disable-encoder=flac \
      --x86asmexe=yasm

    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/build-${_arch}
    make DESTDIR="$pkgdir" install

    ${_arch}-strip -s "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a

    mv "${pkgdir}"/usr/${_arch}/bin/*.lib "${pkgdir}"/usr/${_arch}/lib/
    rm -rf "${pkgdir}"/usr/${_arch}/share
  done
}

# vim:set ts=2 sw=2 et:
