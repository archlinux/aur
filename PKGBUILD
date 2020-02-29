# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=qt5-websockets-git
pkgver=5.15.0_beta1.r6.g87c9513
pkgrel=1
pkgdesc="Qt5 WebSockets module"
arch=('i686' 'x86_64')
url="https://www.qt.io/"
license=('GPL' 'LGPL' 'custom')
depends=('qt5-base')
makedepends=('git' 'qt5-declarative')
provides=('qt5-websockets')
conflicts=('qt5-websockets')
source=("git+https://code.qt.io/qt/qtwebsockets.git#branch=5.15")
sha256sums=('SKIP')


prepare() {
  cd "$srcdir"

  mkdir -p "_build"
}

pkgver() {
  cd "qtwebsockets"

  _tag=$(git tag -l --sort -v:refname | sed -n '1,1{s/v//p}')
  _rev=$(git rev-list --count v$_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/-/_/g'
}

build() {
  cd "_build"

  qmake ../qtwebsockets
  make
}

package() {
  cd "_build"

  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  cd "$srcdir/qtwebsockets"
  install -Dm644 "LICENSE.GPL3-EXCEPT" -t "$pkgdir/usr/share/licenses/qt5-websockets"
}
