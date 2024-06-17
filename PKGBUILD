# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=a52dec-git
pkgver=0.8.0.r0.gc388f3b
pkgrel=1
pkgdesc="A free ATSC A/52 stream decoder"
arch=('i686' 'x86_64')
url="https://git.adelielinux.org/community/a52dec/"
license=('GPL-2.0-or-later')
depends=('glibc')
makedepends=('git')
provides=("a52dec=$pkgver")
conflicts=('a52dec')
options=('staticlibs')
source=("git+https://git.adelielinux.org/community/a52dec.git")
sha256sums=('SKIP')


pkgver() {
  cd "a52dec"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "a52dec"

  ./bootstrap
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  ./configure \
    --prefix="/usr" \
    --enable-shared
  make
}

check() {
  cd "a52dec"

  #make check
}

package() {
  cd "a52dec"

  make DESTDIR="$pkgdir" install
  install -Dm644 "liba52/a52_internal.h" -t "$pkgdir/usr/include/a52dec"
}
