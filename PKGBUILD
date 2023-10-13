# Maintainer: evorster <evorster@gmail.com>
# Contributor: osch <oliver@luced.de>

pkgname=audacity-local-git
pkgver=3.4.0.0.r18023
pkgrel=1
pkgdesc="Record and edit audio files - Built with package versions as recommended by Audacity team"
arch=('x86_64')
url="https://audacityteam.org"
license=('GPL2' 'CCPL')
groups=('pro-audio')
depends=('gtk3' 'gtk2' 'ffmpeg' 'portmidi' 'python'
'portaudio' 'jack')
makedepends=('cmake' 'autoconf' 'automake' 'libtool' 'git' 'conan' 'catch2')
provides=(
    audacity
    ladspa-host
    lv2-host
    vamp-host
    vst-host
    vst3-host
    )
conflicts=("audacity")
#
source=("git+https://github.com/audacity/audacity.git")
## Comment out the source variable above and uncomment the one below for the last version where the calf plugins work properly
# There is some sort of regression in later versions. Once it's sorted I'll remove this comment.
#source=("git+https://github.com/audacity/audacity.git#branch=release-3.1.3")
#
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
## To set a custom download directory for Conan2 still seems a bit of a mystery to me.
  export CONAN_USER_HOME="$depsDir/conan"
#  conan config home
#  conan config init
#  conan config set storage.download_cache="$CONAN_USER_HOME/download_cache"
#Let's not remove it every time, it's a pain building them.
#  conan remove "*" --src --builds --force
## libjpeg frm conan peeks at system libtiff. Temporarily using the system version below.


  cmake -G "Unix Makefiles" ../audacity \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DAUDACITY_BUILD_LEVEL=2 \
        -Daudacity_has_vst3=off \
        -Daudacity_use_jpeg=system \
        -Daudacity_has_networking=off \
        -Daudacity_lib_preference=system \
        -Daudacity_use_expat=system \
        -Daudacity_use_ffmpeg=loaded \
        -Daudacity_use_zlib=system \
        -Daudacity_use_curl=system \
        -Daudacity_use_midi=local \
        -Daudacity_use_wxwidgets=local 


# Old build style....
#        -Daudacity_use_portaudio=local \
#        -Daudacity_use_ffmpeg=loaded 
#	-Daudacity_use_vst3sdk=system

}

build() {
cd build
  make
#Let's not remove the conan stuff every time, rebuilding's a pain.
#  conan remove "*" --src --builds --force
}

package() {
make -C build DESTDIR="${pkgdir}" install
}
