# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=qt5-connectivity-git
pkgver=5.15.9.r0.g3dcb548b
pkgrel=1
pkgdesc="Qt5 connectivity module"
arch=('i686' 'x86_64')
url="https://www.qt.io/"
license=('FDL' 'GPL' 'LGPL' 'custom')
depends=('qt5-declarative' 'bluez-libs')
makedepends=('git')
provides=("qt5-connectivity=$pkgver")
conflicts=('qt5-connectivity')
source=("git+https://code.qt.io/qt/qtconnectivity.git#branch=5.15")
sha256sums=('SKIP')


prepare() {
  cd "$srcdir"

  mkdir -p "_build"
}

pkgver() {
  cd "qtconnectivity"

  _tag=$(git tag -l --sort -creatordate | grep -E '^v5\.15[0-9\.]+' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//;s/-lts-lgpl//'
}

build() {
  cd "_build"

  qmake ../qtconnectivity
  make
}

package() {
  cd "_build"

  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  cd "$srcdir/qtconnectivity"
  install -Dm644 "LICENSE.GPL3-EXCEPT" -t "$pkgdir/usr/share/licenses/qt5-connectivity"
}
