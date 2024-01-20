# Maintainer : Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>

pkgname=mingw-w64-ffmpeg
pkgver=6.1.1
pkgrel=1
epoch=1
pkgdesc="Complete solution to record, convert and stream audio and video (mingw-w64)"
arch=('any')
url="https://ffmpeg.org"
license=('GPL-3.0-only')
depends=(
  'mingw-w64-aom'
  'mingw-w64-crt'
  'mingw-w64-bzip2'
  'mingw-w64-fontconfig'
  'mingw-w64-fribidi'
  'mingw-w64-gmp'
  'mingw-w64-gnutls'
  'mingw-w64-gsm'
  'mingw-w64-harfbuzz'
  'mingw-w64-libjxl'
  'mingw-w64-lame'
  'mingw-w64-libass'
  'mingw-w64-libbluray'
  'mingw-w64-libbs2b'
  'mingw-w64-cairo'
  'mingw-w64-dav1d'
  'mingw-w64-libmodplug'
  'mingw-w64-libopenmpt'
  'mingw-w64-libsoxr'
  'mingw-w64-libtheora'
  'mingw-w64-vid.stab'
  'mingw-w64-libwebp'
  'mingw-w64-libxml2'
  'mingw-w64-vmaf'
  'mingw-w64-libvorbis'
  'mingw-w64-libvpx'
  'mingw-w64-opencore-amr'
  'mingw-w64-openjpeg2'
  'mingw-w64-opus'
  'mingw-w64-libplacebo'
  'mingw-w64-rav1e'
  'mingw-w64-librsvg'
  'mingw-w64-libssh'
  'mingw-w64-sdl2'
  'mingw-w64-snappy'
  'mingw-w64-speex'
  'mingw-w64-srt'
  'mingw-w64-vulkan-icd-loader'
  'mingw-w64-x264'
  'mingw-w64-xvidcore'
  'mingw-w64-zimg'
  'mingw-w64-zlib'
  'mingw-w64-x265'
)
# 'mingw-w64-rubberband'
# 'mingw-w64-vapoursynth'
# 'mingw-w64-opencl-icd'
#'mingw-w64-svt-av1' (only 64 bit support)
options=(!strip !buildflags staticlibs)
makedepends=('mingw-w64-amf-headers' 'mingw-w64-avisynthplus' 'mingw-w64-frei0r-plugins' 'mingw-w64-gcc' 'mingw-w64-pkg-config' 'mingw-w64-vulkan-headers' 'git' 'yasm')
# 'mingw-w64-opencl-headers'
_tag=6f4048827982a8f48f71f551a6e1ed2362816eec
#source=("git+https://git.ffmpeg.org/ffmpeg.git#tag=n${pkgver}"
source=(git+https://git.ffmpeg.org/ffmpeg.git?signed#tag=${_tag}
        add-av_stream_get_first_dts-for-chromium.patch
        configure.patch)
b2sums=('SKIP'
        '555274228e09a233d92beb365d413ff5c718a782008075552cafb2130a3783cf976b51dfe4513c15777fb6e8397a34122d475080f2c4483e8feea5c0d878e6de'
        '7171cf5055c4356f9aeb42a5bb550b3380cad20fff8dc4e9114d4fbb17e95bfe40c1057c3b7188641a1d7b9d026105e3eb0175789d7af30c5999793dfddf97fb')
validpgpkeys=(DD1EC9E8DE085C629B3E1846B18E8928B3948D64) # Michael Niedermayer <michael@niedermayer.cc>

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ffmpeg

  patch -Np1 -i "${srcdir}/configure.patch"

  # FS#79281: fix assembling with binutil as >= 2.41
  git cherry-pick -n effadce6c756247ea8bae32dc13bb3e6f464f0eb
  # FS#77813: fix playing ogg files with mplayer
  git cherry-pick -n cbcc817353a019da4332ad43deb7bbc4e695d02a
  patch -Np1 -i "${srcdir}"/add-av_stream_get_first_dts-for-chromium.patch # https://crbug.com/1251779
  # use non-deprecated nvenc GUID for conftest
  git cherry-pick -n 03823ac0c6a38bd6ba972539e3203a592579792f
  git cherry-pick -n d2b46c1ef768bc31ba9180f6d469d5b8be677500
  # Fix VDPAU vo
  git cherry-pick -n e9c93009fc34ca9dfcf0c6f2ed90ef1df298abf7
  # Fix bug in av_fft_end
  git cherry-pick -n a562cfee2e214252f8b3f516527272ae32ef9532
  git cherry-pick -n 250471ea1745fc703eb346a2a662304536a311b1
}

pkgver() {
  cd ffmpeg

  git describe --tags | sed 's/^n//'
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}"/build-${_arch} && cd "${srcdir}"/build-${_arch}

    # avoid multiple definitions error
    export LDFLAGS="$LDFLAGS -Wl,--allow-multiple-definition"

    "${srcdir}"/ffmpeg/configure \
      --prefix="/usr/${_arch}" \
      --enable-cross-compile \
      --cross-prefix="${_arch}-" \
      --target-os=mingw32 \
      --arch=${_arch%%-*} \
      --disable-debug \
      --enable-static \
      --disable-stripping \
      --enable-amf \
      --enable-fontconfig \
      --enable-gmp \
      --enable-gnutls \
      --enable-gpl \
      --enable-avisynth \
      --enable-lto \
      --enable-libaom \
      --enable-libass \
      --enable-libbluray \
      --enable-libbs2b \
      --enable-libdav1d \
      --enable-libfreetype \
      --enable-frei0r \
      --enable-libfribidi \
      --enable-libgsm \
      --enable-libharfbuzz \
      --enable-libjxl \
      --enable-libmodplug \
      --enable-libmp3lame \
      --enable-libopencore_amrnb \
      --enable-libopencore_amrwb \
      --enable-libopenjpeg \
      --enable-libopenmpt \
      --enable-libopus \
      --enable-libplacebo \
      --enable-librav1e \
      --enable-librsvg \
      --enable-libsnappy \
      --enable-libsoxr \
      --enable-libspeex \
      --enable-libsrt \
      --enable-libssh \
      --enable-libtheora \
      --enable-libvidstab \
      --enable-libvmaf \
      --enable-libvorbis \
      --enable-libvpx \
      --enable-libwebp \
      --enable-libx264 \
      --enable-libx265 \
      --enable-libxml2 \
      --enable-libxvid \
      --enable-libzimg \
      --enable-opengl \
      --enable-zlib \
      --enable-shared \
      --enable-version3 \
      --enable-vulkan \
      --disable-doc \
      --x86asmexe=yasm

# Requires vsscript (which depends on cross compiling vapoursynth python modules)
#      --enable-vapoursynth \
# Enable opencl if mingw-w64-opencl-icd works
#      --enable-opencl \
# (only  64 bit support)
#      --enable-libsvtav1 \

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
