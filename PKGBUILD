# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Jonathan Liu <net147@gmail.com>

pkgname=qt5-virtualkeyboard-git
pkgver=5.15.0_beta1.r0.g39a3c50
pkgrel=1
pkgdesc="Qt5 virtual keyboard module"
arch=('i686' 'x86_64')
url="https://www.qt.io/"
license=('GPL3')
depends=('qt5-declarative' 'qt5-svg' 'hunspell')
makedepends=('git')
provides=('qt5-virtualkeyboard')
conflicts=('qt5-virtualkeyboard')
source=("git+https://code.qt.io/qt/qtvirtualkeyboard.git#branch=5.15")
sha256sums=('SKIP')


prepare() {
  cd "$srcdir"

  mkdir -p "_build"
}

pkgver() {
  cd "qtvirtualkeyboard"

  _tag=$(git tag -l --sort -v:refname | sed -n '1,1{s/v//p}')
  _rev=$(git rev-list --count v$_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/-/_/g'
}

build() {
  cd "_build"

  qmake ../qtvirtualkeyboard
  make
}

package() {
  cd "_build"

  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;
}
