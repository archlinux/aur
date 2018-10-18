# Maintainer: Breizh <breizh@breizh.me>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=moc-https
_pkgname=moc
pkgver=2.5.2
pkgrel=2
epoch=1
pkgdesc="An ncurses console audio player with HTTPS stream support"
arch=('x86_64')
url="http://moc.daper.net/"
license=('GPL')
depends=('libmad' 'libid3tag' 'jack' 'curl' 'libltdl' 'file')
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
        moc-ffmpeg4.patch
	moc-https.patch)

sha1sums=('9d27a929b63099416263471c16367997c0ae6dba'
          'SKIP'
          '007a0580ac754e1c318a0d0b6f0d403883797eaf'
          'edb02778aa1eebf9f843b202bb2517b8e10f3029')
validpgpkeys=('59359B80406D9E73E80599BEF3121E4F2885A7AA')

prepare() {
  cd ${_pkgname}-$pkgver
  patch -p0 -i ../moc-ffmpeg4.patch # Fix build with ffmpeg 4 (taken from official release on ArchLinux)
  patch -p0 -i ../moc-https.patch # Fix HTTPS streams
}

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr --without-rcc \
    --with-oss --with-alsa --with-jack --with-aac --with-mp3 \
    --with-musepack --with-vorbis --with-flac --with-wavpack \
    --with-sndfile --with-modplug --with-ffmpeg --with-speex \
    --with-samplerate --with-curl  --disable-cache --disable-debug
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
