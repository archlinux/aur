# Maintainer: evorster <evorster@gmail.com>
# Contributor: osch <oliver@luced.de>

pkgname=audacity-qt-git
pkgver=3.3.0.0.r16557
pkgrel=1
pkgdesc="Record and edit audio files-tracking the QT branch in git"
arch=('x86_64')
url="https://audacityteam.org"
license=('GPL2' 'CCPL')
groups=('pro-audio')
depends=('libmad' 'libid3tag' 'gtk2' 'glib2' 'soundtouch' 'ffmpeg' 'vamp-plugin-sdk'
'portsmf' 'portmidi' 'twolame' 'suil' 'lilv' 'lv2' 'serd' 'sord' 'sratom' 'python'
'flac' 'libvorbis' 'libogg' 'vamp-plugin-sdk' 'portaudio' 'libsoxr' 'libsndfile' 'lame'
'expat' 'alsa-lib' 'jack' 'util-linux' 'util-linux-libs' 'curl' 'zlib')
makedepends=('cmake' 'autoconf' 'automake' 'libtool' 'git' 'conan' 'catch2')
provides=("audacity")
conflicts=("audacity")
source=(
"git+https://github.com/audacity/audacity.git#branch=qt"
)
sha512sums=('SKIP')

pkgver() {
  cd ${srcdir}/audacity
   VERSION=$(grep AUDACITY_VERSION CMakeLists.txt | head -n 1 | cut -d " " -f3)
   RELEASE=$(grep AUDACITY_RELEASE CMakeLists.txt | head -n 1 | cut -d " " -f3)
   REVISION=$(grep AUDACITY_REVISION CMakeLists.txt | head -n 1 | cut -d " " -f3)
   MODLEVEL=$(grep AUDACITY_MODLEVEL CMakeLists.txt | head -n 1 | cut -d " " -f3)
   _ver=$VERSION.$RELEASE.$REVISION.$MODLEVEL
  echo "$(echo ${_ver}).r$(git rev-list --count HEAD)"
}

prepare() {
#  cd "audacity-Audacity-${pkgver}"
#  sed -i -e '/#include <iterator>/i #include <limits>' libraries/lib-utility/MemoryX.h
  mkdir -p build
  cd build
  depsDir=$(readlink -f ./.offline)
  export CONAN_USER_HOME="$depsDir/conan"
  conan config home
  conan config init
  conan config set storage.download_cache="$CONAN_USER_HOME/download_cache"
  conan remove "*" --src --builds --force
  cmake -G "Unix Makefiles" ../audacity \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Daudacity_use_ffmpeg=loaded \
        -Daudacity_has_vst3=Off
#        -DAUDACITY_BUILD_LEVEL=2 \
#        -Daudacity_has_networking=off \
#        -Daudacity_lib_preference=system local \
#        -Daudacity_use_expat=system \
#        -Daudacity_use_zlib=system \
#        -Daudacity_use_curl=system \
#        -Daudacity_use_portmidi=local \
#        -Daudacity_use_wxwidgets=local \

}

build() {
#pwd
cd build
#  cd "audacity-Audacity-${pkgver}"/build
  make
  conan remove "*" --src --builds --force
}

package() {
make -C build DESTDIR="${pkgdir}" install
#  cd "audacity-Audacity-${pkgver}"/build
#  make DESTDIR="${pkgdir}" install
#  rm "${pkgdir}"/usr/audacity
#  chmod -R go=u "${pkgdir}"
#  chmod -R go-w "${pkgdir}"
}
