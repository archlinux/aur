# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=leveldb-git
pkgver=1.20.r288.gaa5479b
pkgrel=1
pkgdesc="Fast key-value storage library"
arch=('i686' 'x86_64')
url="https://github.com/google/leveldb"
license=('BSD')
depends=('glibc' 'snappy')
makedepends=('git')
provides=("leveldb=$pkgver")
conflicts=('leveldb')
options=('staticlibs')
source=("git+https://github.com/google/leveldb.git")
sha256sums=('SKIP')


prepare() {
  cd "leveldb"

  git submodule update --init --recursive
  sed -e '/fno-rtti/d' -i "CMakeLists.txt"  # Don't disable RTTI, needed for ceph
}

pkgver() {
  cd "leveldb"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "leveldb"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

check() {
  cd "leveldb"

  make -C "_build" test
}

package() {
  cd "leveldb"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/leveldb"
}
