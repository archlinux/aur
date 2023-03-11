# Maintainer: raine

# Q: Why does this package exist?
#
# A: Unfortunately, current ffmpeg package maintainer Maxime Gauduin is refusing to enable JXL support that is available in ffmpeg,
# and all discussions are currently being shut down with replies disabled, without giving a chance to respond to his opinionated decisions.
# A few examples of issues that got shut down:
#
# https://bugs.archlinux.org/task/75830
# https://bugs.archlinux.org/task/75982
# https://bugs.archlinux.org/task/76106
# https://bugs.archlinux.org/task/76277
#
# in some cases with some cheerleading from another package maintainer:
#
# https://bugs.archlinux.org/task/76643
#
# The given reasoning is
#
# - libjxl is in [community], I'm not bringing and maintaining that package and all its dependencies in [extra]
# - depending on libjxl brings 47.6MB of additional dependencies
# - there's ffmpeg-full, aka ffmpeg-bloatfest in AUR
#
# First two are simply incorrect: the only dependency (singular, not plural) of libjxl that is not in core or extra is highway, which is 3.4MB.
# The last one about the existence of ffmpeg-full is a red-herring; you can argue that for any feature of ffmpeg, included or non-included,
# arbitrarily, yet no such argument was made to turn on AV1/AVIF support, inclusion of libwebp, or less popular encoders such as rav1e.
#
# And his response completely ignores the raised issue about why JXL is necessary: saving lossles (or high-fidelity) screenshots in mpv
# at >=4K is extremely slow without it. Ignoring the stutter (and SSD wearing), his workaround for obtaining JXL screenshots is to write
# screenshots as >60MB PNG files and then manually convert them to JXL, because "ImageMagick and vips exist for a reason".
# Yes, seriously. That is how we must live per his decree. And one must not be allowed to return his witty response in kind by saying
# "JXL support was added to mpv for a reason", so the discussion must be locked down.
#
# And indeed, unfortunately, time and again, Maxime preferred to silence any critique of his incorrect or subjective claims
# by locking down the issues, so here we are.
#
# This package flips on the JXL support that is readily available in ffmpeg, and by extension mpv.

pkgname=ffmpeg-jxl
pkgver=6.0
pkgrel=1
pkgdesc='Complete solution to record, convert and stream audio and video (with JPEG XL support, supporting jxl screenshots in mpv)'
arch=(x86_64)
url=https://ffmpeg.org/
license=(GPL3)
depends=(
  alsa-lib
  aom
  bzip2
  fontconfig
  fribidi
  gmp
  gnutls
  gsm
  jack
  lame
  libass.so
  libavc1394
  libbluray.so
  libbs2b.so
  libdav1d.so
  libdrm
  libfreetype.so
  libgl
  libiec61883
  libjxl
  libmfx
  libmodplug
  libpulse
  librav1e.so
  libraw1394
  librsvg-2.so
  libsoxr
  libssh
  libtheora
  libva.so
  libva-drm.so
  libva-x11.so
  libvdpau
  libvidstab.so
  libvorbisenc.so
  libvorbis.so
  libvpx.so
  libvulkan.so
  libwebp
  libx11
  libx264.so
  libx265.so
  libxcb
  libxext
  libxml2
  libxv
  libxvidcore.so
  libzimg.so
  ocl-icd
  opencore-amr
  openjpeg2
  opus
  sdl2
  speex
  srt
  svt-av1
  v4l-utils
  vmaf
  xz
  zlib
)
makedepends=(
  amf-headers
  avisynthplus
  clang
  ffnvcodec-headers
  git
  ladspa
  mesa
  nasm
  opencl-headers
  vulkan-headers
)
optdepends=(
  'avisynthplus: AviSynthPlus support'
  'intel-media-sdk: Intel QuickSync support'
  'ladspa: LADSPA filters'
  'nvidia-utils: Nvidia NVDEC/NVENC support'
)
provides=(
  libavcodec.so
  libavdevice.so
  libavfilter.so
  libavformat.so
  libavutil.so
  libpostproc.so
  libswresample.so
  libswscale.so
  'ffmpeg'
)
conflicts=('ffmpeg')

source=(
  "https://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.xz"
  add-av_stream_get_first_dts-for-chromium.patch
)
b2sums=('SKIP'
        'SKIP')

prepare() {
  cd "ffmpeg-${pkgver}"
  patch -Np1 -i ../add-av_stream_get_first_dts-for-chromium.patch # https://crbug.com/1251779
}

build() {
  cd "ffmpeg-${pkgver}"
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
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libgsm \
    --enable-libiec61883 \
    --enable-libjack \
    --enable-libjxl \
    --enable-libmfx \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore_amrnb \
    --enable-libopencore_amrwb \
    --enable-libopenjpeg \
    --enable-libopus \
    --enable-libpulse \
    --enable-librav1e \
    --enable-librsvg \
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
    --enable-libvpx \
    --enable-libwebp \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libxcb \
    --enable-libxml2 \
    --enable-libxvid \
    --enable-libzimg \
    --enable-nvdec \
    --enable-nvenc \
    --enable-opencl \
    --enable-opengl \
    --enable-shared \
    --enable-version3 \
    --enable-vulkan
  make
  make tools/qt-faststart
  make doc/ff{mpeg,play}.1
}

package() {
  make DESTDIR="${pkgdir}" -C ffmpeg-${pkgver} install install-man
  install -Dm 755 ffmpeg-${pkgver}/tools/qt-faststart "${pkgdir}"/usr/bin/
}
