# Maintainer: Thomas Schneider <maxmusterm@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

_svt_hevc_ver='1.4.3'
_svt_av1_ver='0.8.3'
_svt_vp9_ver='0.2.0'

pkgname=ffmpeg-svt
pkgver=4.2.2
pkgrel=3
epoch=1
pkgdesc='Complete solution to record, convert and stream audio and video. SVT Patchset applied'
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
  svt-av1
  svt-vp9
  svt-hevc
)
makedepends=(
  ffnvcodec-headers
  git
  ladspa
  nasm
)
optdepends=('ladspa: LADSPA filters')
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
replaces=('ffmpeg')
conflicts=('ffmpeg')
source=(ffmpeg::git+https://git.ffmpeg.org/ffmpeg.git#tag=n${pkgver}
#      ffmpeg-${pkgver}::git+https://git.ffmpeg.org/ffmpeg.git#tag=n${pkgver}
        "ffmpeg-full-add-svt-hevc-${_svt_hevc_ver}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/v${_svt_hevc_ver}/ffmpeg_plugin/0001-lavc-svt_hevc-add-libsvt-hevc-encoder-wrapper.patch"
        "ffmpeg-full-add-svt-hevc-docs-${_svt_hevc_ver}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/v${_svt_hevc_ver}/ffmpeg_plugin/0002-doc-Add-libsvt_hevc-encoder-docs.patch"
        "ffmpeg-full-add-svt-av1-${_svt_av1_ver}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-AV1/v${_svt_av1_ver}/ffmpeg_plugin/0001-Add-ability-for-ffmpeg-to-run-svt-av1-with-svt-hevc.patch"
        "ffmpeg-full-add-svt-vp9-${_svt_vp9_ver}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-VP9/v${_svt_vp9_ver}/ffmpeg_plugin/0001-Add-ability-for-ffmpeg-to-run-svt-vp9-with-svt-hevc-av1.patch")

sha256sums=('SKIP'
            '878757eb6d7072521caaeb71f1453ec3fc0f91a12936ef302e1625184787c6a6'
            '1499e419dda72b1604dc5e3959668f3843292ff56bfba78734e31510ba576de0'
            'd371366ceda9233c1b9a60c680878f567861b675605a8dae5c275d633c51ba9f'
            '7690a4f6bdc4a57e35c7ff5b6e87f2fe6d056d452eff9e767eaccff41832f4d7')

prepare() {
    ln -sf $srcdir/ffmpeg $srcdir/ffmpeg-${pkgver}
    rm -f "ffmpeg-${pkgver}/libavcodec/"libsvt_{hevc,av1,vp9}.c
    sed -i 's/eb_init_handle/svt_av1_enc_init_handle/' "${srcdir}/ffmpeg-full-add-svt-vp9-${_svt_vp9_ver}.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/ffmpeg-full-add-svt-hevc-${_svt_hevc_ver}.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/ffmpeg-full-add-svt-hevc-docs-${_svt_hevc_ver}.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/ffmpeg-full-add-svt-av1-${_svt_av1_ver}.patch"
    patch -d "ffmpeg-${pkgver}" -Np1 -i "${srcdir}/ffmpeg-full-add-svt-vp9-${_svt_vp9_ver}.patch"
}

build() {
  cd ffmpeg

  ./configure \
    --prefix='/usr' \
    --disable-debug \
    --disable-static \
    --disable-stripping \
    --enable-fontconfig \
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
    --enable-version3 \
    --enable-libsvtav1 \
    --enable-libsvtvp9 \
    --enable-libsvthevc


  make
  make tools/qt-faststart
  make doc/ff{mpeg,play}.1
}

package() {
  make DESTDIR="${pkgdir}" -C ffmpeg install install-man
  install -Dm 755 ffmpeg/tools/qt-faststart "${pkgdir}"/usr/bin/
}

# vim: ts=2 sw=2 et:
