# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Cristian Maureira <saint@archlinux.cl>
# Contributor: Dr.Egg <rwhite@archlinux.us>

pkgname=musescore-git
pkgver=3.2.r6.gf8dfe6d5c
_branch=3.2.1
pkgrel=1
pkgdesc='git-version of the sheet music editor MuseScore'
arch=('i686' 'x86_64')
url='https://github.com/musescore/MuseScore'
license=('GPL')
depends=(alsa-lib
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
  zlib)
makedepends=(  cmake
  doxygen
  git
  lame
  qt5-script
  texlive-core)
optdepends=('lame: MP3 export')
conflicts=('musescore')
provides=('musescore')
install=musescore.install
source=("git+$url.git#branch=$_branch")
md5sums=('SKIP')

pkgver() {
  cd MuseScore
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd MuseScore
  make revision
  cmake -DCMAKE_BUILD_TYPE=RELEASE \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-DMSCORE_INSTALL_SUFFIX="-git" \
	-DMUSESCORE_LABEL="Git Build" \
	-DBUILD_LAME="ON" \
	-DCMAKE_SKIP_RPATH="FALSE" \
	-DBUILD_JACK="ON" \
	-DBUILD_PORTAUDIO="ON" \
	-DUSE_SYSTEM_FREETYPE="ON" .
  make lrelease
  make
}

package() {
  cd MuseScore
  make DESTDIR="${pkgdir}" SUFFIX="-git" LABEL="Git Build" install
}
