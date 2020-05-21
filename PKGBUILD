# Maintainer: osch <oliver@luced.de>

pkgname=audacity-wxgtk2
pkgver=2.4.1
pkgrel=1
pkgdesc="Record and edit audio files"
arch=('x86_64')
url="https://audacityteam.org"
license=('GPL2' 'CCPL')
groups=('pro-audio')
depends=('libmad' 'libid3tag' 'wxgtk2' 'soundtouch' 'ffmpeg' 'vamp-plugin-sdk'
'portsmf' 'twolame' 'suil' 'lilv')
makedepends=('cmake')
provides=("audacity")
conflicts=("audacity")
source=("https://github.com/audacity/audacity/archive/Audacity-${pkgver}.tar.gz")
sha512sums=('2f0a3f7e24dce91ae520e285dbb05778b68e0fe37b8ded55ac568b5f8135069951b3986764adc5d0791c165b283a3c19596f1d6f51ba17028e0eb04558c63f25')

prepare() {
  mv -v "audacity-Audacity-${pkgver}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  autoreconf -vi
  sed -i -e 's:define  *AUDACITY_BUILD_LEVEL.*$:define AUDACITY_BUILD_LEVEL 2:' src/Audacity.h
}

build() {
  cd "${pkgname}-${pkgver}"
  WX_CONFIG=wx-config ./configure --prefix="/usr" \
    --with-libsndfile="system" \
    --with-ffmpeg="system" \
    --with-expat="system" \
    --with-lame="system" \
    --with-libsoxr="system" \
    --with-libflac \
    --with-libid3tag \
    --with-libsamplerate \
    --with-sbsms \
    --with-soundtouch \
    --with-libtwolame \
    --with-libvorbis \
    --with-lv2 \
    --with-portaudio \
    --with-portmidi
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
