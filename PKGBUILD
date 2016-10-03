# Maintainer: Ben Widawsky <ben@bwidawsk.net>
# Contributor: Rob McCathie <korrode at gmail>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

_name=ffmpeg
pkgname=ffmpeg-libfdk_aac
pkgver=3.1.4
pkgrel=1
epoch=1
pkgdesc='Complete solution to record, convert and stream audio and video (Same as official package except with libfdk-aac support)'
arch=('i686' 'x86_64')
url='http://ffmpeg.org/'
license=('GPL3' 'custom:libfdk-aac')
depends=('alsa-lib' 'bzip2' 'fontconfig' 'fribidi' 'gmp' 'gnutls' 'gsm' 'lame'
         'libass' 'libavc1394' 'libbluray' 'libiec61883' 'libmodplug'
         'libpulse' 'libsoxr' 'libssh' 'libtheora' 'libva' 'libvdpau' 'libwebp'
         'netcdf' 'opencore-amr' 'openjpeg' 'opus' 'schroedinger' 'sdl' 'speex'
         'v4l-utils' 'xvidcore' 'zlib'
         'libvidstab.so' 'libvorbis.so' 'libvorbisenc.so' 'libvpx.so'
         'libx264.so' 'libx265.so'
         'libfdk-aac')

makedepends=('hardening-wrapper' 'ladspa' 'libvdpau' 'yasm')
optdepends=('ladspa: LADSPA filters')
provides=('libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
          'libavresample.so' 'libavutil.so' 'libpostproc.so' 'libswresample.so'
          'libswscale.so'
          "ffmpeg=$pkgver")
conflicts=("$_name")
source=(https://ffmpeg.org/releases/$_name-$pkgver.tar.xz{,.asc}
        https://trac.ffmpeg.org/raw-attachment/ticket/5694/ffmpeg_opj2.patch)
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8') # ffmpeg-devel
sha256sums=('a80cb378dda5c9bbcdbd62a99bdec0e4eedbcb47f290e72845af4855c1146b5b'
            'SKIP'
            '336f14fa497598fbd437fc780305fa7c576fd6cd44aaef77b0b4f61448f55fb8')

prepare() {
  cd $_name-$pkgver
  patch -Np1 <../ffmpeg_opj2.patch
}

build() {
  cd $_name-$pkgver

  ./configure \
    --prefix='/usr' \
    --disable-debug \
    --disable-static \
    --disable-stripping \
    --enable-avisynth \
    --enable-avresample \
    --enable-fontconfig \
    --enable-gmp \
    --enable-gnutls \
    --enable-gpl \
    --enable-ladspa \
    --enable-libass \
    --enable-libbluray \
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libgsm \
    --enable-libiec61883 \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore_amrnb \
    --enable-libopencore_amrwb \
    --enable-libopenjpeg \
    --enable-libopus \
    --enable-libpulse \
    --enable-libschroedinger \
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
    --enable-libxvid \
    --enable-netcdf \
    --enable-shared \
    --enable-version3 \
    --enable-x11grab \
    --enable-libfdk_aac \
    --enable-nonfree

  make
  make tools/qt-faststart
  make doc/ff{mpeg,play,server}.1

  cp /usr/share/licenses/libfdk-aac/NOTICE .
}

package() {
  cd $_name-$pkgver

  make DESTDIR="${pkgdir}" install install-man
  install -Dm 755 tools/qt-faststart "${pkgdir}"/usr/bin/

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m 0644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}

# vim: ts=2 sw=2 et:
