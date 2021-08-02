# Maintainer: osch <oliver@luced.de>

pkgname=audacity-wxgtk2
pkgver=3.0.3
pkgrel=1
pkgdesc="Record and edit audio files"
arch=('x86_64')
url="https://audacityteam.org"
license=('GPL2' 'CCPL')
groups=('pro-audio')
depends=('libmad' 'libid3tag' 'gtk2' 'glib2' 'soundtouch' 'ffmpeg' 'vamp-plugin-sdk'
'portsmf' 'portmidi' 'twolame' 'suil' 'lilv' 'lv2' 'serd' 'sord' 'sratom' 'python'
'flac' 'libvorbis' 'libogg' 'vamp-plugin-sdk' 'portaudio' 'libsoxr' 'libsndfile' 'lame'
'expat' 'alsa-lib' 'jack' 'util-linux' 'zlib')
makedepends=('cmake' 'autoconf' 'automake' 'libtool' 'git' 'conan')
provides=("audacity")
conflicts=("audacity")
source=("https://github.com/audacity/audacity/archive/Audacity-${pkgver}.tar.gz")
sha512sums=('822f77537d39becb0caf644277d2c3ee4a7b0ffbdc6a7bc046c004b4375a9a4d6871f6404bbbd53092c641b2d8f59c022d95df4e4f7d039892d2f5887d7e8e35')

prepare() {
  cd "audacity-Audacity-${pkgver}"
  sed -i -e '/#include <iterator>/i #include <limits>' libraries/lib-utility/MemoryX.h
  mkdir -p build
  cd build
  cmake -G "Unix Makefiles" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DAUDACITY_BUILD_LEVEL=2 \
        -Daudacity_use_ffmpeg=loaded \
        -Daudacity_has_networking=off \
        ..
}

build() {
  cd "audacity-Audacity-${pkgver}"/build
  make
}

package() {
  cd "audacity-Audacity-${pkgver}"/build
  make DESTDIR="${pkgdir}" install
  rm "${pkgdir}"/usr/audacity
  chmod -R go=u "${pkgdir}"
  chmod -R go-w "${pkgdir}"
}
