# Maintainer : Karl-Felix Glatzer <karl.glatzer@gmx.de>

pkgname=mingw-w64-ffmpeg
pkgver=3.2.4
pkgrel=1
epoch=1
pkgdesc="Complete solution to record, convert and stream audio and video (mingw-w64)"
arch=('any')
url="http://ffmpeg.org/"
license=('GPL3')
#TODO: Needs fixed mingw-w64-netcdf package
#'mingw-w64-netcdf' 'mingw-w64-opencore-amr' 'mingw-w64-openjpeg' 'mingw-w64-opus' 'mingw-w64-libssh' 'mingw-w64-schroedinger'
depends=(
'mingw-w64-crt' 'mingw-w64-bzip2' 'mingw-w64-fontconfig' 'mingw-w64-fribidi' 'mingw-w64-gmp' 'mingw-w64-gnutls'
'mingw-w64-gsm' 'mingw-w64-lame' 'mingw-w64-libass' 'mingw-w64-libbluray' 'mingw-w64-libmodplug'
'mingw-w64-libsoxr' 'mingw-w64-libtheora' 'mingw-w64-vid.stab' 'mingw-w64-libwebp' 'mingw-w64-libvorbis' 'mingw-w64-libvpx'
'mingw-w64-opencore-amr' 'mingw-w64-openjpeg2' 'mingw-w64-opus' 'mingw-w64-libssh' 'mingw-w64-schroedinger'
'mingw-w64-sdl2' 'mingw-w64-speex' 'mingw-w64-x264' 'mingw-w64-xvidcore' 'mingw-w64-zlib' 'mingw-w64-x265'
)
options=(!strip !buildflags staticlibs)
makedepends=('mingw-w64-gcc' 'mingw-w64-pkg-config' 'yasm')
source=(https://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.xz{,.asc})
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8')
sha256sums=('6e38ff14f080c98b58cf5967573501b8cb586e3a173b591f3807d8f0660daf7a'
            'SKIP')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}"/build-${_arch} && cd "${srcdir}"/build-${_arch}

    #TODO: Add --enable-netcdf (under --enable-libxvid) when mingw-w64-netcdf Package is fixed
    "${srcdir}"/ffmpeg-${pkgver}/configure \
      --prefix="/usr/${_arch}" \
      --enable-cross-compile \
      --cross-prefix="${_arch}-" \
      --target-os=mingw32 \
      --arch=${_arch%%-*} \
      --disable-debug \
      --enable-static \
      --disable-stripping \
      --enable-avisynth \
      --enable-avresample \
      --enable-fontconfig \
      --enable-gmp \
      --enable-gnutls \
      --enable-gpl \
      --enable-libass \
      --enable-libbluray \
      --enable-libfreetype \
      --enable-libfribidi \
      --enable-libgsm \
      --enable-libmodplug \
      --enable-libmp3lame \
      --enable-libopencore_amrnb \
      --enable-libopencore_amrwb \
      --enable-libopenjpeg \
      --enable-libopus \
      --enable-libschroedinger \
      --enable-libsoxr \
      --enable-libspeex \
      --enable-libssh \
      --enable-libtheora \
      --enable-libvidstab \
      --enable-libvorbis \
      --enable-libvpx \
      --enable-libwebp \
      --enable-libx264 \
      --enable-libx265 \
      --enable-libxvid \
      --enable-zlib \
      --enable-shared \
      --enable-version3 \
      --disable-doc \
      --disable-programs

    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/build-${_arch}
    make DESTDIR="$pkgdir" install

    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a

    mv "${pkgdir}"/usr/${_arch}/bin/*.lib "${pkgdir}"/usr/${_arch}/lib/
  done
}

# vim:set ts=2 sw=2 et:
