# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Jonathan Liu <net147@gmail.com>

pkgname=qt5-charts-git
pkgver=5.12.1.r21.g9e943f14
pkgrel=2
pkgdesc="Qt5 charts module"
arch=('i686' 'x86_64')
url="https://www.qt.io/"
license=('GPL3')
depends=('qt5-base')
makedepends=('git' 'qt5-declarative')
provides=('qt5-charts')
conflicts=('qt5-charts')
source=("git+https://code.qt.io/qt/qtcharts.git#branch=dev")
sha256sums=('SKIP')


prepare() {
  cd "$srcdir"

  mkdir -p "_build"
}

pkgver() {
  cd "qtcharts"

  _tag=$(git tag -l --sort -v:refname | sed -n '1,1{s/v//p}')
  _rev=$(git rev-list --count v$_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash"
}

build() {
  cd "_build"

  qmake ../qtcharts
  make
}

package() {
  cd "_build"

  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;
}
