# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=googletest-git
pkgver=1.13.0.r100.g057b4e90
pkgrel=1
pkgdesc="Google's C++ test framework"
arch=('i686' 'x86_64')
url="https://google.github.io/googletest/"
license=('BSD')
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
  make -C "_build"
}

check() {
  cd "googletest"

  #make -C "_build" test
}

package() {
  cd "googletest"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/gtest"
}
