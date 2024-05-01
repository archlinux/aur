# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=protobuf-c-git
pkgver=1.5.0.r0.g8c201f6
pkgrel=1
pkgdesc="Protocol Buffers implementation in C"
arch=('i686' 'x86_64')
url="https://github.com/protobuf-c/protobuf-c"
license=('BSD-2-Clause')
depends=('gcc-libs')
makedepends=('git')
provides=("protobuf-c=$pkgver" 'libprotobuf-c.so')
conflicts=('protobuf-c')
options=('staticlibs')
source=("git+https://github.com/protobuf-c/protobuf-c.git")
sha256sums=('SKIP')


pkgver() {
  cd "protobuf-c"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "protobuf-c"

  ./autogen.sh
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  CXXFLAGS="$CXXFLAGS -ffat-lto-objects" \
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "protobuf-c"

  #make check
}

package() {
  cd "protobuf-c"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/protobuf-c"
}
