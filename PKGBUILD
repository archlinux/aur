# Maintainer: Ben Widawsky <ben@bwidawsk.net>
# Contributor: Rob McCathie <korrode at gmail>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

_name=ffmpeg
pkgname=ffmpeg-libfdk_aac
pkgver=2.8.3
pkgrel=1
epoch=1
pkgdesc='Complete solution to record, convert and stream audio and video (Same as official package except with libfdk-aac support)'
arch=('i686' 'x86_64')
url='http://ffmpeg.org/'
license=('GPL3' 'custom:libfdk-aac')
depends=(
      'alsa-lib' 'bzip2' 'fontconfig' 'fribidi' 'gnutls' 'gsm' 'lame' 'libass'
      'libbluray' 'libmodplug' 'libpulse' 'libsoxr' 'libssh' 'libtheora'
      'libva' 'libvdpau' 'libwebp' 'opencore-amr' 'openjpeg' 'opus'
      'schroedinger' 'sdl' 'speex' 'v4l-utils' 'xvidcore' 'zlib'
      'libdcadec.so' 'libvidstab.so' 'libvorbis.so' 'libvorbisenc.so'
      'libvidstab.so' 'libvorbis.so' 'libvorbisenc.so' 'libvpx.so'
      'libx264.so' 'libx265.so'
      'libfdk-aac'
      )
makedepends=('hardening-wrapper' 'ladspa' 'libvdpau' 'yasm')
optdepends=('ladspa: LADSPA filters')
provides=(
      "ffmpeg=$pkgver"
      'libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
      'libavresample.so' 'libavutil.so' 'libpostproc.so' 'libswresample.so'
      'libswscale.so'
)
conflicts=("$_name")
source=(http://ffmpeg.org/releases/$_name-$pkgver.tar.bz2{,.asc}
        ffmpeg-2.8.1-libvpxenc-remove-some-unused-ctrl-id-mappings.patch)
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8') # ffmpeg-devel
md5sums=('937a6573ba399cf3e6808c9c6ea3d6d6'
         'SKIP'
         '71be9bcd297cb9ce833bbc5d425c0470')

prepare() {
  cd $_name-$pkgver
  patch -p1 -i ../ffmpeg-2.8.1-libvpxenc-remove-some-unused-ctrl-id-mappings.patch
}

build() {
  cd $_name-$pkgver

  ./configure \
    --prefix=/usr \
    --disable-debug \
    --disable-static \
    --disable-stripping \
    --enable-avisynth \
    --enable-avresample \
    --enable-fontconfig \
    --enable-gnutls \
    --enable-gpl \
    --enable-ladspa \
    --enable-libass \
    --enable-libbluray \
    --enable-libdcadec \
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libgsm \
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
  make DESTDIR="$pkgdir" install install-man
  install -Dm755 tools/qt-faststart "$pkgdir"/usr/bin/qt-faststart


  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m 0644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
