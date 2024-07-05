# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=simdutf-git
pkgver=5.2.8.r4.g768494ee
pkgrel=1
pkgdesc="Unicode validation and transcoding at billions of characters per second"
arch=('i686' 'x86_64')
url="https://simdutf.github.io/simdutf/"
license=('Apache-2.0' 'MIT')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=("simdutf=$pkgver")
conflicts=('simdutf')
source=("git+https://github.com/simdutf/simdutf.git")
sha256sums=('SKIP')


pkgver() {
  cd "simdutf"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "simdutf"

  CFLAGS="$CFLAGS -ffat-lto-objects" \
  CXXFLAGS="$CXXFLAGS -ffat-lto-objects" \
  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DSIMDUTF_TESTS=OFF \
    ./
  cmake --build "_build"
}

check() {
  cd "simdutf"

  #cmake --build "_build" --target test
}

package() {
  cd "simdutf"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/simdutf"
}
