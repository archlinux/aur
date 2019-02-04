# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=qt5-gamepad-git
pkgver=5.12.1.r9.g99cb7b0
pkgrel=1
pkgdesc="Qt5 gamepad module"
arch=('i686' 'x86_64')
url="https://www.qt.io/"
license=('GPL' 'LGPL')
depends=('qt5-declarative')
makedepends=('git')
provides=('qt5-gamepad')
conflicts=('qt5-gamepad')
source=("git+https://code.qt.io/qt/qtgamepad.git#branch=dev")
sha256sums=('SKIP')


prepare() {
  cd "$srcdir"

  mkdir -p "_build"
}

pkgver() {
  cd "qtgamepad"

  _tag=$(git tag -l --sort -v:refname | sed -n '1,1{s/v//p}')
  _rev=$(git rev-list --count v$_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash"
}

build() {
  cd "_build"

  qmake ../qtgamepad
  make
}

package() {
  cd "_build"

  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;
}
