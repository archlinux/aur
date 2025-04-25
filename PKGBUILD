# Maintainer : Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>

pkgname=mingw-w64-ffmpeg
pkgver=7.1.1
pkgrel=1
epoch=1
pkgdesc="Complete solution to record, convert and stream audio and video (mingw-w64)"
arch=('any')
url="https://ffmpeg.org"
license=('GPL-3.0-only')
depends=(
  'mingw-w64-aom'
  'mingw-w64-bzip2'
  'mingw-w64-crt'
  'mingw-w64-cairo'
  'mingw-w64-dav1d'
  'mingw-w64-fontconfig'
  'mingw-w64-fribidi'
  'mingw-w64-glslang'
  'mingw-w64-gmp'
  'mingw-w64-gnutls'
  'mingw-w64-gsm'
  'mingw-w64-harfbuzz'
  'mingw-w64-lame'
  'mingw-w64-libass'
  'mingw-w64-libbluray'
  'mingw-w64-libbs2b'
  'mingw-w64-libdvdnav'
  'mingw-w64-libdvdread'
  'mingw-w64-libjxl'
  'mingw-w64-libmodplug'
  'mingw-w64-libopenmpt'
  'mingw-w64-libplacebo'
  'mingw-w64-librsvg'
  'mingw-w64-libsoxr'
  'mingw-w64-libssh'
  'mingw-w64-libtheora'
  'mingw-w64-libvorbis'
  'mingw-w64-libvpx'
  'mingw-w64-libwebp'
  'mingw-w64-libxml2'
  'mingw-w64-vid.stab'
  'mingw-w64-vmaf'
  'mingw-w64-opencore-amr'
  'mingw-w64-openjpeg2'
  'mingw-w64-opus'
  'mingw-w64-rav1e'
  'mingw-w64-sdl2'
  'mingw-w64-snappy'
  'mingw-w64-speex'
  'mingw-w64-spirv-tools' # required by glslang
  'mingw-w64-srt'
  'mingw-w64-vulkan-icd-loader'
  'mingw-w64-x264'
  'mingw-w64-x265'
  'mingw-w64-xvidcore'
  'mingw-w64-zimg'
  'mingw-w64-zlib'
)

# 'mingw-w64-zeromq'
# 'mingw-w64-rubberband'
# 'mingw-w64-vapoursynth'
# 'mingw-w64-opencl-icd'
#'mingw-w64-svt-av1' (only 64 bit support)
options=(!strip !buildflags staticlibs !debug)
makedepends=('mingw-w64-amf-headers' 'mingw-w64-avisynthplus' 'mingw-w64-frei0r-plugins' 'mingw-w64-gcc' 'mingw-w64-pkg-config' 'mingw-w64-vulkan-headers' 'git' 'yasm')
# 'mingw-w64-opencl-headers'
_tag=a1328e68877e12ab5a6e5d92a84aefa566783ea5
source=(
  git+https://git.ffmpeg.org/ffmpeg.git?signed#tag=${_tag}
  0001-Add-av_stream_get_first_dts-for-Chromium.patch
  0002-avcodec-libsvtav1-unbreak-build-with-latest-svtav1.patch
  fix_build_with_v4l2_1.30.patch
  configure.patch
)
b2sums=('c7b1a56593f123de8e18b3b93c81dca4aff439f5701935cc1fe6316543e8c3256acd7f95b4a533eb7ba30e346fa13bf0ad5bff54b7822c088ef3939882416a7c'
        'e5f7b79f7731be9ee5a7280a9221fb531ac5a2d9820fc5870b68b0eabea667dfbe8f39f41c1e1763a4c84982896afaa54c81ff57847d203b70afafd726689e5d'
        'a32aeff68032a78d661011654bbdba138002833f7d17d23bba6f95479ca22bef5697eb9e7e4cb9e0b5140fc23eab3aab16fc60962d62809c3c02f890599a8332'
        'a713b3a4243cc5de3867f7c210172c094f50bd614c0c8be2c99d6161b06d43d9183ae9c442ac3056bfe06c28419e276d129b1235471466eedd340bf0c4780acb'
        '7171cf5055c4356f9aeb42a5bb550b3380cad20fff8dc4e9114d4fbb17e95bfe40c1057c3b7188641a1d7b9d026105e3eb0175789d7af30c5999793dfddf97fb')
validpgpkeys=(DD1EC9E8DE085C629B3E1846B18E8928B3948D64) # Michael Niedermayer <michael@niedermayer.cc>

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ffmpeg

  patch -Np1 -i "${srcdir}/configure.patch"

  # Fix build with v4l2 >= 1.30
  # https://trac.ffmpeg.org/ticket/11570
  patch -Np1 -i "${srcdir}/fix_build_with_v4l2_1.30.patch"

  # https://crbug.com/1251779
  git apply -3 ../0001-Add-av_stream_get_first_dts-for-Chromium.patch

  # Fix for svt-av1
  # Taken from https://github.com/FFmpeg/FFmpeg/commit/d1ed5c06e3edc5f2b5f3664c80121fa55b0baa95.patch
  git apply -3 ../0002-avcodec-libsvtav1-unbreak-build-with-latest-svtav1.patch

  # Add library path for glslang static libs
  sed -i "${srcdir}"/ffmpeg/configure -e 's|-lglslang|-L${prefix}/static/lib -lglslang|'

  # VAAPI HEVC encode alignment fix
  git cherry-pick -n bcfbf2bac8f9eeeedc407b40596f5c7aaa0d5b47
  git cherry-pick -n d0facac679faf45d3356dff2e2cb382580d7a521
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

    # Fix for GCC 14
    export CFLAGS="$CFLAGS -Wno-error=int-conversion"

    export PKG_CONFIG_PATH_CUSTOM="/usr/${_arch}/lib/mbedtls2/pkgconfig"

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
      --enable-libdvdnav \
      --enable-libdvdread \
      --enable-libfreetype \
      --enable-frei0r \
      --enable-libfribidi \
      --enable-libglslang \
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
      --disable-w32threads \
      --x86asmexe=yasm

      # fix linking of mbedtls
      sed -i -e 's/-lmbedtls/-lmbedtls -lmbedx509 -lmbedcrypto/' ./ffbuild/config.mak
      sed -i -e 's/-lmbedtls/-lmbedtls -lmbedx509 -lmbedcrypto/' ./ffbuild/config.sh

# TODO: mingw-w64-zeromq static library missing from package (also out-of-date)
# --enable-libzmq \
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
