# Maintainer: Bernhard Landauer <oberon@manjaro.org>

pkgname=musescore-dev
_pkgname=MuseScore
pkgver=r16111.4b6aa73e3
_branch=master
pkgrel=1
pkgdesc='Development branch of the sheet music editor MuseScore'
arch=('i686' 'x86_64')
url='https://github.com/musescore/MuseScore'
license=('GPL')
depends=(
  alsa-lib
  libpulse
  libsndfile
  libvorbisfile.so
  portaudio
  portmidi
  qt5-base
  qt5-declarative
  qt5-svg
  qt5-tools
  qt5-webengine
  qt5-xmlpatterns
  zlib
)
makedepends=(
  cmake
  doxygen
  git
  lame
  qt5-script
  texlive-core
)
optdepends=('lame: MP3 export')
conflicts=('musescore')
provides=('musescore')
install=musescore.install
source=("git+$url.git#branch=$_branch")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  make revision
  cmake -DCMAKE_BUILD_TYPE=DEBUG \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-DMSCORE_INSTALL_SUFFIX="-dev" \
	-DMUSESCORE_LABEL="Development Build" \
	-DBUILD_LAME="ON" \
	-DCMAKE_SKIP_RPATH="FALSE" \
	-DBUILD_JACK="ON" \
	-DBUILD_PORTAUDIO="ON" \
	-DUSE_SYSTEM_FREETYPE="ON" .
  make lrelease
  make
}

package() {
  cd $_pkgname
  make DESTDIR="${pkgdir}" SUFFIX="-dev" LABEL="Development Build" install
}
