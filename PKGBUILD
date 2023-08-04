# Maintainer: Faruk Dikcizgi <boogiepop@gmx.de>
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

pkgname=ffmpeg4.4-mpp
pkgver=4.4.4
pkgrel=14
pkgdesc='Complete solution to record, convert and stream audio and video supporting rockchip MPP hardware decoder'
arch=(aarch64 arm7f)
url=https://github.com/hbiyik/ffmpeg/
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
  libdav1d.so
  libdrm
  libvpx
  libfreetype.so
  libiec61883
  libmodplug
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
  libdrm
  mpp-git
  libyuv
  librga-multi
)
makedepends=(
  amf-headers
  avisynthplus
  clang
  git
  ladspa
  nasm
  mpp-git
  libyuv
  perl
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
  ffmpeg4.4
)
conflicts=($pkgname ffmpeg4.4)
options=(!lto debug strip)

_tag=71fb6132637a2a430375c24afc381fff8b854fe7

source=(git+https://git.ffmpeg.org/ffmpeg.git#tag=${_tag}
        rkmpp-4.patch)

b2sums=('SKIP'
        '80a1ad491bd89b4d90a91372117a37abee040f8bf606fa6662dda2d99cdbb0e78a6be8b79dcd315a6bbd0b6efa42d0d39a30270f073eaaed16892a1cf6c1965f')

pkgver() {
  cd ffmpeg
  git describe --tags | sed 's/^n//'
}

prepare() {
  cd ffmpeg
  rm libavcodec/rkmpp.h || true
  rm libavcodec/rkmpp.c || true
  rm libavcodec/rkmppenc.c || true
  rm libavcodec/rkplane.c || true
  rm libavcodec/rkplane.h || true
  git cherry-pick -n 988f2e9eb063db7c1a678729f58aab6eba59a55b # fix nvenc on older gpus
  patch -Np1 -i ../../rkmpp-4.patch
}

build() {
  cd ffmpeg

  [[ $CARCH == "armv7h" || $CARCH == "aarch64" ]] && CONFIG='--host-cflags="-fPIC"'

  ./configure \
    --prefix=/usr \
    --incdir=/usr/include/ffmpeg4.4 \
    --libdir=/usr/lib/ffmpeg4.4 \
    --disable-debug \
    --disable-doc \
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
    --enable-shared \
    --enable-version3 \
    --enable-rkmpp \
    --enable-vaapi \
    --enable-vdpau \
    $CONFIG

  make ${MAKEFLAGS}
  make ${MAKEFLAGS} tools/qt-faststart
  make ${MAKEFLAGS} doc/ff{mpeg,play}.1
}

package() {
  make ${MAKEFLAGS} DESTDIR="${pkgdir}" -C ffmpeg install

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
  
  # Rename ffmpeg binaries so they wont conlfict with ffmpeg5
  for f in usr/bin/*; do
    mv $f "${f}4"
  done

  rm -r usr/share
}

# vim:set sw=2 et: