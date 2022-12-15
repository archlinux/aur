# Maintainer: Hajós Attila <linux.alucard@gmail.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=moc-unstable
_pkgname=moc
pkgver=2.6_alpha3
_pkgver=${pkgver/_/-}
pkgrel=1
epoch=1
pkgdesc="An ncurses console audio player designed to be powerful and easy to use"
arch=('x86_64')
url="https://moc.daper.net/"
license=('GPL')
depends=('libmad' 'libid3tag' 'jack' 'curl' 'libltdl' 'file')
makedepends=('speex' 'ffmpeg4.4' 'taglib' 'libmpcdec' 'wavpack' 'libmodplug' 'faad2')
optdepends=('speex: for using the speex plugin'
	    'ffmpeg4.4: for using the ffmpeg plugin'
	    'taglib: for using the musepack plugin'
	    'libmpcdec: for using the musepack plugin'
        'wavpack: for using the wavpack plugin'
        'faad2: for using the aac plugin'
	    'libmodplug: for using the modplug plugin')
source=(http://ftp.daper.net/pub/soft/moc/unstable/${_pkgname}-${_pkgver}.tar.{xz,asc}
        moc-ffmpeg4.patch
        moc-https.patch)
conflicts=(moc)
provides=(moc)
sha1sums=('01400a96b6e40346c15ad02c38d494e10721fd63'
          '007a0580ac754e1c318a0d0b6f0d403883797eaf'
          'SKIP'
          'e3362ddd41126e2be874cd372a053fdaccf0f616')
validpgpkeys=('59359B80406D9E73E80599BEF3121E4F2885A7AA')

prepare() {
  cd $_pkgname-$_pkgver
  patch -N -p0 -i ../moc-ffmpeg4.patch # Fix build with ffmpeg 4
  patch -N -p0 -i ../moc-https.patch   # Allow https for urls https://moc.daper.net/node/1872
}

build() {
  cd ${_pkgname}-${_pkgver}
  export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'
  ./configure --prefix=/usr --without-rcc \
    --with-oss --with-alsa --with-jack --with-aac --with-mp3 \
    --with-musepack --with-vorbis --with-flac --with-wavpack \
    --with-sndfile --with-modplug --with-ffmpeg --with-speex \
    --with-samplerate --with-curl  --disable-cache --disable-debug
  make
}

package() {
  cd ${_pkgname}-${_pkgver}
  make DESTDIR="${pkgdir}" install
}
