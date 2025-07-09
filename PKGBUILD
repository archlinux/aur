# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=pugixml-git
pkgver=1.15.r17.g5a1892b
pkgrel=1
pkgdesc="Light-weight, simple and fast XML parser for C++"
arch=('i686' 'x86_64')
url="https://pugixml.org/"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=("pugixml=$pkgver")
conflicts=('pugixml')
source=("git+https://github.com/zeux/pugixml.git")
sha256sums=('SKIP')


pkgver() {
  cd "pugixml"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "pugixml"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DBUILD_SHARED_LIBS=ON \
    ./
  cmake --build "_build"
}

package() {
  cd "pugixml"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/pugixml"
}
