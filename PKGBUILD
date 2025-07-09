# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=googletest-git
pkgver=1.17.0.r27.g3983f67e
pkgrel=1
pkgdesc="Google's C++ test framework"
arch=('i686' 'x86_64')
url="https://google.github.io/googletest/"
license=('BSD-3-Clause')
depends=('gcc-libs' 'sh')
makedepends=('git' 'cmake')
provides=("gmock=$pkgver" "gtest=$pkgver")
conflicts=('gmock' 'gtest')
source=("git+https://github.com/google/googletest.git")
sha256sums=('SKIP')


pkgver() {
  cd "googletest"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "googletest"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DBUILD_SHARED_LIBS=ON \
    ./
  cmake --build "_build"
}

check() {
  cd "googletest"

  #cmake --build "_build" --target test
}

package() {
  cd "googletest"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/gtest"
}
