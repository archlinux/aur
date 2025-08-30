# Maintainer: Oliver Freyermuth <o.freyermuth@googlemail.com>
pkgname=afc
pkgver=1.2
pkgrel=1
pkgdesc="Anime File Checker, checks CRC32 contained in filenames"
arch=('x86_64')
url="https://github.com/olifre/afc"
license=('GPL-3.0-or-later')
depends=('zlib')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::https://github.com/olifre/afc/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('08900b705bba5a9964e454d5efafdfb6c3097c436b551d5aca6bb7725c69e770')

build() {
  local cmake_options=(
    -B build
    -S $pkgname-$pkgver
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
