# Maintainer: evorster <evorster@gmail.com>
# Contributor: osch <oliver@luced.de>

pkgname=audacity-wxgtk2
pkgver=3.2.4
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
sha512sums=('d69459839760f0db7d23ad5ee5601e0a0b8e918a7f9ad6773bb45b525f732d09ff0fc6ca59c6400b62d7b0b905411dd97673b6d6f2102c9ed549e9f833b60a96')

prepare() {
  cd "audacity-Audacity-${pkgver}"
  sed -i -e '/#include <iterator>/i #include <limits>' libraries/lib-utility/MemoryX.h
  mkdir -p build
  cd build
  depsDir=$(readlink -f ./.offline)
  export CONAN_USER_HOME="$depsDir/conan"
  conan config home
  conan config init
  conan config set storage.download_cache="$CONAN_USER_HOME/download_cache"
  conan remove "*" --src --builds --force
  cmake -G "Unix Makefiles" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DAUDACITY_BUILD_LEVEL=2 \
	-Daudacity_has_vst3=off \
        -Daudacity_has_networking=off \
        -Daudacity_lib_preference=system \
        -Daudacity_use_expat=system \
        -Daudacity_use_ffmpeg=loaded \
        -Daudacity_use_zlib=system \
        -Daudacity_use_curl=system \
        -Daudacity_use_wxwidgets=local \
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
#  rm "${pkgdir}"/usr/audacity
  chmod -R go=u "${pkgdir}"
  chmod -R go-w "${pkgdir}"
}
