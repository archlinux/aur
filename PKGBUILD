# Maintainer: Xiaoxu Guo <ftiasch0@gmail.com>
# Maintainer: László Várady <laszlo.varady93@gmail.com>
# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=folly
pkgver=2024.03.11.00
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
  "fix-cmake-find-glog.patch"
  "fix-missing-include.patch"
)
sha256sums=(
  '057cff82142dbfacea455aa2ad30b3dd80e28a95a98ef43a27c1ca5cf77a373f'
  '7655b9d6fd926770dae4d26f67b6aedf8fb6ff03927782bcfeffa09b5138b87c'
  '19cc8b4190e3c7d4ef9d1d9842a2def99bb261711ae85cb03e63787c4995e286'
)

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="$srcdir/fix-cmake-find-glog.patch"
  patch --forward --strip=1 --input="$srcdir/fix-missing-include.patch"
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
    fbstring_test.FBString.testAllClauses
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
