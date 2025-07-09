# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=utf8cpp-git
pkgver=4.0.6.r7.gda71cf9
pkgrel=1
pkgdesc="UTF-8 with C++ in a Portable Way"
arch=('any')
url="https://github.com/nemtrif/utfcpp"
license=('BSL-1.0')
makedepends=('git' 'cmake')
provides=("utf8cpp=$pkgver")
conflicts=('utf8cpp')
source=("git+https://github.com/nemtrif/utfcpp.git")
sha256sums=('SKIP')


prepare() {
  cd "utfcpp"

  git submodule update --init --recursive
}

pkgver() {
  cd "utfcpp"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "utfcpp"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  cmake --build "_build"
}

check() {
  cd "utfcpp/tests"

  #cmake \
  #  -B "_build" \
  #  ./
  #cmake --build "_build"
  #cmake --build "_build" --target test
}

package() {
  cd "utfcpp"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/utf8cpp"
}

