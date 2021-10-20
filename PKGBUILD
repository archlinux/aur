# Maintainer: osch <oliver@luced.de>

pkgname=audacity-wxgtk2
pkgver=3.0.5
pkgrel=1
pkgdesc="Record and edit audio files"
arch=('x86_64')
url="https://audacityteam.org"
license=('GPL2' 'CCPL')
groups=('pro-audio')
depends=('libmad' 'libid3tag' 'gtk2' 'glib2' 'soundtouch' 'ffmpeg' 'vamp-plugin-sdk'
'portsmf' 'portmidi' 'twolame' 'suil' 'lilv' 'lv2' 'serd' 'sord' 'sratom' 'python'
'flac' 'libvorbis' 'libogg' 'vamp-plugin-sdk' 'portaudio' 'libsoxr' 'libsndfile' 'lame'
'expat' 'alsa-lib' 'jack' 'util-linux')
makedepends=('cmake' 'autoconf' 'automake' 'libtool' 'git' 'conan')
provides=("audacity")
conflicts=("audacity")
source=("https://github.com/audacity/audacity/archive/Audacity-${pkgver}.tar.gz")
sha512sums=('d7585bf1b1715e54a79ab2c940dca91ec3041a97f02c5483eff9321bb7375401f868b7c394e06cf5e956017974ce21a0f0203c84d3a9b71745deb9a698b79131')

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
        -Daudacity_conan_enabled=off \
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
