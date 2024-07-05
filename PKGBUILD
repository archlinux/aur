# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=simdjson-git
pkgver=3.9.5.r2.gfeea2bce
pkgrel=1
pkgdesc="Parsing gigabytes of JSON per second"
arch=('i686' 'x86_64')
url="https://simdjson.org/"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=("simdjson=$pkgver")
conflicts=('simdjson')
source=("git+https://github.com/simdjson/simdjson.git")
sha256sums=('SKIP')


pkgver() {
  cd "simdjson"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "simdjson"

  CFLAGS="$CFLAGS -ffat-lto-objects" \
  CXXFLAGS="$CXXFLAGS -ffat-lto-objects" \
  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  cmake --build "_build"
}

package() {
  cd "simdjson"

  DESTDIR="$pkgdir" cmake --install "_build"
}
