# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Xiaoxu Guo <ftiasch0@gmail.com>
# Maintainer: László Várady <laszlo.varady93@gmail.com>
# Contributor: envolution
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=folly
pkgver=2025.11.10.00
pkgrel=1
pkgdesc="An open-source C++ library developed and used at Facebook"
arch=(x86_64)
url="https://github.com/facebook/folly"
license=(Apache-2.0)
depends=(
  boost-libs
  boost
  python
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
  libdwarf
  onetbb
  lz4
  openssl
  snappy
  xz
  zlib
  zstd
)
makedepends=(
  git
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
  "git+https://github.com/facebook/folly.git#tag=v${pkgver}"
  "fix-cmake-find-glog.patch"
  "fix-setup-py-for-python-extensions.patch"
  "fix-cmake-for-setup-py-extensions.patch"
  "fix-gcc-traits.patch")
sha256sums=('4454b6e1930bddc51b6f69a253d631c555490269eab89bc24196b1293baf1170'
            'a6e57c9ec968ed6de454803d141035585ee9ab1355beba64b2b176ab8c793d2c'
            'a4701d37451bec6063ce5b5efc29f67ac6cc030fda699dac56d81e6064c0d7b5'
            '78f6127afef08193923b955aae79171a8218a74c6e0e9765bf3b49dee7a1d062'
            'f958f12379e301cff2a0983124696c3c40746da8964799a27d3601b1d5c8575a')

prepare() {
  cd $pkgname
  patch --forward --strip=1 --input="$srcdir/fix-cmake-find-glog.patch"
  patch --forward --strip=1 --input="$srcdir/fix-cmake-for-setup-py-extensions.patch"
  patch --forward --strip=1 --input="$srcdir/fix-setup-py-for-python-extensions.patch"
  patch --forward --strip=1 --input="$srcdir/fix-gcc-traits.patch"
  #concurrency tests currently don't compile (2025-07-21)
  sed -i '/^    DIRECTORY concurrency\/test\//,/^$/d' CMakeLists.txt
  #pass $pkgver to python extensions
  sed -i "s/version=.*/version=\"$pkgver\",/" folly/python/setup.py
}

build() {
  cd $pkgname
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_PREFIX_PATH=/usr \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DPYTHON_EXTENSIONS=ON \
    -DPACKAGE_VERSION="$pkgver" \
    -DPYTHON_PACKAGE_INSTALL_DIR=$pkgdir/usr \
    -DCMAKE_CXX_STANDARD=20 \
    -DCMAKE_CXX_STANDARD_REQUIRED=ON \
    -DBoost_NO_BOOST_CMAKE=ON \
    -Wno-dev
  cmake --build build
}

check() {
  cd $pkgname
  local skipped_tests=(
    io_async_ssl_session_test.SSLSessionTest.BasicTest
    io_async_ssl_session_test.SSLSessionTest.NullSessionResumptionTest
    lang_bits_test\.BitsAllUintsTest/.+\.GetBitAtLE
    memory_mallctl_helper_test.MallctlHelperTest.*
    logging_xlog_test.XlogTest.perFileCategoryHandling
    expected_coroutines_test.Expected.*
    singleton_thread_local_test.ThreadLocal.DependencyTest
    io_async_ssl_session_test.SSLSessionTest.*
    memory_mallctl_helper_test.MallctlHelperTest.*
    optional_coroutines_test.Optional.CoroutineSuccess
    singleton_thread_local_test.ThreadLocal.DependencyTest
    singleton_thread_local_test.SingletonThreadLocalDeathTest.Overload
    container_heap_vector_types_test.HeapVectorTypes.SimpleSetTest
    fbstring_test.FBString.testAllClauses
  )
  local skipped_tests_pattern="${skipped_tests[0]}$(printf '|%s' "${skipped_tests[@]:1}")"
  ctest --test-dir build --output-on-failure -E "$skipped_tests_pattern"
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" cmake --install build
}
# vim:set ts=2 sw=2 et:
