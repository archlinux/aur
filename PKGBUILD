# $Id$
# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>
# Contributor: Vladimir Protasov <eoranged@ya.ru>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname='moc-pulse'
_pkgname='moc'
pkgver=2.5.1
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
        'pulseaudio.patch')
sha1sums=('9e9a9bf0260cd7d7c170e4ef957041cf2275de32'
          'SKIP'
          '5c6385760ba40ee8a330d28d520c44eac2cbbae1')
validpgpkeys=('59359B80406D9E73E80599BEF3121E4F2885A7AA')

prepare() {
  cd "${_pkgname}-${pkgver}"
  # Add pulseaudio backend
  patch -p1 -i ../pulseaudio.patch
}

build() {
  cd "${_pkgname}-${pkgver}"
  
  msg "Re-creating ./configure script"
  aclocal
  automake --add-missing
  autoreconf
  
  msg "Begin configuring"
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

# vim: ts=2 sw=2
