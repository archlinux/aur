# Maintainer:
# Contributor: Maxime Arthaud <maxime@arthaud.me>

_pkgname="zxing-cpp"
pkgname="$_pkgname-git"
pkgver=2.1.0.r80.gb15819d6
pkgrel=1
pkgdesc="A C++ library to decode QRCode"
url="https://github.com/zxing-cpp/zxing-cpp"
license=('Apache')
arch=(x86_64)

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
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_BUILD_TYPE=None
    -DBUILD_EXAMPLES=OFF
    -DBUILD_UNIT_TESTS=ON
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build
}
