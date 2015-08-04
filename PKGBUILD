# Maintainer: Dmitry Kharitonov <darksab0r at gmail com>
# Contributor: rcpoison <rc dot poison at gmail dot com>
# Contributor: Gerad Munsch <gmunsch@unforgivendevelopment.com>
# Contributor: Rudolf Polzer <divVerent[at]xonotic[dot]org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

pkgname=ffmpeg-full-nvenc
_pkgbasename=ffmpeg
pkgver=2.7.1
pkgrel=1
epoch=1
pkgdesc="Record, convert, and stream audio and video (all codecs including Nvidia NVENC and opencl)"
arch=('i686' 'x86_64')
url="http://ffmpeg.org/"
license=('GPL' 'custom:UNREDISTRIBUTABLE')
depends=('alsa-lib' 'bzip2' 'celt' 'faac' 'fontconfig' 'fribidi' 'gnutls' 'gsm' 'jack' 'lame'
         'libaacplus' 'libass' 'libavc1394' 'libbluray' 'libcaca' 'libcdio-paranoia' 'libdc1394'
         'libfdk-aac' 'libiec61883' 'libmodplug' 'libpulse' 'libssh' 'libtheora' 'libva'
         'libvdpau' 'libwebp' 'openal' 'opencl-headers' 'opencore-amr' 'openjpeg' 'opus' 
         'schroedinger' 'sdl' 'speex' 'twolame' 'v4l-utils' 'vo-aacenc' 'vo-amrwbenc' 'xvidcore'
         'zlib' 'libvorbisenc.so' 'libvorbis.so' 'libvpx.so' 'libx264.so' 'libx265.so')
makedepends=('libvdpau' 'yasm' 'pkg-config' 'hardening-wrapper')
optdepends=('avxsynth-git: for Avisynth support'
            'opencl-nvidia: for OpenCL support')
conflicts=('ffmpeg' 'ffmpeg-full' 'ffmpeg-git' 'ffmpeg-full-git' 'ffmpeg-full-extra')
provides=('ffmpeg' 'qt-faststart')
source=(http://ffmpeg.org/releases/$_pkgbasename-$pkgver.tar.bz2{,.asc}
        'UNREDISTRIBUTABLE.txt')
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8')
sha256sums=('7e07b97d2415feeae9c9b5595e35e7b7aab33207e81bf9f8c0d1eece43f7f720'
            'SKIP'
            'e0c1b126862072a71e18b9580a6b01afc76a54aa6e642d2c413ba0ac9d3010c4')

build() {
  cd $_pkgbasename-$pkgver

  msg "Starting configure..."
  ./configure \
    --enable-shared \
    --disable-debug \
    --disable-static \
    --prefix=/usr \
    --enable-avisynth \
    --enable-avresample \
    --enable-bzlib \
    --enable-fontconfig \
    --enable-gnutls \
    --enable-gpl \
    --enable-iconv \
    --enable-libass \
    --enable-libbluray \
    --enable-libcaca \
    --enable-libcdio \
    --enable-libcelt \
    --enable-libdc1394 \
    --enable-libfaac \
    --enable-libfdk-aac \
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libgsm \
    --enable-libiec61883 \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore-amrnb \
    --enable-libopencore-amrwb \
    --enable-libopenjpeg \
    --enable-libopus \
    --enable-libpulse \
    --enable-libschroedinger \
    --enable-libspeex \
    --enable-libssh \
    --enable-libtheora \
    --enable-libtwolame \
    --enable-libv4l2 \
    --enable-libvo-aacenc \
    --enable-libvo-amrwbenc \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libwebp \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libxvid \
    --enable-nonfree \
    --enable-nvenc \
    --enable-openal \
    --enable-opencl \
    --enable-openssl \
    --enable-postproc\
    --enable-vaapi \
    --enable-vda \
    --enable-version3 \
    --enable-x11grab \
    --enable-zlib \

  msg "Starting make"
  make
  make tools/qt-faststart
  make doc/ff{mpeg,play,server}.1
}

package() {
  cd ffmpeg-$pkgver
  make DESTDIR="$pkgdir" install install-man
  install -Dm755 tools/qt-faststart "$pkgdir/usr/bin/qt-faststart"
  install -Dm644 "$srcdir"/UNREDISTRIBUTABLE.txt "$pkgdir/usr/share/licenses/$pkgname/UNREDISTRIBUTABLE.txt"
}
