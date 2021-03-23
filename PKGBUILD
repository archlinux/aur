# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=ffmpeg-ndi
pkgver=4.3.2
pkgrel=2
pkgdesc='Complete solution to record, convert and stream audio and video with NDI restored and enabled'
arch=(x86_64)
url=https://ffmpeg.org/
license=('custom: nonfree and unredistributable')
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
  libmfx
  libmodplug
  libpulse
  librav1e.so
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
  libzimg.so
  opencore-amr
  openjpeg2
  opus
  sdl2
  speex
  srt
  v4l-utils
  vmaf
  xz
  zlib

# AUR:
  ndi-sdk
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
  'intel-media-sdk: Intel QuickSync support'
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
conflicts=('ffmpeg')
_tag=f719f869907764e6412a6af6e178c46e5f915d25
source=(
  git+https://git.ffmpeg.org/ffmpeg.git#tag=${_tag}
  vmaf-model-path.patch
  '0001-Revert-lavd-Remove-libndi_newtek.patch'::'https://framagit.org/tytan652/ffmpeg-ndi-patch/-/raw/master/0001-Revert-lavd-Remove-libndi_newtek.patch?inline=false'
  'libndi_newtek_common.h'::'https://framagit.org/tytan652/ffmpeg-ndi-patch/-/raw/master/libavdevice/libndi_newtek_common.h?inline=false'
  'libndi_newtek_dec.c'::'https://framagit.org/tytan652/ffmpeg-ndi-patch/-/raw/master/libavdevice/libndi_newtek_dec.c?inline=false'
  'libndi_newtek_enc.c'::'https://framagit.org/tytan652/ffmpeg-ndi-patch/-/raw/master/libavdevice/libndi_newtek_enc.c?inline=false'
  LICENSE
)
sha256sums=(
  SKIP
  8dff51f84a5f7460f8893f0514812f5d2bd668c3276ef7ab7713c99b71d7bd8d
  207b0005fe9310d9985c4903c259a5e55441a3728577ff6d9b9f562a20462fdf
  462e984a7cb3d0af17b0ea0eb2a010aee2f79a3e77c2055fdfd760163dd75fa4
  3c6dea7583d79911e9ea198c35b1b56830b85eea84e49d63c2d5c03af5210eca
  83cc714edc8d1c37ffabd2ee17960d6ed91a1d019bd43d01383f84eea28e4fbb
  04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36
)

pkgver() {
  cd ffmpeg

  git describe --tags | sed 's/^n//'
}

prepare() {
  cd ffmpeg

  git cherry-pick -n 7c59e1b0f285cd7c7b35fcd71f49c5fd52cf9315 # fix build against libsrt 1.4.2
  patch -Np1 -i "${srcdir}"/vmaf-model-path.patch
  patch -Np1 -i "${srcdir}"/0001-Revert-lavd-Remove-libndi_newtek.patch

  printf 'Copying libndi missing file'
  cp "${srcdir}"/libndi_newtek_* libavdevice/
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
    --enable-lto \
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
    --enable-libmfx \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore_amrnb \
    --enable-libopencore_amrwb \
    --enable-libopenjpeg \
    --enable-libopus \
    --enable-libpulse \
    --enable-librav1e \
    --enable-libsoxr \
    --enable-libspeex \
    --enable-libsrt \
    --enable-libssh \
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
    --enable-shared \
    --enable-version3 \
    --enable-nonfree \
    --enable-libndi_newtek

  make
  make tools/qt-faststart
  make doc/ff{mpeg,play}.1
}

package() {
  make DESTDIR="${pkgdir}" -C ffmpeg install install-man
  install -Dm 755 ffmpeg/tools/qt-faststart "${pkgdir}"/usr/bin/
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
