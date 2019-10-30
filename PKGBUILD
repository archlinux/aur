# Maintainer: Gleb Sinyavskiy <zhulik.gleb@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

pkgname=ffmpeg-cuda
pkgver=4.2
pkgrel=3
epoch=1
pkgdesc='Complete solution to record, convert and stream audio and video. Includes cuda support.'
arch=(x86_64)
url=https://ffmpeg.org/
license=(GPL3)
depends=(
  alsa-lib
  aom
  bzip2
  cuda
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
  libdrm
  libfreetype.so
  libiec61883
  libmodplug
  libomxil-bellagio
  libpulse
  libraw1394
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
  opencore-amr
  openjpeg2
  opus
  sdl2
  speex
  v4l-utils
  xz
  zlib
)
makedepends=(
  ffnvcodec-headers
  git
  ladspa
  nasm
)
optdepends=('ladspa: LADSPA filters')
provides=(
  libavcodec.so
  libavdevice.so
  libavfilter.so
  libavformat.so
  libavutil.so
  libpostproc.so
  libswresample.so
  libswscale.so
  ffmpeg
)
source=(git+https://git.ffmpeg.org/ffmpeg.git#tag=n${pkgver})
sha256sums=('SKIP')

build() {
  local _cflags='-I/opt/cuda/include'
  local _ldflags='-L/opt/cuda/lib64'

  cd ffmpeg

  ./configure \
    --prefix='/usr' \
    --extra-cflags="$_cflags" \
    --extra-ldflags="$_ldflags" \
    --disable-debug \
    --disable-static \
    --disable-stripping \
    --enable-fontconfig \
    --enable-nonfree \
    --enable-cuda-sdk \
    --enable-cuvid \
    --enable-libnpp \
    --enable-ffnvcodec \
    --enable-libdrm \
    --enable-gmp \
    --enable-gnutls \
    --enable-gpl \
    --enable-ladspa \
    --enable-libaom \
    --enable-libass \
    --enable-libbluray \
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
    --enable-libsoxr \
    --enable-libspeex \
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
    --enable-nvdec \
    --enable-nvenc \
    --enable-omx \
    --enable-shared \
    --enable-version3

  make
  make tools/qt-faststart
  make doc/ff{mpeg,play}.1
}

conflicts=("ffmpeg")

package() {
  make DESTDIR="${pkgdir}" -C ffmpeg install install-man
  install -Dm 755 ffmpeg/tools/qt-faststart "${pkgdir}"/usr/bin/
}

# vim: ts=2 sw=2 et:
