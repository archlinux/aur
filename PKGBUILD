# Maintainer: Adrià Arrufat <swiftscythe AT gmail DOT com>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=simdutf
pkgver=6.5.0
pkgrel=1
pkgdesc="Unicode validation and transcoding at billions of characters per second"
arch=('i686' 'x86_64')
url="https://simdutf.github.io/simdutf/"
license=('Apache-2.0' 'MIT')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=("simdutf=$pkgver")
conflicts=('simdutf')
source=("git+https://github.com/simdutf/simdutf.git?tag=${pkgver}")
sha256sums=('SKIP')

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

  cmake --build "_build" --target test
}

package() {
  cd "simdutf"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/simdutf"
}
