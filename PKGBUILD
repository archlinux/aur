# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=qt6-languageserver-git
pkgver=6.3.0_beta3.r52.g479a8df
pkgrel=1
pkgdesc="An implementation of the Language Server Protocol"
arch=('i686' 'x86_64')
url="https://www.qt.io/"
license=('GPL' 'LGPL' 'custom')
depends=('glibc' 'qt6-base')
makedepends=('git' 'cmake')
provides=("qt6-languageserver=$pkgver")
conflicts=('qt6-languageserver')
source=("git+http://code.qt.io/qt/qtlanguageserver.git")
sha256sums=('SKIP')


pkgver() {
  cd "qtlanguageserver"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//;s/-/_/g'
}

build() {
  cd "qtlanguageserver"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    ./
  make -C "_build"
}

check() {
  cd "qtlanguageserver"

  make -C "_build" test
}

package() {
  cd "qtlanguageserver"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE.GPL3-EXCEPT" -t "$pkgdir/usr/share/licenses/qt6-languageserver"
}
