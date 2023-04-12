# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Riley Trautman <asonix.dev@gmail.com>
# Contributor: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qt5-declarative-git
pkgver=5.15.9.r0.g19ed7973a3
pkgrel=1
pkgdesc="Qt5 declarative module"
arch=('i686' 'x86_64')
url="https://www.qt.io/"
license=('FDL' 'GPL' 'LGPL' 'custom')
depends=('qt5-base')
makedepends=('git' 'python' 'vulkan-headers')
provides=("qt5-declarative=$pkgver")
conflicts=('qt5-declarative')
source=("git+https://code.qt.io/qt/qtdeclarative.git#branch=5.15")
sha256sums=('SKIP')


prepare() {
  cd "$srcdir"

  mkdir -p "_build"
}

pkgver() {
  cd "qtdeclarative"

  _tag=$(git tag -l --sort -creatordate | grep -E '^v5\.15[0-9\.]+' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//;s/-lts-lgpl//'
}

build() {
  cd "_build"

  qmake ../qtdeclarative
  make
}

package() {
  cd "_build"

  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  cd "$srcdir/qtdeclarative"
  install -Dm644 "LICENSE.GPL3-EXCEPT" -t "$pkgdir/usr/share/licenses/qt5-declarative"
}
