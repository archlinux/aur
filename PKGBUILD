# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=qt6-languageserver-git
pkgver=6.10.0_beta1.r19.g3afa35c
pkgrel=1
pkgdesc="An implementation of the Language Server Protocol"
arch=('i686' 'x86_64')
url="https://www.qt.io/"
license=('GPL-3.0-only' 'LGPL-3.0-only' 'LicenseRef-qt6-languageserver')
depends=('glibc' 'qt6-base')
makedepends=('git' 'cmake')
provides=("qt6-languageserver=$pkgver")
conflicts=('qt6-languageserver')
source=("git+https://code.qt.io/qt/qtlanguageserver.git")
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
  cmake --build "_build"
}

check() {
  cd "qtlanguageserver"

  #cmake --build "_build" --target test
}

package() {
  cd "qtlanguageserver"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE.GPL3-EXCEPT" -t "$pkgdir/usr/share/licenses/qt6-languageserver"
}
