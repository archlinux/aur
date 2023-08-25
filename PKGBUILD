# Maintainer:
# Contributor: Maxime Arthaud <maxime@arthaud.me>

_pkgname="zxing-cpp"
pkgname="$_pkgname-git"
pkgver=2.1.0.r14.g81b405ba
pkgrel=1
pkgdesc="A C++ library to decode QRCode"
arch=(x86_64)
url="https://github.com/nu-book/zxing-cpp"
license=('Apache')

provides=('zxing-cpp')
conflicts=('zxing-cpp')

depends=(
  gcc-libs
)
makedepends=(
  cmake
  git
)
checkdepends=(
  gtest
)

source=("$_pkgname"::"git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "$_pkgname" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_UNIT_TESTS=ON
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
