# Maintainer: fenugrec
# TODO : make sure depends and makedepends are complete

pkgname=candevstudio-git
_pkgbasename=candevstudio
pkgver=r269.fe417bd3
pkgrel=1
pkgdesc="Development tool for CAN bus simulation"
arch=('i686' 'x86_64')
url="https://github.com/GENIVI/CANdevStudio"
license=('MPL2')
depends=('qt5-base' 'qt5-serialbus')
makedepends=('git' 'cmake' 'qt5-tools')
provides=('candevstudio')
source=('candevstudio::git+https://github.com/GENIVI/CANdevStudio.git'
		'CANdevStudio.desktop')
md5sums=('SKIP'
         'f349ae9ad8f711e1ae5e7e18f833d2f5')

pkgver() {
  cd "$srcdir/$_pkgbasename"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgbasename"
  git submodule update --init --recursive
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
  make
}

package() {
  install -Dm644 CANdevStudio.desktop "$pkgdir"/usr/share/applications/CANdevStudio.desktop
  cd "$srcdir/$_pkgbasename"
  cd build
  make DESTDIR="$pkgdir" install
}
