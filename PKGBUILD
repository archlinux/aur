# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Jesin <Jesin00@gmail.com>
# Contributor: Eduardo Sánchez Muñoz

pkgname=nlohmann-json-git
pkgver=3.11.3.r14.g960b763ec
pkgrel=1
pkgdesc="JSON for Modern C++"
arch=('any')
url="https://github.com/nlohmann/json"
license=('MIT')
makedepends=('git' 'cmake')
provides=("nlohmann-json=$pkgver")
conflicts=('nlohmann-json')
source=("git+https://github.com/nlohmann/json.git")
sha256sums=('SKIP')


pkgver() {
  cd "json"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "json"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DJSON_BuildTests=OFF \
    ./
  cmake --build "_build"
}

check() {
  cd "json"

  #cmake --build "_build" --target test
}

package() {
  cd "json"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/nlohmann-json"
  install -Dm644 "LICENSE.MIT" -t "$pkgdir/usr/share/licenses/nlohmann-json"
}
