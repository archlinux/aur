# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=qt5-connectivity-git
pkgver=5.12.1.r30.g5eb8fd9f
pkgrel=1
pkgdesc="Qt5 connectivity module"
arch=('i686' 'x86_64')
url="https://www.qt.io/"
license=('FDL' 'GPL' 'LGPL' 'custom')
depends=('qt5-declarative' 'bluez-libs')
makedepends=('git')
provides=('qt5-connectivity')
conflicts=('qt5-connectivity')
source=("git+https://code.qt.io/qt/qtconnectivity.git#branch=dev")
sha256sums=('SKIP')


prepare() {
  cd "$srcdir"

  mkdir -p "_build"
}

pkgver() {
  cd "qtconnectivity"

  _tag=$(git tag -l --sort -v:refname | sed -n '1,1{s/v//p}')
  _rev=$(git rev-list --count v$_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash"
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
  install -Dm644 "LICENSE.GPL3-EXCEPT" "$pkgdir/usr/share/licenses/qt5-connectivity/LICENSE.GPL3-EXCEPT"
}
