# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=msgpack-cxx-git
pkgver=7.0.0.r1.gf9f2917c
pkgrel=1
pkgdesc="MessagePack implementation for C++"
arch=('any')
url="https://msgpack.org/"
license=('BSL-1.0')
depends=('boost')
makedepends=('git' 'cmake')
provides=("msgpack-cxx=$pkgver")
conflicts=('msgpack-cxx')
source=("git+https://github.com/msgpack/msgpack-c.git#branch=cpp_master")
sha256sums=('SKIP')


pkgver() {
  cd "msgpack-c"

  _tag=$(git tag -l --sort -v:refname | grep -E '^cpp-[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^cpp-//'
}

build() {
  cd "msgpack-c"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DMSGPACK_CXX20=ON \
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
