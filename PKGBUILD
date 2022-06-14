# Maintainer: Ben Widawsky <ben@bwidawsk.net>
# Contributor: Rob McCathie <korrode at gmail>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

_name=ffmpeg
pkgname=ffmpeg-libfdk_aac
pkgver=5.0
pkgrel=2
epoch=1
pkgdesc='Complete solution to record, convert and stream audio and video (Same as official package except with libfdk-aac support)'
arch=(x86_64)
url=https://ffmpeg.org/
license=(GPL3 custom:libfdk-aac)
depends=(
  alsa-lib
  aom
  bzip2
  fontconfig
  fribidi
  gmp
# gnutls - https://aur.archlinux.org/packages/ffmpeg-libfdk_aac/#comment-722966
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
  openssl # https://aur.archlinux.org/packages/ffmpeg-libfdk_aac/#comment-722966
  opus
  sdl2
  speex
  srt
  svt-av1
  v4l-utils
  vmaf
  xz
  zlib
  libfdk-aac
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
  libavcodec.so
  libavdevice.so
  libavfilter.so
  libavformat.so
  libavutil.so
  libpostproc.so
  libswresample.so
  libswscale.so
  "ffmpeg=$pkgver"
)
_tag=390d6853d0ef408007feb39c0040682c81c02751
options=(
  debug
)
conflicts=("$_name")
source=(
  git+https://git.ffmpeg.org/ffmpeg.git#tag=${_tag}
  ffmpeg-vmaf2.x.patch
  add-av_stream_get_first_dts-for-chromium.patch
)
b2sums=('SKIP'
        '65039aac811bfd143359e32720cd6ca64124f1789c1b624bd28a5bd75b37362b2a3b6b402203c4e9d137fb1d00895114f3789df40f8381091d38c98e7876cc8a'
        '3f2ee7606500fa9444380d138959cd2bccfbba7d34629a17f4f6288c6bde29e931bbe922a7c25d861f057ddd4ba0b095bbd675c1930754746d5dd476b3ccbc13')

prepare() {
  cd ffmpeg
  git cherry-pick -n 988f2e9eb063db7c1a678729f58aab6eba59a55b # fix nvenc on older gpus
  patch -Np1 -i ../ffmpeg-vmaf2.x.patch # vmaf 2.x support
  patch -Np1 -i ../add-av_stream_get_first_dts-for-chromium.patch # https://crbug.com/1251779
}

pkgver() {
  cd ffmpeg
  git describe --tags | sed 's/^n//'
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
    --enable-openssl \
    --enable-shared \
    --enable-vaapi \
    --enable-version3 \
    --enable-libfdk_aac \
    --enable-nonfree
#   --enable-gnutls  https://aur.archlinux.org/packages/ffmpeg-libfdk_aac/#comment-722966

  make
  make tools/qt-faststart
  make doc/ff{mpeg,play}.1

  cp /usr/share/licenses/libfdk-aac/NOTICE .
}

package() {
  make DESTDIR="${pkgdir}" -C ffmpeg install install-man
  install -Dm 755 ffmpeg/tools/qt-faststart "${pkgdir}"/usr/bin/

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m 0644 ffmpeg/NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}

# vim: ts=2 sw=2 et:
