# Maintainer: JP Cimalando <jp-dev@inbox.ru>
pkgname=bambootracker-git
_pkgname=bambootracker
pkgver=0.4.5.r85.g4af2db7
pkgrel=1
epoch=
pkgdesc="YM2608 (OPNA) music tracker"
arch=('x86_64')
url="https://github.com/rerrahkr/BambooTracker"
license=('GPL2')
groups=()
depends=('qt5-base' 'jack' 'libpulse' 'hicolor-icon-theme')
makedepends=('git' 'qt5-tools')
checkdepends=()
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=()
options=()
install=
changelog=
source=("$_pkgname::git+https://github.com/rerrahkr/BambooTracker.git"
        'git+https://github.com/thestk/rtaudio'
        'git+https://github.com/thestk/rtmidi')
md5sums=('SKIP'
         'SKIP'
         'SKIP')
noextract=()
validpgpkeys=()

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "$_pkgname"
  git submodule init
  git config submodule.submodules/RtAudio/src.url $srcdir/rtaudio
  git config submodule.submodules/RtMidi/src.url $srcdir/rtmidi
  git submodule update
}

build() {
  cd "$_pkgname"
  qmake Project.pro CONFIG+=release CONFIG-=debug CONFIG+=use_jack CONFIG+=jack_has_rename CONFIG+=use_pulse PREFIX=/usr
  make -j1 qmake_all
  make
}

package() {
  cd "$_pkgname"
  make INSTALL_ROOT="$pkgdir" install
}
