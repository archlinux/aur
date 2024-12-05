# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=msgpack-c-git
pkgver=6.1.0.r0.g44588010
pkgrel=2
pkgdesc="MessagePack implementation for C"
arch=('i686' 'x86_64')
url="https://msgpack.org/"
license=('BSL-1.0')
depends=('glibc')
makedepends=('git' 'cmake')
provides=("msgpack-c=$pkgver" 'libmsgpack-c.so')
conflicts=('msgpack-c')
options=('staticlibs')
source=("git+https://github.com/msgpack/msgpack-c.git#branch=c_master")
sha256sums=('SKIP')


pkgver() {
  cd "msgpack-c"

  _tag=$(git tag -l --sort -v:refname | grep -E '^c-[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^c-//'
}

build() {
  cd "msgpack-c"

  CFLAGS="$CFLAGS -ffat-lto-objects" \
  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  cmake --build "_build"
}

check() {
  cd "msgpack-c"

  #cmake --build "_build" --target test
}

package() {
  cd "msgpack-c"

  DESTDIR="$pkgdir" cmake --install "_build"
}
