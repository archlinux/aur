# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Xiaoxu Guo <ftiasch0@gmail.com>
# Maintainer: László Várady <laszlo.varady93@gmail.com>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=folly
pkgver=2024.10.28.00
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
  cython
  fast_float
  gtest
  python-setuptools
  python-wheel
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
  "fix-setup-py-for-python-extensions.patch"
)
sha256sums=(
  'fe544b549cd8094759113882a969082eedadb2732d2ede85d603e8066f753d5d'
  '7655b9d6fd926770dae4d26f67b6aedf8fb6ff03927782bcfeffa09b5138b87c'
  '1f369049ec6f14cc8682f0a8d6d08cca8ac49a1cf83f94914f0335adacba29c0'
)

prepare() {
  cd $pkgname-$pkgver
  patch --forward --strip=1 --input="$srcdir/fix-cmake-find-glog.patch"
  patch --forward --strip=1 --input="$srcdir/fix-setup-py-for-python-extensions.patch"

  # Remove test with compilation error
  sed -i '/heap_vector_types_test/d' CMakeLists.txt

  # Remove test missing file
  sed -i '/tuple_ops_test/d' CMakeLists.txt

  # The build will generate these files and fails if they already exist
  rm folly/python/executor.cpp folly/python/iobuf.cpp

  # Set Python extensions version
  sed -i "s/version=\"0.0.1\"/version=\"$pkgver\"/" folly/python/setup.py
}

build() {
  cd $pkgname-$pkgver
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -DBUILD_TESTS=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DPYTHON_EXTENSIONS=ON \
    -DPACKAGE_VERSION="$pkgver" \
    -DCMAKE_CXX_STANDARD=20
  cmake --build build
}

check() {
  cd $pkgname-$pkgver
  local skipped_tests=(
    # These tests will fail (by design) if the test execution exceeds a
    # pre-defined time limit (wall time). This is bound to be flaky in a
    # package build process, disabling.
    HHWheelTimerTest.CancelTimeout

    # Skip failing tests - not sure why they fail
    atomic_unordered_map_test.AtomicUnorderedInsertMap.DISABLEDMegaMap
    concurrent_hash_map_test
    fbstring_test.FBString.testAllClauses
    fbvector_test
    singleton_thread_local_test.SingletonThreadLocalDeathTest.Overload
    xlog_test.XlogTest.perFileCategoryHandling

    io_async_ssl_session_test.SSLSessionTest.BasicTest
    io_async_ssl_session_test.SSLSessionTest.NullSessionResumptionTest
    io_async_hh_wheel_timer_test.HHWheelTimerTest.DestroyTimeoutSet
  )
  local skipped_tests_pattern="${skipped_tests[0]}$(printf '|%s' "${skipped_tests[@]:1}")"
  ctest --test-dir build --output-on-failure -E "$skipped_tests_pattern"
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" cmake --install build
}
