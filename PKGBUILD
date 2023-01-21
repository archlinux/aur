# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=raft-git
pkgver=0.17.1.r2.gd9e5752
pkgrel=1
pkgdesc="A fully asynchronous C implementation of the Raft consensus protocol"
arch=('i686' 'x86_64')
url="https://raft.readthedocs.io/en/latest/"
license=('custom' 'LGPL')
depends=('glibc' 'libuv' 'lz4')
makedepends=('git')
provides=("raft=$pkgver")
conflicts=('raft')
options=('staticlibs')
source=("git+https://github.com/canonical/raft.git")
sha256sums=('SKIP')


pkgver() {
  cd "raft"

  _tag=$(git tag -l --sort -v:refname | grep -P '^v?[\d\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "raft"

  autoreconf -fi
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "raft"

  make check
}

package() {
  cd "raft"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/raft"
  rm -rf "$pkgdir/usr/bin"
}
