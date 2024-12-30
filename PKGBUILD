# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=oniguruma-git
pkgver=6.9.9.r51.g4ef8920
pkgrel=1
pkgdesc="Regular expressions library"
arch=('i686' 'x86_64')
url="https://github.com/kkos/oniguruma"
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('git' 'cmake')
provides=("oniguruma=$pkgver")
conflicts=('oniguruma')
source=("git+https://github.com/kkos/oniguruma.git")
sha256sums=('SKIP')


pkgver() {
  cd "oniguruma"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "oniguruma"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DENABLE_POSIX_API=ON \
    ./
  cmake --build "_build"
}

check() {
  cd "oniguruma"

  #cmake --build "_build" --target test
}

package() {
  cd "oniguruma"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/oniguruma"
}
