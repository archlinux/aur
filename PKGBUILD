# Maintainer: tytan652 <tytan652 at tytanium dot xyz>

## About ffmpeg-obs

# OBS Project actually patch FFmpeg to fix some issues and also add RIST support starting from 27.2.
# So I created ffmpeg-obs, a ffmpeg package that ensure that you have those.
# If you really want to use another ffmpeg package with obs-studio-tytan652:
# - Add cherry-pick from ffmpeg-obs except if you are using a git package.
# - Add obs-deps FFmpeg patches.
# - Add librist as an dependency and --enable-librist flag to the configure command except is you are using a full package.
# - Add ffmpeg-obs to the provided packages, so it acts like a drop-in replacement for ffmpeg-obs.

pkgname=ffmpeg-obs
pkgver=4.4.1
pkgrel=1
pkgdesc='Complete solution to record, convert and stream audio and video with modification for OBS Studio'
arch=('i686' 'x86_64' 'aarch64')
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
  libdav1d.so
  libdrm
  libfreetype.so
  libiec61883
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
  opencore-amr
  openjpeg2
  opus
  sdl2
  speex
  srt
  v4l-utils
  xz
  zlib

  # AUR packages
  librist
)
makedepends=(
  amf-headers
  avisynthplus
  clang
  ffnvcodec-headers
  git
  ladspa
  nasm
)
optdepends=(
  'avisynthplus: AviSynthPlus support'
  'ladspa: LADSPA filters'
  'nvidia-utils: Nvidia NVDEC/NVENC support'
)
provides=(
  ffmpeg
  libavcodec.so
  libavdevice.so
  libavfilter.so
  libavformat.so
  libavutil.so
  libpostproc.so
  libswresample.so
  libswscale.so
)
conflicts=(ffmpeg)
_tag=7e0d640edf6c3eee1816b105c2f7498c4f948e74
_deps_tag=2021-11-15 # Yes, they made the tag wrong, it was made on 2021-12-15
source=(
  "ffmpeg::git+https://git.ffmpeg.org/ffmpeg.git#tag=${_tag}"
  "obs-deps::git+https://github.com/obsproject/obs-deps.git#tag=${_deps_tag}"
  "vmaf-model-path.patch"
)
sha256sums=(
  "SKIP"
  "SKIP"
  "8dff51f84a5f7460f8893f0514812f5d2bd668c3276ef7ab7713c99b71d7bd8d"
)

if [[ $CARCH == 'x86_64' ]]; then
  CONFIG="--enable-lto"

  depends+=('libmfx')
  CONFIG="$CONFIG --enable-libmfx"
  depends+=('svt-av1')
  CONFIG="$CONFIG --enable-libsvtav1"

  optdepends+=('intel-media-sdk: Intel QuickSync support')
else
  CONFIG="--disable-lto"
fi

if [[ $CARCH == "i686" || $CARCH == "x86_64" ]]; then
  depends+=('vmaf')
  CONFIG="$CONFIG --enable-libvmaf"
fi

if [[ $CARCH == 'aarch64' ]]; then
  CONFIG="$CONFIG --host-cflags=\"-fPIC\""
fi

pkgver() {
  cd ffmpeg

  git describe --tags | sed 's/^n//'
}

prepare() {
  cd ffmpeg

  ### Arch Linux changes

  ## To fix nvenc on older gpus
  # avcodec/nvenc: fix lossless tuning logic 
  # https://github.com/FFmpeg/FFmpeg/commit/988f2e9eb063db7c1a678729f58aab6eba59a55b
  git cherry-pick -n 988f2e9eb063db7c1a678729f58aab6eba59a55b

  ## Change default vmaf model path to Arch defaults
  patch -Np1 -i "${srcdir}"/vmaf-model-path.patch

  ### OBS changes

  ## To fix crashes when VAAPI settings are wrong
  # avcodec/vaapi_encode: Fix segfault upon closing uninitialized encoder
  # https://github.com/FFmpeg/FFmpeg/commit/d1b47f3bfcc625ca1cae210fc198dcbd54381a88
  git cherry-pick -n d1b47f3bfcc625ca1cae210fc198dcbd54381a88

  ## Patch for FFmpeg from obs-deps repository

  # This patch applies:
  #  - Fix decoding of certain malformed FLV files
  #  - Add additional CPU levels for libaom
  patch -Np1 -i "${srcdir}"/obs-deps/CI/patches/FFmpeg-4.4.1-OBS.patch

  # avformat/hlsenc: remove unnecessary http/https shutdown status operate
  # https://patchwork.ffmpeg.org/project/ffmpeg/patch/20210913021204.22138-1-lq@chinaffmpeg.org/
  patch -Np1 -i "${srcdir}"/obs-deps/CI/patches/FFmpeg-9010.patch

  ## This patch applies:
  #   - avformat/librist: replace deprecated functions
  #     https://github.com/FFmpeg/FFmpeg/commit/5274f2f7f8c5e40d18b84055fbb232752bd24f2f
  #   - avformat/librist: correctly initialize logging_settings
  #     https://github.com/FFmpeg/FFmpeg/commit/9b15f43cf8c7976fba115da686a990377f7b5ab9
  #   - libRIST: allow setting fifo size and fail on overflow
  #     https://patchwork.ffmpeg.org/project/ffmpeg/patch/20211117141929.1164334-2-gijs@peskens.net/
  patch -Np1 -i "${srcdir}"/obs-deps/CI/patches/FFmpeg-4.4.1-librist.patch

  # Fix "error: unknown type name ‘bool’" made by the patch because stdbool.h is only added through librist from version 0.2.7
  sed -i '49 a #if FF_LIBRIST_VERSION < FF_LIBRIST_VERSION_42\n#include <stdbool.h>\n#endif' libavformat/librist.c

  # Fix some typo made in the patch if built against librist 0.2.6
  sed -i 's/FF_LIBRIST_FIFO_DEFAULT)/FF_LIBRIST_FIFO_DEFAULT_SHIFT)/g' libavformat/librist.c
  sed -i 's/fifo_buffer_size/fifo_shift/g' libavformat/librist.c
}

build() {
  cd ffmpeg

  ./configure \
    --prefix=/usr \
    --disable-debug \
    --disable-static \
    --disable-stripping \
    --enable-amf \
    --enable-avisynth \
    --enable-cuda-llvm \
    --enable-fontconfig \
    --enable-gmp \
    --enable-gnutls \
    --enable-gpl \
    --enable-ladspa \
    --enable-libaom \
    --enable-libass \
    --enable-libbluray \
    --enable-libdav1d \
    --enable-libdrm \
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libgsm \
    --enable-libiec61883 \
    --enable-libjack \
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
    --enable-libtheora \
    --enable-libv4l2 \
    --enable-libvidstab \
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
    --enable-shared \
    --enable-version3 \
    --enable-librist \
    $CONFIG

  make
  make tools/qt-faststart
  make doc/ff{mpeg,play}.1
}

package() {
  make DESTDIR="${pkgdir}" -C ffmpeg install install-man
  install -Dm 755 ffmpeg/tools/qt-faststart "${pkgdir}"/usr/bin/
}
