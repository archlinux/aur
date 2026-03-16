# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ada-git
pkgver=3.4.3.r4.g774a1b17
pkgrel=1
pkgdesc="WHATWG-compliant and fast URL parser"
arch=('i686' 'x86_64')
url="https://ada-url.com/"
license=('Apache-2.0' 'MIT')
depends=('glibc' 'libgcc' 'libstdc++')
makedepends=('git' 'cmake')
provides=("ada=$pkgver")
conflicts=('ada')
source=("git+https://github.com/ada-url/ada.git")
sha256sums=('SKIP')


pkgver() {
  cd "ada"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "ada"

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
  cd "ada"

  #cmake --build "_build" --target test
}

package() {
  cd "ada"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/ada"
}
