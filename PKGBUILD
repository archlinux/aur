# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=raft-git
pkgver=0.22.1.r8.g5032ee9a
pkgrel=1
pkgdesc="Asynchronous C implementation of the Raft consensus protocol"
arch=('i686' 'x86_64')
url="https://raft.readthedocs.io/"
license=('LGPL-3.0-only WITH LGPL-3.0-linking-exception')
depends=('glibc' 'libuv' 'lz4')
makedepends=('git')
provides=("raft=$pkgver")
conflicts=('raft')
options=('staticlibs')
source=("git+https://github.com/cowsql/raft.git")
sha256sums=('SKIP')


pkgver() {
  cd "raft"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "raft"

  autoreconf -fi
  CFLAGS="$CFLAGS -ffat-lto-objects" \
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "raft"

  #make check
}

package() {
  cd "raft"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/raft"
  rm -rf "$pkgdir/usr/bin"
}
