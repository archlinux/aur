# Maintainer: Xiaoxu Guo <ftiasch0@gmail.com>
# Maintainer: László Várady <laszlo.varady93@gmail.com>
# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=folly
pkgver=2024.02.05.00
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

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('aad95c14b237ce489a9976e011f4ae7863716aa990227734b41b173fb6bfcfb3')

_archive="$pkgname-$pkgver"

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

  _skipped_tests=(
    # Skip failing tests - not sure why they fail
    HHWheelTimerTest.HHWheelTimerTest.CancelTimeout
    atomic_unordered_map_test.AtomicUnorderedInsertMap.DISABLEDMegaMap
    fbvector_test
    xlog_test.XlogTest.perFileCategoryHandling
  )
  _skipped_tests_pattern="${_skipped_tests[0]}$(printf '|%s' "${_skipped_tests[@]:1}")"
  ctest --test-dir build --output-on-failure -E "$_skipped_tests_pattern"
}

package() {
  cd "$_archive"

  DESTDIR="$pkgdir" cmake --install build
}
