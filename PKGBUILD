# $Id$
# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>
# Contributor: Vladimir Protasov <eoranged@ya.ru>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname='moc-pulse'
_pkgname='moc'
pkgver=2.5.0
pkgrel=1
pkgdesc='An ncurses console audio player with support for pulseaudio'
arch=('i686' 'x86_64')
url="http://moc.daper.net/"
license=('GPL')
depends=('libmad' 'libid3tag' 'jack' 'curl' 'libltdl' 'file' 'pulseaudio')
makedepends=('speex' 'ffmpeg' 'taglib' 'libmpcdec' 'wavpack' 'libmodplug' 'faad2')
optdepends=('speex: for using the speex plugin'
	        'ffmpeg: for using the ffmpeg plugin'
	        'taglib: for using the musepack plugin'
	        'libmpcdec: for using the musepack plugin'
            'wavpack: for using the wavpack plugin'
            'faad2: for using the aac plugin'
	        'libmodplug: for using the modplug plugin')
provides=('moc')
conflicts=('moc')
source=(http://ftp.daper.net/pub/soft/moc/stable/${_pkgname}-${pkgver}.tar.bz2{,.sig}
        'moc-ffmpeg3.patch'
        'pulseaudio.patch')
sha1sums=('a02c10075541995771dbdccb7f2d0ecd19d70b81'
          'SKIP'
          '7d997ac25041010837d5f3ec79920b8afeec87f7'
          '5c6385760ba40ee8a330d28d520c44eac2cbbae1')
validpgpkeys=('59359B80406D9E73E80599BEF3121E4F2885A7AA')

prepare() {
  cd "${_pkgname}-${pkgver}"
# Add pulseaudio backend
  patch -p1 -i ../pulseaudio.patch

# Fix build with ffmpeg 3.0 (Debian)
  patch -p1 -i ../moc-ffmpeg3.patch
}

build() {
  cd "${_pkgname}-${pkgver}"
  aclocal
  automake --add-missing
  autoreconf
  ./configure --prefix=/usr --without-rcc \
    --with-pulse --with-oss --with-alsa --with-jack --with-aac \
    --with-mp3 --with-musepack --with-vorbis --with-flac \
    --with-wavpack --with-sndfile --with-modplug --with-ffmpeg \
    --with-speex --with-samplerate --with-curl  --disable-cache \
    --disable-debug
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim:ts=4 sw=4
