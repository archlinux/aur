# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libngtcp2-git
pkgver=1.7.0.r28.g49361b2a
pkgrel=1
pkgdesc="Implementation of IETF QUIC protocol"
arch=('i686' 'x86_64')
url="https://nghttp2.org/ngtcp2/"
license=('MIT')
depends=('glibc')
makedepends=('git' 'brotli')
provides=("libngtcp2=$pkgver" 'libngtcp2.so')
conflicts=('libngtcp2')
options=('staticlibs')
source=("git+https://github.com/ngtcp2/ngtcp2.git")
sha256sums=('SKIP')


prepare() {
  cd "ngtcp2"

  git submodule update --init --recursive
}

pkgver() {
  cd "ngtcp2"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "ngtcp2"

  autoreconf -fi
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  ./configure \
    --prefix="/usr" \
    --with-libbrotlidec \
    --with-libbrotlienc
  make
}

check() {
  cd "ngtcp2"

  #make check
}

package() {
  cd "ngtcp2"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/libngtcp2"
}
