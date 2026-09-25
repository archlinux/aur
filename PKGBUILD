# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ragel-git
pkgver=7.1.0.r75.g0164c85d
pkgrel=1
pkgdesc="Compile executable finite state machines from regular languages"
arch=('i686' 'x86_64')
url="https://www.colm.net/open-source/ragel/"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++' 'colm')
makedepends=('git')
provides=("ragel=$pkgver")
conflicts=('ragel')
options=('staticlibs')
source=("git+https://github.com/adrian-thurston/colm-suite.git")
sha256sums=('SKIP')


pkgver() {
  cd "colm-suite"

  _tag=$(git tag -l --sort -v:refname | grep -E '^ragel-[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^ragel-//'
}

build() {
  cd "colm-suite"

  ./autogen.sh
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  CXXFLAGS="$CXXFLAGS -ffat-lto-objects" \
  ./configure \
    --prefix="/usr" \
    --disable-install-colm \
    --with-colm="/usr"
  make
}

check() {
  cd "colm-suite"

  #make check
}

package() {
  cd "colm-suite"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/ragel"

  rm -r "$pkgdir/usr/lib"/libcolm{.a,.so,-0.15.0.so}
}
