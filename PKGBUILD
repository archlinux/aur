# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Jonathan Liu <net147@gmail.com>

pkgname=qt5-datavis3d-git
pkgver=5.15.9.r0.g7636478b
pkgrel=1
pkgdesc="Qt5 data visualization module"
arch=('i686' 'x86_64')
url="https://www.qt.io/"
license=('GPL3')
depends=('qt5-declarative')
makedepends=('git')
provides=("qt5-datavis3d=$pkgver")
conflicts=('qt5-datavis3d')
source=("git+https://code.qt.io/qt/qtdatavis3d.git#branch=5.15")
sha256sums=('SKIP')


prepare() {
  cd "$srcdir"

  mkdir -p "_build"
}

pkgver() {
  cd "qtdatavis3d"

  _tag=$(git tag -l --sort -creatordate | grep -E '^v5\.15[0-9\.]+' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//;s/-lts-lgpl//'
}

build() {
  cd "_build"

  qmake ../qtdatavis3d
  make
}

package() {
  cd "_build"

  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;
}
