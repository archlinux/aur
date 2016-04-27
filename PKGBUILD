# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Cristian Maureira <saint@archlinux.cl>
# Contributor: Dr.Egg <rwhite@archlinux.us>

pkgname=musescore-git
pkgver=r10399.cb65146
_branch=master
pkgrel=1
pkgdesc='Latest git-version of the sheet music editor MuseScore'
arch=('i686' 'x86_64')
url='https://github.com/musescore/MuseScore'
license=('GPL')
depends=('qt5-svg'
	'qt5-tools'
	'qt5-webengine'
	'shared-mime-info')
makedepends=('cmake'
	'doxygen'
	'git'
	'lame'
	'qt5-script'
	'texlive-core')
optdepends=('lame: MP3 export')
install='musescore.install'

source=("git+$url.git#branch=$_branch")
md5sums=('SKIP')

pkgver() {
  cd MuseScore
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
	-DBUILD_JACK=OFF \
	-DBUILD_PORTAUDIO=OFF .
  make lrelease
  make
}

package() {
  cd MuseScore
  make DESTDIR="${pkgdir}" SUFFIX="-git" LABEL="Git Build" install
}
