# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ragel-git
pkgver=7.0.4.r32.g65540b65
pkgrel=2
pkgdesc="Compile executable finite state machines from regular languages"
arch=('i686' 'x86_64')
url="https://www.colm.net/open-source/ragel/"
license=('MIT')
depends=('gcc-libs' 'colm')
makedepends=('git')
provides=("ragel=$pkgver")
conflicts=('ragel')
options=('staticlibs')
source=("git+https://github.com/adrian-thurston/ragel.git")
sha256sums=('SKIP')


pkgver() {
  cd "ragel"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "ragel"

  ./autogen.sh
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  CXXFLAGS="$CXXFLAGS -ffat-lto-objects" \
  ./configure \
    --prefix="/usr" \
    --with-colm="/usr"
  make
}

check() {
  cd "ragel"

  #make check
}

package() {
  cd "ragel"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/ragel"
}
