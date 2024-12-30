# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=bootstrap-dht-git
pkgver=r131.g679c661
pkgrel=2
pkgdesc="Bittorrent DHT bootstrap server"
arch=('i686' 'x86_64')
url="https://github.com/bittorrent/bootstrap-dht"
license=('MIT')
depends=('gcc-libs' 'boost-libs')
makedepends=('git' 'boost')
provides=("bootstrap-dht=$pkgver")
conflicts=('bootstrap-dht')
source=("git+https://github.com/bittorrent/bootstrap-dht.git"
        "0001-Fix-compilation-with-boost-1.86.patch::https://github.com/bittorrent/bootstrap-dht/commit/a928a42298c8f088b8fbd729074874fd33043a08.patch"
        "0002-Remove-non-existent-header.patch::https://github.com/bittorrent/bootstrap-dht/commit/ec453c1115aae78a28d392f948a87cb0d1be575b.patch")
sha256sums=('SKIP'
            '485369fae20e6c358a5e72a9d681b1d7063bef64c6ee045723d4b4ebfc30c3d8'
            'a3c61ac5930fc5d3f5d640cc3eb58a4c49057c442ca623896c2cc70406dde646')


prepare() {
  cd "bootstrap-dht"

  patch -Np1 -i "$srcdir/0001-Fix-compilation-with-boost-1.86.patch"
  patch -Np1 -i "$srcdir/0002-Remove-non-existent-header.patch"
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

  #b2 \
  #  cflags="$CFLAGS" \
  #  cxxflags="$CXXFLAGS" \
  #  linkflags="$LDFLAGS" \
  #  release
}

package() {
  cd "bootstrap-dht"

  install -Dm755 dht-{bootstrap,torture} -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/bootstrap-dht"
}
