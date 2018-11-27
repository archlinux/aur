# Maintainer: Bernhard Landauer <oberon@manjaro.org>

pkgname=musescore-dev
_pkgname=MuseScore
pkgver=r14198.795912da2
_branch=master
pkgrel=1
pkgdesc='Development branch of the sheet music editor MuseScore'
arch=('i686' 'x86_64')
url='https://github.com/musescore/MuseScore'
license=('GPL')
depends=('desktop-file-utils'
    'gtk-update-icon-cache'
    'libpulse'
    'portaudio'
    'portmidi'
    'qt5-quickcontrols'
    'qt5-svg'
    'qt5-tools'
    'qt5-webengine'
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
    'fix_qt_install_path.patch')
md5sums=('SKIP'
         'cc54bc4072ace47c35af7c2478e0d1fc')

prepare() {
    cd $_pkgname
    patch -p1 -i $srcdir/fix_qt_install_path.patch
}

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  make revision
  cmake -DCMAKE_BUILD_TYPE=DEBUG \
	-DCMAKE_INSTALL_PREFIX="/usr" \
    -DQT_INSTALL_PREFIX="/usr/lib/qt" \
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
