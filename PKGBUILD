# Maintainer:
# Contributor: Maxime Arthaud <maxime@arthaud.me>

_pkgname="zxing-cpp"
pkgname="$_pkgname-git"
pkgver=2.2.1.r288.g39ebe724
pkgrel=1
pkgdesc="A C++ library to decode QRCode"
url="https://github.com/zxing-cpp/zxing-cpp"
license=('Apache-2.0')
arch=('x86_64')

depends=(
  gcc-libs
)
makedepends=(
  cmake
  git
  ninja
)
checkdepends=(
  gtest
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgname"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DZXING_DEPENDENCIES=LOCAL
    -DZXING_EXAMPLES=OFF
    -DZXING_UNIT_TESTS=ON
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
