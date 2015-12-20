# Maintainer:  Kamran Mackey <kamranm1200@gmail.com>
# Contributor: richteer <richteer at lastprime.net>
# Contributor: DrZaius <lou at fakeoutdoorsman.com>

pkgname=ffmpeg-git
pkgver=r77404.70f13ab
pkgrel=7
pkgdesc="Complete solution to record, convert and stream audio and video (git version)"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://ffmpeg.org/"
depends=(
      'alsa-lib' 'bzip2' 'fontconfig' 'fribidi' 'gnutls' 'gsm' 'lame' 'libass'
      'libbluray' 'libmodplug' 'libpulse' 'libsoxr' 'libssh' 'libtheora'
      'libva' 'libvdpau' 'libwebp' 'opencore-amr' 'openjpeg' 'opus'
      'schroedinger' 'sdl' 'speex' 'v4l-utils' 'xvidcore' 'zlib'
      'libdcadec.so' 'libvidstab.so' 'libvorbis.so' 'libvorbisenc.so'
      'libvpx.so' 'libx264.so' 'libx265.so'
)
makedepends=('hardening-wrapper' 'ladspa' 'libvdpau' 'yasm')
optdepends=('ladspa: LADSPA filters')
provides=(
      'libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
      'libavresample.so' 'libavutil.so' 'libpostproc.so' 'libswresample.so'
      'libswscale.so'
)
conflicts=('ffmpeg')
source=("$pkgname"::'git://github.com/ffmpeg/ffmpeg.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"

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
    --enable-nonfree \
    --enable-shared \
    --enable-version3 \
    --enable-x11grab \

  make
  make tools/qt-faststart
  make doc
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install install-man
  install -D -m755 tools/qt-faststart "$pkgdir/usr/bin/qt-faststart"
}
