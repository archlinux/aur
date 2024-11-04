# Maintainer: evorster <evorster@gmail.com>
# Contributor: osch <oliver@luced.de>

pkgname=audacity-local-git
pkgver=3.7.1.0.r20426
pkgrel=1
pkgdesc="Record and edit audio files - Built with mostly system libraries, except for xwWidgets and PortMidi"
arch=('x86_64')
url="https://audacityteam.org"
license=('GPL2' 'CCPL')
groups=('pro-audio')
depends=('gtk3' 'gtk2' 'ffmpeg' 'portmidi' 'python'
	'portaudio' 'jack' 'vamp-plugin-sdk' 'suil'
	'libsbsms' 'libsm' 'opusfile' 'libice' 'soundtouch'
	'libid3tag' 'twolame' 'wavpack' 'portsmf' 'rapidjson')
makedepends=('opusfile' 'xcb-util-keysyms' 'xcb-util' 'cmake' 'autoconf' 
	'automake' 'libtool' 'git' 'conan' 'vst3sdk')
provides=(
    audacity
    ladspa-host
    lv2-host
    vamp-host
    vst-host
    vst3-host
    )
conflicts=("audacity" "catch2")
source=("git+https://github.com/audacity/audacity.git#branch=release-3.7.1")
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
  export CC=gcc
  export VST3_SDK_DIR='/usr/src/vst3sdk'

  mkdir -p build
  cd build

  depsDir=$(readlink -f ./.offline)
  export CONAN_USER_HOME="$depsDir/conan"


  cmake -G "Unix Makefiles" ../audacity \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DAUDACITY_BUILD_LEVEL=2 \
        -Daudacity_has_vst3=on \
        -Daudacity_use_jpeg=system \
        -Daudacity_has_networking=off \
        -Daudacity_lib_preference=system \
        -Daudacity_use_expat=system \
        -Daudacity_use_ffmpeg=loaded \
        -Daudacity_use_zlib=system \
        -Daudacity_use_curl=system \
        -Daudacity_use_midi=local \
        -Daudacity_use_wxwidgets=local \
        -Daudacity_has_tests=Off
}

build() {
cd build
  make
}

package() {
make -C build DESTDIR="${pkgdir}" install
}
