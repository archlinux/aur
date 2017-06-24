# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Cristian Maureira <saint@archlinux.cl>
# Contributor: Dr.Egg <rwhite@archlinux.us>

pkgname=musescore-git
pkgver=2.1.0.r61.ga161af444
_branch=2.2
pkgrel=1
pkgdesc='git-version of the sheet music editor MuseScore'
arch=('i686' 'x86_64')
url='https://github.com/musescore/MuseScore'
license=('GPL')
depends=('desktop-file-utils'
    'gtk-update-icon-cache'
    'libpulse'
    'portaudio'
    'qt5-quickcontrols'
    'qt5-svg'
    'qt5-tools'
    'qt5-webkit'
    'shared-mime-info')
makedepends=('cmake'
	'doxygen'
	'git'
	'lame'
	'qt5-script'
	'texlive-core')
optdepends=('lame: MP3 export')
install=musescore.install
source=("git+$url.git#branch=$_branch"
    'metronomeVolume.patch')
md5sums=('SKIP'
         '20d2d42d1a4b1510341f1fec2ef8d9b4')

pkgver() {
  cd MuseScore
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd MuseScore
    patch -p1 -i $srcdir/metronomeVolume.patch
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
