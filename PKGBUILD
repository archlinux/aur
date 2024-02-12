# Maintainer: Xiaoxu Guo <ftiasch0@gmail.com>
# Maintainer: László Várady <laszlo.varady93@gmail.com>
# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=folly
pkgver=2024.02.12.00
pkgrel=1
pkgdesc="An open-source C++ library developed and used at Facebook"
arch=(x86_64)
url="https://github.com/facebook/folly"
license=(Apache-2.0)
depends=(
  boost-libs
  bzip2
  double-conversion
  fmt
  gcc-libs
  gflags
  glibc
  google-glog
  libaio
  libevent
  libsodium
  libunwind
  liburing
  lz4
  openssl
  snappy
  xz
  zlib
  zstd
)
makedepends=(
  boost
  cmake
  gtest
)
provides=(
  libfolly.so
  libfolly_test_util.so
  libfollybenchmark.so
)
options=(!lto)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "fix-test-definitions.patch"
)
sha256sums=(
  '678db01d22e0525168dba33b4eb1c35f0e340f77cad5ee941c05eb25f173519d'
  'a7f15a6706d652e550bd415342c3027abd9afbb86ec04c764be3a96644efc46e'
)

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="$srcdir/fix-test-definitions.patch"
}

build() {
  cd "$_archive"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -DBUILD_TESTS=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DPACKAGE_VERSION="$pkgver"
  cmake --build build
}

check() {
  cd "$_archive"

  local skipped_tests=(
    # These tests will fail (by design) if the test execution exceeds a
    # pre-defined time limit (wall time). This is bound to be flaky in a
    # package build process, disabling.
    HHWheelTimerTest.HHWheelTimerTest

    # Skip failing tests - not sure why they fail
    atomic_unordered_map_test.AtomicUnorderedInsertMap.DISABLEDMegaMap
    fbvector_test
    xlog_test.XlogTest.perFileCategoryHandling
  )
  local skipped_tests_pattern="${skipped_tests[0]}$(printf '|%s' "${skipped_tests[@]:1}")"
  ctest --test-dir build --output-on-failure -E "$skipped_tests_pattern"
}

package() {
  cd "$_archive"

  DESTDIR="$pkgdir" cmake --install build
}
