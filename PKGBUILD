# Maintainer: osch <oliver@luced.de>

pkgname=audacity-wxgtk2
pkgver=2.4.0
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
sha512sums=('a9f926e3a539c3a052249a7a1e968b629a8a807fa2c74d940bd18df5744c36cb4f18b4b78c56fe7fbabce12ffa732cb413418a512cf91bb5c3c111766c5ba0e3')

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
