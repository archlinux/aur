# Maintainer: Benjamin Valdez <b.valdez.0509+aur<at>gmail.com>
# Contributor: Bruce Zhang <zttt183525594<at>gmail.com>
pkgname=input-actions
pkgver=0.5.1
pkgrel=1
pkgdesc="Custom touchpad gestures for Plasma 6"
arch=('x86_64')
url="https://github.com/taj-ny/InputActions"
license=('GPL-3.0-only')
depends=('kwin' 'yaml-cpp' 'kcmutils' 'gcc-libs' 'qt6-base' 'glibc' 'kcoreaddons' 'ki18n')
makedepends=('extra-cmake-modules' 'cmake')
source=("$pkgname-$pkgver.src.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6a920c1ecde17c4163f8e28f102c83ecb599a6bd8ec9259013d52454c304e972')

build() {
  export CXXFLAGS+=" -DQT_NO_DEBUG_OUTPUT"
  local cmake_options=(
    -B build
    -S "InputActions-$pkgver"
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    #-D BUILD_TESTS
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

# tests are broken https://github.com/taj-ny/kwin-gestures/issues/27
# check() {
#   local excluded_tests=""
#   local ctest_flags=(
#     --test-dir build
#     # show the stdout and stderr when the test fails
#     --output-on-failure
#     # execute tests in parallel
#     --parallel $(nproc)
#     # exclude problematic tests
#     --exclude-regex "$excluded_tests"
#   )
#   ctest "${ctest_flags[@]}"
# }

package() {
  DESTDIR="$pkgdir" cmake --install build
}
