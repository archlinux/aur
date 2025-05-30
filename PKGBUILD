#Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
#Contributor: Øyvind 'MrElendig' Heggstad <mrelendig@har-ikkje.net>
#Contributor: jsteel <mail at jsteel dot org>

_pkgname=moc
pkgname="${_pkgname}-pulse-svn"
pkgver=r3005
pkgrel=7
pkgdesc='An ncurses console audio player with support for pulseaudio (SVN)'
url='http://moc.daper.net'
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=('libmad' 'libid3tag' 'jack' 'curl' 'libltdl' 'file' 'sndio' 'popt')
makedepends=('speex' 'ffmpeg4.4' 'taglib' 'libmpcdec' 'wavpack' 'libmodplug' 'faad2' 'subversion'
           # 'sidplay2-libs' # uncomment to compile libsidplay2/SID file support
           # 'pulse-native-provider' # uncomment to compile pulseaudio support
            )
optdepends=('speex: for using the speex plugin'
            'ffmpeg4.4: for using the ffmpeg plugin'
            'taglib: for using the musepack plugin'
            'libmpcdec: for using the musepack plugin'
            'wavpack: for using the wavpack plugin'
            'libmodplug: for using the modplug plugin'
            'faad2: for use the aac plugin'
            'sidplay2-libs: for use the SID plugin'
            'pulse-native-provider: for using the pulseaudio plugin')
provides=('moc=2.6_alpha3')
conflicts=('moc')
options=('!libtool')
source=("${pkgname}::svn://daper.net/moc/trunk"
        '0001-Pulseaudio-backend.patch'
        'moc-https.patch'
        'moc-headers.patch')
sha1sums=('SKIP'
          'd86a04606eaa0960f3b59626070cd231d37b6430'
          'e3362ddd41126e2be874cd372a053fdaccf0f616'
          '52787869fe57fc17f10c3cdd7b496153c0d5f085')

pkgver() {
  cd "$srcdir/$pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "$srcdir/$pkgname"

  # Allow https for urls https://moc.daper.net/node/1872 (taken from official release on ArchLinux)
  patch -p0 -i ../moc-https.patch
  # Add header files to install needed for plugin development
  patch -p0 -i ../moc-headers.patch
  # Add pulseaudio backend
  patch -p1 -i ../0001-Pulseaudio-backend.patch

  # re-configure
  autoreconf -i -f -I /usr/share/gettext/m4
}

build() {
  cd "$srcdir/$pkgname"

  export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'

  ./configure --prefix=/usr --without-rcc --with-pulse \
    --with-alsa --with-oss --with-jack --with-aac --with-mp3 \
    --with-musepack --with-vorbis --with-flac --with-wavpack \
    --with-sndfile --with-modplug --with-ffmpeg --with-speex \
    --with-samplerate --with-curl --with-sidplay2 \
    --disable-cache --disable-debug
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}

# vim: ts=2 sw=2
