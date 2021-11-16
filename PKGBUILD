# Maintainer: osch <oliver@luced.de>

pkgname=audacity-wxgtk2
pkgver=3.1.2
pkgrel=1
pkgdesc="Record and edit audio files"
arch=('x86_64')
url="https://audacityteam.org"
license=('GPL2' 'CCPL')
groups=('pro-audio')
depends=('libmad' 'libid3tag' 'gtk2' 'glib2' 'soundtouch' 'ffmpeg' 'vamp-plugin-sdk'
'portsmf' 'portmidi' 'twolame' 'suil' 'lilv' 'lv2' 'serd' 'sord' 'sratom' 'python'
'flac' 'libvorbis' 'libogg' 'vamp-plugin-sdk' 'portaudio' 'libsoxr' 'libsndfile' 'lame'
'expat' 'alsa-lib' 'jack' 'util-linux' 'util-linux-libs' 'curl' 'zlib')
makedepends=('cmake' 'autoconf' 'automake' 'libtool' 'git' 'conan')
provides=("audacity")
conflicts=("audacity")
source=("https://github.com/audacity/audacity/archive/Audacity-${pkgver}.tar.gz")
sha512sums=('cbecc2adff387d43106096849087516e7a72a4580bfbfa5a0d7b0b4eaebcc15fed4c2cff17fa071ce082bdfb5ceeeed49716a6115658b288c12fb88d44836951')

prepare() {
  cd "audacity-Audacity-${pkgver}"
  sed -i -e '/#include <iterator>/i #include <limits>' libraries/lib-utility/MemoryX.h
  mkdir -p build
  cd build
  conan remove "*" --src --builds --force
  cmake -G "Unix Makefiles" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DAUDACITY_BUILD_LEVEL=2 \
        -Daudacity_has_networking=off \
        -Daudacity_lib_preference=system \
        -Daudacity_use_expat=system \
        -Daudacity_use_ffmpeg=loaded \
        -Daudacity_use_zlib=system \
        -Daudacity_use_curl=system \
        ..
}

build() {
  cd "audacity-Audacity-${pkgver}"/build
  make
  conan remove "*" --src --builds --force
}

package() {
  cd "audacity-Audacity-${pkgver}"/build
  make DESTDIR="${pkgdir}" install
  rm "${pkgdir}"/usr/audacity
  chmod -R go=u "${pkgdir}"
  chmod -R go-w "${pkgdir}"
}
