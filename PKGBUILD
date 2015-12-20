# Maintainer:  Kamran Mackey <kamranm1200@gmail.com>
# Contributor: richteer <richteer at lastprime.net>
# Contributor: DrZaius <lou at fakeoutdoorsman.com>

pkgname=ffmpeg-git
pkgver=r77404.70f13ab
pkgrel=1
pkgdesc="Complete solution to record, convert and stream audio and video (git version)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://ffmpeg.org/"
depends=('alsa-lib' 'bzip2' 'freetype2' 'gnutls' 'lame' 'libass' 'libfdk-aac' 'libtheora' 'libva' 'libvdpau' 'libvorbis' 'libvpx' 'opus' 'sdl' 'texinfo' 'libx264' 'x265-hg' 'zlib')
makedepends=('git' 'yasm')
conflicts=('ffmpeg')
provides=("ffmpeg=$pkgver" "qt-faststart")
source=("$pkgname"::'git://source.ffmpeg.org/ffmpeg.git'
	ffmpeg-2.8.1-libvpxenc-remove-some-unused-ctrl-id-mappings.patch)
md5sums=('SKIP'
         'SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  patch -p1 -i ../ffmpeg-2.8.1-libvpxenc-remove-some-unused-ctrl-id-mappings.patch
}

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
