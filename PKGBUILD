# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=unittestpp-git
pkgver=2.0.0.r30.g10e50ad
pkgrel=2
pkgdesc="A lightweight unit testing framework for C++"
arch=('i686' 'x86_64')
url="https://github.com/unittest-cpp/unittest-cpp/"
license=('MIT')
makedepends=('git' 'cmake')
provides=("unittestpp=$pkgver")
conflicts=('unittestpp')
options=('staticlibs')
source=("git+https://github.com/unittest-cpp/unittest-cpp.git")
sha256sums=('SKIP')


pkgver() {
  cd "unittest-cpp"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "unittest-cpp"

  CXXFLAGS="$CXXFLAGS -ffat-lto-objects" \
  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DUTPP_AMPLIFY_WARNINGS=OFF \
    ./
  cmake --build "_build"
}

package() {
  cd "unittest-cpp"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/unittestpp"
}
