# Maintainer:  richteer <richteer at lastprime.net>
# Contributor: DrZaius <lou at fakeoutdoorsman.com>

pkgname=ffmpeg-git
pkgver=r72137.f6b8b96
pkgrel=1
pkgdesc="Universal multimedia toolkit"
arch=('i686' 'x86_64')
license=('GPL')
url="http://ffmpeg.org/"
depends=('alsa-lib' 'bzip2' 'freetype2' 'gnutls' 'lame' 'libass' 'libfdk-aac' 'libtheora' 'libva' 'libvdpau' 'libvorbis' 'libvpx' 'opus' 'sdl' 'texinfo' 'libx264' 'x265-hg' 'zlib')
makedepends=('git' 'yasm')
conflicts=('ffmpeg')
provides=("ffmpeg=$pkgver" "qt-faststart")
source=("$pkgname"::'git://source.ffmpeg.org/ffmpeg.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"

  ./configure            \
    --prefix=/usr        \
    --shlibdir=/usr/lib  \
    --disable-static     \
    --enable-gpl         \
	--enable-gnutls      \
    --enable-libass      \
    --enable-libfdk-aac  \
    --enable-libfreetype \
    --enable-libmp3lame  \
    --enable-libopus     \
    --enable-libtheora   \
    --enable-libvorbis   \
    --enable-libvpx      \
    --enable-libx264     \
    --enable-libx265     \
    --enable-nonfree     \
    --enable-shared      \
    --enable-x11grab     \

  make
  make tools/qt-faststart
  make doc
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install install-man
  install -D -m755 tools/qt-faststart "$pkgdir/usr/bin/qt-faststart"
}
