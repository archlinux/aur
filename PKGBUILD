# Maintainer: Adrià Arrufat <swiftscythe AT gmail DOT com>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=simdutf
pkgver=7.7.0
pkgrel=1
pkgdesc="Unicode validation and transcoding at billions of characters per second"
arch=('i686' 'x86_64')
url="https://simdutf.github.io/simdutf/"
license=('Apache-2.0' 'MIT')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'ninja')
provides=("simdutf=$pkgver")
conflicts=('simdutf')
source=("https://github.com/simdutf/simdutf/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0180de81a1dd48a87b8c0442ffa81734f3db91a7350914107a449935124e3c6f')

build() {
  cd "${pkgname}-${pkgver}"

  CFLAGS="$CFLAGS -ffat-lto-objects" \
  CXXFLAGS="$CXXFLAGS -ffat-lto-objects" \
  cmake -G Ninja\
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
  cd "${pkgname}-${pkgver}"

  cmake --build "_build" --target test
}

package() {
  cd "${pkgname}-${pkgver}"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/simdutf"
}
