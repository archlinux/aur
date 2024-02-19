# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-ffmpeg-minimal
pkgver=6.1.1
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
_tag=6f4048827982a8f48f71f551a6e1ed2362816eec
source=("git+https://git.ffmpeg.org/ffmpeg.git?signed#tag=${_tag}")
sha256sums=('SKIP')
validpgpkeys=(DD1EC9E8DE085C629B3E1846B18E8928B3948D64) # Michael Niedermayer <michael@niedermayer.cc>
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_builds="static shared"

pkgver() {
  cd ffmpeg
  git describe --tags | sed 's/^n//'
}

build() {
  for _arch in ${_architectures}; do
    for _build in ${_builds}; do
      mkdir -p "${srcdir}"/build-${_arch}-${_build} && cd "${srcdir}"/build-${_arch}-${_build}

      "${srcdir}"/ffmpeg/configure \
        --prefix="/usr/${_arch}" \
        --enable-cross-compile \
        --cross-prefix="${_arch}-" \
        --target-os=mingw32 \
        --arch=${_arch%%-*} \
        --disable-debug \
        --disable-stripping \
        --enable-zlib \
        --disable-doc \
        --disable-encoder=flac \
        --x86asmexe=yasm \
        --enable-${_build}
      make
    done
  done
}

package() {
  for _arch in ${_architectures}; do
    for _build in ${_builds}; do
      cd "${srcdir}"/build-${_arch}-${_build}
      make DESTDIR="$pkgdir" install

      ${_arch}-strip -s "${pkgdir}"/usr/${_arch}/bin/*.exe
      ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
      [ ${_build} == shared ] && ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll

      [ ${_build} == shared ] && mv "${pkgdir}"/usr/${_arch}/bin/*.lib "${pkgdir}"/usr/${_arch}/lib/
      rm -rf "${pkgdir}"/usr/${_arch}/share
    done
  done
}

# vim:set ts=2 sw=2 et:
