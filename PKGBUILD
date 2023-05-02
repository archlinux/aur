# Maintainer: Mahmut Dikcizgi <boogiepop a~t gmx com>
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
#  - enable rockchip decoders witht he highest priority
#  - interface rockchip rga from kernel to userspace directly
#  - hack around rockchips vp8&9 colorspace is not detected when used with Firefox

pkgname=ffmpeg-mpp
pkgver=6.0
pkgrel=6
epoch=2
pkgdesc='Complete solution to record, convert and stream audio and video supporting rockchip MPP hardware decoder'
arch=(aarch64 arm7f)
url=https://ffmpeg.org/
license=(GPL3)
options=(!lto debug strip)
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
  vid.stab
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
  mpp-git
  libyuv
)
makedepends=(
  amf-headers
  avisynthplus
  clang
  git
  ladspa
  mesa
  nasm
  opencl-headers
  mpp-git
  libyuv
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
  $pkgname
  ffmpeg
)
conflicts=(
  $pkgname
  ffmpeg
)
_tag=3949db4d261748a9f34358a388ee255ad1a7f0c0
source=(
  git+https://git.ffmpeg.org/ffmpeg.git?#tag=${_tag}
  add-av_stream_get_first_dts-for-chromium.patch
  rkmpp-6.patch
)

b2sums=('SKIP'
        '555274228e09a233d92beb365d413ff5c718a782008075552cafb2130a3783cf976b51dfe4513c15777fb6e8397a34122d475080f2c4483e8feea5c0d878e6de'
        '4d62f7a21cf6bdb9177f931b72a8a30b9a75c0bcef84eb500feb6820e60fd95507b4d92efba5f224fb992e5170d0d8cef388c9f6326f046c1d85eacd22e50a89')

validpgpkeys=(DD1EC9E8DE085C629B3E1846B18E8928B3948D64) # Michael Niedermayer <michael@niedermayer.cc>

prepare() {
  cd ffmpeg
  patch -Np1 -i ../add-av_stream_get_first_dts-for-chromium.patch # https://crbug.com/1251779
  patch -Np1 -i ../rkmpp-6.patch
}

pkgver() {
  cd ffmpeg
  git describe --tags | sed 's/^n//'
}

build() {
  cd ffmpeg
  [[ $CARCH == "armv7h" || $CARCH == "aarch64" ]] && CONFIG='--host-cflags="-fPIC"'
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
    --disable-vulkan \
    --enable-rkmpp $CONFIG
  make -j$(nproc)
  make tools/qt-faststart
  make doc/ff{mpeg,play}.1
}

package() {
  make DESTDIR="${pkgdir}" -C ffmpeg install install-man
  install -Dm 755 ffmpeg/tools/qt-faststart "${pkgdir}"/usr/bin/
}

# vim: ts=2 sw=2 et: