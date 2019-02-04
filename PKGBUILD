# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Jonathan Liu <net147@gmail.com>

pkgname=qt5-datavis3d-git
pkgver=5.12.1.r11.gc6e1dd50
pkgrel=1
pkgdesc="Qt5 data visualization module"
arch=('i686' 'x86_64')
url="https://www.qt.io/"
license=('GPL3')
depends=('qt5-declarative')
makedepends=('git')
provides=('qt5-datavis3d')
conflicts=('qt5-datavis3d')
source=("git+https://code.qt.io/qt/qtdatavis3d.git#branch=dev")
sha256sums=('SKIP')


prepare() {
  cd "$srcdir"

  mkdir -p "_build"
}

pkgver() {
  cd "qtdatavis3d"

  _tag=$(git tag -l --sort -v:refname | sed -n '1,1{s/v//p}')
  _rev=$(git rev-list --count v$_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash"
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
