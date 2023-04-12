# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=qt5-quickcontrols2-git
pkgver=5.15.9.r0.g5e31cdc9d
pkgrel=1
pkgdesc="Qt5 Quick Controls 2 module"
arch=('i686' 'x86_64')
url="https://www.qt.io/"
license=('FDL' 'GPL' 'LGPL')
depends=('qt5-declarative')
makedepends=('git')
optdepends=('qt5-graphicaleffects: for the Material style')
provides=("qt5-quickcontrols2=$pkgver")
conflicts=('qt5-quickcontrols2')
source=("git+https://code.qt.io/qt/qtquickcontrols2.git#branch=5.15")
sha256sums=('SKIP')


prepare() {
  cd "$srcdir"

  mkdir -p "_build"
}

pkgver() {
  cd "qtquickcontrols2"

  _tag=$(git tag -l --sort -creatordate | grep -E '^v5\.15[0-9\.]+' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//;s/-lts-lgpl//'
}

build() {
  cd "_build"

  qmake ../qtquickcontrols2
  make
}

package() {
  cd "_build"

  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;
}
