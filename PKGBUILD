# $Id$
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

_pkgname=ffmpeg
pkgname=ffmpeg-headless
pkgver=3.4.1
pkgrel=2
epoch=1
pkgdesc='Complete solution to record, convert and stream audio and video; optimised for server (headless) systems'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='http://ffmpeg.org/'
license=('GPL3')
depends=('bzip2' 'fribidi' 'glibc' 'gmp' 'gnutls' 'gsm'
         'lame' 'libmodplug'
         'libtheora' 'libwebp'
         'opencore-amr' 'openjpeg2' 'opus' 'speex'
         'v4l-utils' 'xz' 'zlib'
         'libbluray.so'
         'libvorbisenc.so' 'libvorbis.so'
         'libvpx.so' 'libx264.so' 'libx265.so' 'libxvidcore.so'
         'rtmpdump' 'libva-headless')
makedepends=('yasm')
provides=('libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
          'libavresample.so' 'libavutil.so' 'libpostproc.so' 'libswresample.so'
          'libswscale.so' "ffmpeg")
conflicts=('ffmpeg')
replaces=('ffmpeg')
source=("https://ffmpeg.org/releases/${_pkgname}-${pkgver}.tar.xz"
        'fs56089.patch')
sha256sums=('5a77278a63741efa74e26bf197b9bb09ac6381b9757391b922407210f0f991c0'
            '0bfcd12d1992903f21c146ae56d9ad89b52818cfb2303197ee905347c25a5427')

prepare() {
  cd ${_pkgname}-${pkgver}

  # https://bugs.archlinux.org/task/56089
  # Backport of http://git.videolan.org/?p=ffmpeg.git;a=commitdiff;h=a606f27f4c610708fa96e35eed7b7537d3d8f712
  patch -Np1 -i ../fs56089.patch
}

build() {
  cd ${_pkgname}-${pkgver}

  ./configure \
    --prefix='/usr' \
    --disable-debug \
    --disable-static \
    --disable-stripping \
    --enable-avisynth \
    --enable-avresample \
    --disable-fontconfig \
    --enable-gmp \
    --enable-gnutls \
    --enable-gpl \
    --disable-ladspa \
    --disable-libass \
    --enable-libbluray \
    --disable-libfreetype \
    --enable-libfribidi \
    --enable-libgsm \
    --disable-libiec61883 \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore_amrnb \
    --enable-libopencore_amrwb \
    --enable-libopenjpeg \
    --enable-libopus \
    --disable-libpulse \
    --disable-libsoxr \
    --enable-libspeex \
    --disable-libssh \
    --enable-libtheora \
    --enable-libv4l2 \
    --disable-libvidstab \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libwebp \
    --enable-libx264 \
    --enable-libx265 \
    --disable-libxcb \
    --enable-libxvid \
    --enable-shared \
    --enable-version3 \
    --enable-vaapi \
    --enable-librtmp \
    --enable-runtime-cpudetect \
    --disable-vdpau \
    --disable-xlib  \
    --disable-sdl2 \
    --disable-htmlpages \
    --disable-ffplay #\
    # enabling libfdk_aac makes ffmpeg incompatible with the GPL!
    #--enable-libfdk_aac \
    #--enable-nonfree

  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install install-man
}
