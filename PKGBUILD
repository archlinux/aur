# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libtheora-git
pkgver=1.2.0.r17.g28fd5ec
pkgrel=1
pkgdesc="An open video codec developed by the Xiph.org"
arch=('i686' 'x86_64')
url="https://www.theora.org/"
license=('BSD-3-Clause')
depends=('glibc' libogg.so)
makedepends=('git' 'libogg')
provides=("libtheora=$pkgver" lib{theora,theoradec,theoraenc}.so)
conflicts=('libtheora')
options=('staticlibs')
source=("git+https://gitlab.xiph.org/xiph/theora.git")
sha256sums=('SKIP')


pkgver() {
  cd "theora"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "theora"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --disable-examples
  make
}

check() {
  cd "theora"

  #make check
}

package() {
  cd "theora"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/libtheora"
}
