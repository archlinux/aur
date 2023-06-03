# Maintainer: Eric Woudstra <ericwouds AT gmail DOT com>

# Contributor: Yatao Li
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

# ALARM: Kevin Mihelich <kevin@archlinuxarm.org>
#  - use -fPIC in host cflags for v7/v8 to fix print_options.c compile
#  - remove makedepends on ffnvcodec-headers, remove --enable-nvenc, --enable-nvdec
#  - remove depends on aom, remove --enable-libaom
#  - remove depends on intel-media-sdk, remove --enable-libmfx
#  - remove depends on vmaf, remove --enable-vmaf
#  - remove depends on rav1e, remove --enable-librav1e
#  - remove depends on svt-av1, remove --enable-libsvtav1
#  - remove --enable-lto

pkgname=ffmpeg4.4-v4l2-request-git
# pkgname=ffmpeg
_srcname=FFmpeg
pkgver=4.4.1.r204004
pkgrel=1
epoch=1
pkgdesc='FFmpeg 4.4 with v4l2-request and drmprime'
arch=('armv7h' 'aarch64')
url=https://ffmpeg.org/
license=(GPL3)
depends=(
  alsa-lib
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
  libmodplug
  libopenmpt.so
  libpulse
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
  v4l-utils
  xz
  zlib
)
makedepends=(
  amf-headers
  avisynthplus
  clang
  git
  ladspa
  linux-api-headers
  mesa
  nasm
  opencl-headers
  vulkan-headers
)
optdepends=(
  'avisynthplus: AviSynthPlus support'
  'ladspa: LADSPA filters'
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
  ffmpeg4.4)
conflicts=(
  ffmpeg4.4
)
source=(
  'git+https://github.com/jernejsk/FFmpeg'
)
sha256sums=(
  SKIP
)

_version='4.4.1'
_branch1='v4l2-request-hwaccel-'$_version'-Nexus-Alpha1'
_branch2='v4l2-drmprime-v6-'$_version'-Nexus-Alpha1'
_commit3='5b13f76' # deint-v2-prime: WIP deint filter

prepare() {
  cd ${_srcname}

  git reset --hard
  git checkout $_branch1
  if [ ! -z $_branch2 ]; then
    git -c "user.name=Your Name" -c "user.email=you@example.com" \
      merge --no-edit origin/$_branch2
  fi
  if [ ! -z $_commit3 ]; then
    git cherry-pick --keep-redundant-commits $_commit3
  fi
}

pkgver() {
  cd ${_srcname}
  (
    set -o pipefail
    _cnt1=$(git rev-list --count origin/$_branch1)
    [ ! -z $_branch2 ] && _cnt2=$(git rev-list --count origin/$_branch2) || _cnt2="0"
    _cnt3="1"
    printf '%s.r%s' "$_version" "$(( $_cnt1 + $_cnt2 + $_cnt3 ))"
  )
}

build() {
  cd ${_srcname}

  [[ $CARCH == "armv7h" || $CARCH == "aarch64" ]] && CONFIG='--host-cflags="-fPIC"'
  [[ $CARCH == "armv6h" || $CARCH == 'arm' ]] && CONFIG='--extra-libs="-latomic"'

  ./configure \
    --prefix=/usr \
    --incdir=/usr/include/ffmpeg4.4 \
    --libdir=/usr/lib/ffmpeg4.4 \
    --disable-doc \
    --disable-programs \
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
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore_amrnb \
    --enable-libopencore_amrwb \
    --enable-libopenjpeg \
    --enable-libopenmpt \
    --enable-libopus \
    --enable-libpulse \
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
    --enable-opencl \
    --enable-opengl \
    --enable-shared \
    --enable-version3 \
    --enable-vulkan $CONFIG \
    \
    --arch=$CARCH \
    --enable-v4l2_m2m \
    --enable-v4l2-request \
    --enable-libudev \
    --enable-omx \
    --enable-pic \
    --enable-neon \
    $CONFIG

  make
  make tools/qt-faststart
  make doc/ff{mpeg,play}.1
}

package() {
  make DESTDIR="${pkgdir}" -C FFmpeg install

  cd "${pkgdir}"

  # Move libs to /usr/lib, except the .so symlinks
  local f
  for f in usr/lib/ffmpeg4.4/*; do
    if [[ $f == *.so ]]; then
      ln -srf -- usr/lib/"$(readlink "$f")" "$f"
    elif [[ ! -d $f ]]; then
      mv "$f" usr/lib
    fi
  done

  rm -r usr/share
}
