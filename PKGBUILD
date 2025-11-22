# Maintainer : Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>

pkgname=mingw-w64-ffmpeg
pkgver=8.0.1
pkgrel=2
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
makedepends=('mingw-w64-amf-headers' 'mingw-w64-avisynthplus' 'mingw-w64-frei0r-plugins' 'mingw-w64-gcc' 'mingw-w64-pkg-config' 'mingw-w64-vulkan-headers' 'git' 'nasm')
# 'mingw-w64-opencl-headers'
_tag=d22ecc4f6f3fca77b3e71b18641ceddb25973e97
source=(
  git+https://git.ffmpeg.org/ffmpeg.git?signed#tag=${_tag}
  0001-Add-av_stream_get_first_dts-for-Chromium.patch
  configure.patch)
b2sums=('0796d77c58d5db487ccda15454dadf129a6e0ae2a5a9cec562c86f2050b1e9314164c7f2dbf0a6c8cdae37dfd5e28f494d5ac248e970bc7f01b097100971fe8a'
        'e5f7b79f7731be9ee5a7280a9221fb531ac5a2d9820fc5870b68b0eabea667dfbe8f39f41c1e1763a4c84982896afaa54c81ff57847d203b70afafd726689e5d'
        '7171cf5055c4356f9aeb42a5bb550b3380cad20fff8dc4e9114d4fbb17e95bfe40c1057c3b7188641a1d7b9d026105e3eb0175789d7af30c5999793dfddf97fb')
validpgpkeys=(DD1EC9E8DE085C629B3E1846B18E8928B3948D64) # Michael Niedermayer <michael@niedermayer.cc>

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ffmpeg

  patch -Np1 -i "${srcdir}/configure.patch"

  # https://crbug.com/1251779
  git apply -3 ../0001-Add-av_stream_get_first_dts-for-Chromium.patch

  # Add library path for glslang static libs
  sed -i "${srcdir}"/ffmpeg/configure -e 's|-lglslang|-L${prefix}/static/lib -lglslang|'
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
      --pkg-config="${_arch}-pkg-config"

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
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.dll.a
    # FIXME: Disabled stripping static lib as strip fails with no sections error
    #${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a

    mv "${pkgdir}"/usr/${_arch}/bin/*.lib "${pkgdir}"/usr/${_arch}/lib/

    rm -rf "${pkgdir}"/usr/${_arch}/share
  done
}

# vim:set ts=2 sw=2 et:
