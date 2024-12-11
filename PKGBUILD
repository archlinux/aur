# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cppzmq-git
pkgver=4.10.0.r29.g6541dd1
pkgrel=1
pkgdesc="Header-only C++ binding for libzmq"
arch=('any')
url="https://github.com/zeromq/cppzmq"
license=('MIT')
depends=('zeromq')
makedepends=('git' 'cmake')
checkdepends=('catch2')
provides=("cppzmq=$pkgver")
conflicts=('cppzmq')
source=("git+https://github.com/zeromq/cppzmq.git")
sha256sums=('SKIP')


pkgver() {
  cd "cppzmq"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "cppzmq"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  cmake --build "_build"
}

check() {
  cd "cppzmq"

  #cmake --build "_build" --target test
}

package() {
  cd "cppzmq"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/cppzmq"
}
