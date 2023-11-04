# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=bootstrap-dht-git
pkgver=r131.g679c661
pkgrel=1
pkgdesc="Bittorrent DHT bootstrap server"
arch=('i686' 'x86_64')
url="https://github.com/bittorrent/bootstrap-dht"
license=('MIT')
depends=('glibc' 'boost-libs')
makedepends=('git' 'boost')
provides=("bootstrap-dht=$pkgver")
conflicts=('bootstrap-dht')
source=("git+https://github.com/bittorrent/bootstrap-dht.git"
        "boost.patch::https://github.com/bittorrent/bootstrap-dht/commit/131e4d2caccc227afa62837899123f424dccb296.patch")
sha256sums=('SKIP'
            '2984970318c71910e1e23093564f5048f9311ed0d4d16d1ef5623e9f9b86f331')


prepare() {
  cd "bootstrap-dht"

  patch -Np1 -i "$srcdir/boost.patch"
}

pkgver() {
  cd "bootstrap-dht"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "bootstrap-dht"

  b2 \
    cflags="$CFLAGS" \
    cxxflags="$CXXFLAGS" \
    linkflags="$LDFLAGS" \
    release
}

check() {
  cd "bootstrap-dht/tests"

  b2 \
    cflags="$CFLAGS" \
    cxxflags="$CXXFLAGS" \
    linkflags="$LDFLAGS" \
    release
}

package() {
  cd "bootstrap-dht"

  install -Dm755 "dht-bootstrap" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/bootstrap-dht"
}
