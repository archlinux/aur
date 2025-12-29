# Maintainer: INAJIMA Daisuke <inajima at gmail dot com>

_pkgname=fcitx5-vi-escape
pkgname=$_pkgname-git
pkgver=0.1.0.g12611dd
pkgrel=1
pkgdesc="Vi escape addon for Fcitx5"
arch=('x86_64')
url="https://github.com/anyakichi/fcitx5-vi-escape"
license=('MIT')
depends=('fcitx5')
makedepends=('git' 'extra-cmake-modules')
source=("git+https://github.com/anyakichi/fcitx5-vi-escape.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname

  printf "%s.%s" \
    $(grep -oP 'project\s*\(.*VERSION\s+\K[0-9.]+' CMakeLists.txt) \
    g$(git rev-parse --short HEAD)
}

build() {
  local cmake_options=(
    -B build
    -S $_pkgname
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

check() {
  local excluded_tests=""
  local ctest_flags=(
    --test-dir build
    # show the stdout and stderr when the test fails
    --output-on-failure
    # execute tests in parallel
    --parallel $(nproc)
    # exclude problematic tests
    --exclude-regex "$excluded_tests"
  )
  ctest "${ctest_flags[@]}"
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
