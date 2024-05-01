# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=fstrm-git
pkgver=0.6.1.r0.g1d6e11d
pkgrel=1
pkgdesc="Frame Streams implementation in C"
arch=('i686' 'x86_64')
url="https://github.com/farsightsec/fstrm"
license=('MIT')
depends=('glibc' 'libevent')
makedepends=('git')
provides=("fstrm=$pkgver")
conflicts=('fstrm')
options=('staticlibs')
source=("git+https://github.com/farsightsec/fstrm.git")
sha256sums=('SKIP')


pkgver() {
  cd "fstrm"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "fstrm"

  ./autogen.sh
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "fstrm"

  #make check
}

package() {
  cd "fstrm"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/fstrm"
}
