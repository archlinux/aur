# Maintainer: Andreas Hemmerle <andreas.hemmerle@gmail.com>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

# shellcheck disable=SC2148,SC2034,SC2154,SC2164

pkgname=ffmpeg-headless
pkgver=8.0.1
pkgrel=1
epoch=1
pkgdesc='Complete solution to record, convert and stream audio and video; optimised for server (headless) systems'
arch=(i686 x86_64 armv7h armv6h aarch64)
url=https://ffmpeg.org
license=(GPL-3.0-only)
depends=(
  aom
  bzip2
  dav1d
  fontconfig
  freetype2
  fribidi
  glib2
  glibc
  glslang
  gmp
  gnutls
  gsm
  harfbuzz
  lame
  libass
  libavc1394
  libbluray
  libbs2b
  libdrm
  libdvdnav
  libdvdread
  libiec61883
  libjxl
  libmodplug
  libopenmpt
  libplacebo
  libraw1394
  librsvg
  libsoxr
  libssh
  libtheora
  libva
  libvdpau
  libvorbis
  libvpx
  libwebp
  libxml2
  ocl-icd
  onevpl
  opencore-amr
  openjpeg2
  opus
  rav1e
  rubberband
  snappy
  speex
  srt
  svt-av1
  v4l-utils
  vapoursynth
  vid.stab
  vmaf
  vulkan-icd-loader
  x264
  x265
  xvidcore
  xz
  zeromq
  zimg
  zlib
)
makedepends=(
  amf-headers
  avisynthplus
  clang
  ffnvcodec-headers
  frei0r-plugins
  git
  ladspa
  nasm
  opencl-headers
  vulkan-headers
)
optdepends=(
  'avisynthplus: AviSynthPlus support'
  'frei0r-plugins: Frei0r video effects support'
  'intel-media-sdk: Intel QuickSync support (legacy)'
  'ladspa: LADSPA filters'
  'nvidia-utils: Nvidia NVDEC/NVENC support'
  'onevpl-intel-gpu: Intel QuickSync support'
)
provides=(
  libavcodec.so
  libavdevice.so
  libavfilter.so
  libavformat.so
  libavutil.so
  libswresample.so
  libswscale.so
  ffmpeg
)
conflicts=('ffmpeg')
_tag='d22ecc4f6f3fca77b3e71b18641ceddb25973e97'
source=(
  "$pkgname::git+https://git.ffmpeg.org/ffmpeg.git?signed#tag=${_tag}"
  '0001-unbreak-glslang-build.patch'
)
b2sums=('0796d77c58d5db487ccda15454dadf129a6e0ae2a5a9cec562c86f2050b1e9314164c7f2dbf0a6c8cdae37dfd5e28f494d5ac248e970bc7f01b097100971fe8a'
        '650631d4f06dffec55bd6419f680d95617a9093d8e548b3dac0b379496477dcbd4121883128438343c568e992cb5b455efc0b7c4e34a5e7200518f9b5beaa231')
validpgpkeys=('DD1EC9E8DE085C629B3E1846B18E8928B3948D64')   # Michael Niedermayer <michael@niedermayer.cc>

prepare() {
  cd "${pkgname}" || exit 1

  # https://github.com/FFmpeg/FFmpeg/commit/f1e9032a2000b8b885cffd6fed8eacd47b37673f
  git apply -3 ../0001-unbreak-glslang-build.patch
}

pkgver() {
  cd "${pkgname}" || exit 1
  git describe --tags | sed 's/^n//'
}

build() {
  export PKG_CONFIG_PATH='/usr/lib/mbedtls2/pkgconfig'
  cd ${pkgname} || exit 1
  ./configure \
    --prefix=/usr \
    --disable-debug \
    --disable-static \
    --disable-stripping \
    --enable-amf \
    --enable-avisynth \
    --enable-cuda-llvm \
    --enable-lto \
    --enable-fontconfig \
    --enable-frei0r \
    --enable-gmp \
    --enable-gnutls \
    --enable-gpl \
    --enable-ladspa \
    --enable-libaom \
    --enable-libass \
    --enable-libbluray \
    --enable-libbs2b \
    --enable-libdav1d \
    --enable-libdrm \
    --enable-libdvdnav \
    --enable-libdvdread \
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libglslang \
    --enable-libgsm \
    --enable-libharfbuzz \
    --enable-libiec61883 \
    --disable-libjack \
    --enable-libjxl \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore_amrnb \
    --enable-libopencore_amrwb \
    --enable-libopenjpeg \
    --enable-libopenmpt \
    --enable-libopus \
    --enable-libplacebo \
    --disable-libpulse \
    --enable-librav1e \
    --enable-librsvg \
    --enable-librubberband \
    --enable-libsnappy \
    --enable-libsoxr \
    --enable-libspeex \
    --enable-libsrt \
    --enable-libssh \
    --enable-libsvtav1 \
    --enable-libtheora \
    --enable-libv4l2 \
    --enable-libvidstab \
    --enable-libvmaf \
    --enable-libvorbis \
    --enable-libvpl \
    --enable-libvpx \
    --enable-libwebp \
    --enable-libx264 \
    --enable-libx265 \
    --disable-libxcb \
    --enable-libxml2 \
    --enable-libxvid \
    --enable-libzimg \
    --enable-libzmq \
    --enable-nvdec \
    --enable-nvenc \
    --enable-opencl \
    --disable-opengl \
    --enable-shared \
    --enable-vapoursynth \
    --enable-version3 \
    --enable-vulkan \
    --disable-xlib \
    --disable-sdl2 \
    --disable-htmlpages \
    --disable-ffplay
  make
  make tools/qt-faststart
}

package() {
  depends+=(
    libass.so
    libbluray.so
    libbs2b.so
    libdav1d.so
    libfreetype.so
    libharfbuzz.so
    libjxl.so
    libopenmpt.so
    libplacebo.so
    librav1e.so
    librsvg-2.so
    librubberband.so
    libva.so
    libva-drm.so
    libvidstab.so
    libvorbisenc.so
    libvorbis.so
    libvpx.so
    libx264.so
    libx265.so
    libxvidcore.so
    libzimg.so
    libzmq.so
  )

  make DESTDIR="${pkgdir}" -C ${pkgname} install install-man
  install -Dm 755 ${pkgname}/tools/qt-faststart "${pkgdir}"/usr/bin/
}

# vim: ts=2 sw=2 et:
