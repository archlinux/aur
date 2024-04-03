# Maintainer: Adam Reichold <adam.reichold@t-online.de>

pkgname=qmediathekview-git
pkgver=r146.06113d8
pkgrel=1
pkgdesc='An alternative front-end to the MediathekView database. (development version)'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/adamreichold/QMediathekView'
license=('GPL3')
depends=('qt6-base' 'hicolor-icon-theme')
optdepends=('vlc: for direct playback of shows')
makedepends=('git' 'qt6-tools' 'rust' 'cargo')
conflicts=('qmediathekview')
source=('git+https://github.com/adamreichold/QMediathekView.git')
md5sums=('SKIP')
# disable LTO since this breaks linking static libraries built by GCC into the static library built by rustc into the binary built by GCC,
# c.f. https://github.com/adamreichold/QMediathekView/issues/18
options+=('!lto')

pkgver() {
  cd "$srcdir/QMediathekView"
  
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/QMediathekView/internals"

  cargo fetch
}

build() {
  cd "$srcdir/QMediathekView"

  qmake6
  make
}

package() {
  cd "$srcdir/QMediathekView"

  make "INSTALL_ROOT=$pkgdir" install
}
