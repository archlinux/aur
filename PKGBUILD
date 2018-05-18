#Contributor: Fabio 'Lolix' Loli <lolix@disroot.org>
#Contributor: Øyvind 'MrElendig' Heggstad <mrelendig@har-ikkje.net>
#Contributor: jsteel <mail at jsteel dot org>

pkgname=moc-svn
pkgver=r2963
pkgrel=1
pkgdesc='A powerful & easy to use console audio player'
url="http://moc.daper.net"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libmad' 'libid3tag' 'jack' 'curl' 'libltdl' 'file')
source=('moc::svn://daper.net/moc/trunk'
        'moc-ffmpeg4.patch')
sha1sums=('SKIP'
          '007a0580ac754e1c318a0d0b6f0d403883797eaf')
makedepends=('speex' 'ffmpeg' 'taglib' 'libmpcdec' 'wavpack'
             'libmodplug' 'subversion' 'faad2')
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

pkgver() {
  cd moc
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}


prepare() {
  cd moc
  patch -p0 -i ../moc-ffmpeg4.patch # Fix build with ffmpeg 4
}

build() {
  cd moc
  autoreconf -f -i -Wall,no-obsolete
  ./configure --prefix=/usr --without-rcc \
    --with-alsa --with-jack --with-aac --with-mp3 \
    --with-musepack --with-vorbis --with-flac --with-wavpack \
    --with-sndfile --with-modplug --with-ffmpeg --with-speex \
    --with-samplerate --with-curl --disable-debug
  make
}

package() {
  cd moc
  make DESTDIR="$pkgdir" install
}
