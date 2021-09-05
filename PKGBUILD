#Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
#Contributor: Øyvind 'MrElendig' Heggstad <mrelendig@har-ikkje.net>
#Contributor: jsteel <mail at jsteel dot org>

_pkgname=moc
pkgname="${_pkgname}-pulse-svn"
pkgver=r3005
pkgrel=1
pkgdesc='An ncurses console audio player with support for pulseaudio (SVN)'
url='http://moc.daper.net'
arch=('i686' 'x86_64')
license=('GPL')
depends=('libmad' 'libid3tag' 'jack' 'curl' 'libltdl' 'file' 'pulseaudio')
makedepends=('speex' 'ffmpeg' 'taglib' 'libmpcdec' 'wavpack'
             'libmodplug' 'subversion' 'faad2' 'pulseaudio')
optdepends=('speex: for using the speex plugin'
            'ffmpeg: for using the ffmpeg plugin'
            'taglib: for using the musepack plugin'
            'libmpcdec: for using the musepack plugin'
            'wavpack: for using the wavpack plugin'
            'libmodplug: for using the modplug plugin'
            'faad2: for use the aac plugin')
conflicts=('moc')
provides=('moc')
options=('!libtool')
source=("${pkgname}::svn://daper.net/moc/trunk"
        '0001-Pulseaudio-backend.patch'
        'moc-https.patch')
sha1sums=('SKIP'
          'd86a04606eaa0960f3b59626070cd231d37b6430'
          'e3362ddd41126e2be874cd372a053fdaccf0f616')

pkgver() {
  cd "$srcdir/$pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "$srcdir/$pkgname"

  # Allow https for urls https://moc.daper.net/node/1872 (taken from official release on ArchLinux)
  patch -p0 -i ../moc-https.patch
  # Add pulseaudio backend
  patch -p1 -i ../0001-Pulseaudio-backend.patch

  # re-configure
  autoreconf -f -i -Wall,no-obsolete
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr --without-rcc --with-pulse \
    --with-alsa --with-oss --with-jack --with-aac --with-mp3 \
    --with-musepack --with-vorbis --with-flac --with-wavpack \
    --with-sndfile --with-modplug --with-ffmpeg --with-speex \
    --with-samplerate --with-curl --disable-cache --disable-debug
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
