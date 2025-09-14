# Maintainer:
# Contributor: Fabrice aneche <akh at nobugware dot com>

_pkgname="s2geometry"
pkgname="$_pkgname-git"
pkgver=0.12.0.r29.g5b5fbc0
pkgrel=1
pkgdesc="A library for manipulating geometric shapes"
url="https://github.com/google/s2geometry"
license=('Apache-2.0')
arch=("x86_64" "aarch64")

depends=(
  'abseil-cpp'
  'openssl'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'python'
)

provides=(
  "$_pkgname=${pkgver%.g*}"
  'libs2.so'
)
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_LIBDIR='lib'
    -DBUILD_TESTS=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
