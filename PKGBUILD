# Maintainer: Felix K <gauchowaidag (at) gmail.com>

_pkgname=kio-onedrive
pkgname=${_pkgname}-git
pkgver=0.0.12.r0.g8601d75
pkgrel=1
arch=(x86_64)
pkgdesc="KIO Slave to access Microsoft OneDrive"
url="https://invent.kde.org/bernardogn/kio-onedrive"
license=('GPL-2.0-or-later')
depends=(kaccounts-providers kio)
makedepends=(clang extra-cmake-modules git intltool ninja)

provides=($_pkgname)
conflicts=($_pkgname)

source=("git+https://invent.kde.org/bernardogn/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  export CC=clang
  export CXX=clang++
  # Build fails with D_FORTIFY_SOURCE being 1 or more, so we undefine it
  export CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
  export CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
  local cmake_options=(
    -B build
    -S $_pkgname
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    # Use ninja due to C++ modules
    -G Ninja
  )
  cmake "${cmake_options[@]}"
  cmake --build build -v
}

check() {
  local excluded_tests=""
  local ctest_flags=(
    --test-dir build
    --output-on-failure
    --parallel $(nproc)
    --exclude-regex "$excluded_tests"
  )
  ctest "${ctest_flags[@]}"
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
