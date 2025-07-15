# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Xiaoxu Guo <ftiasch0@gmail.com>
# Maintainer: László Várady <laszlo.varady93@gmail.com>
# Contributor: envolution
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=folly
pkgver=2025.07.14.00
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

#https://github.com/facebook/folly/commit/1497482399f47b2fdc657674a872896848244878
#this is to correct some path resolution issues from fb internal loads to their OS release loads
#_commit=1497482399f47b2fdc657674a872896848244878
#"git+https://github.com/facebook/folly.git#commit=${_commit}"
#
# https://github.com/facebook/folly/pull/2466 = cmake-python-noexcept.patch"
source=(
  "git+https://github.com/facebook/folly.git#tag=v${pkgver}"
  "fix-cmake-find-glog.patch"
  "fix-setup-py-for-python-extensions.patch"
  "cmake-python-noexcept.patch"
  "fix-gcc-traits.patch"
)
sha256sums=('dd402667603ef38e10f1a516b6f615e361dca8e6f2087efcb73603948200dbd1'
            'c4b66347a9db6ddedb516e2a778a7a37e26a4280ce2c0c9fdbac11d8c8190c55'
            'a4701d37451bec6063ce5b5efc29f67ac6cc030fda699dac56d81e6064c0d7b5'
            '2f08e457f0c7d5a76a3cb8884543dcd60abdf04522b681dfd6a003f012584fbe'
            'f958f12379e301cff2a0983124696c3c40746da8964799a27d3601b1d5c8575a')

prepare() {
  cd $pkgname
  git apply --verbose --reject --whitespace=fix ../cmake-python-noexcept.patch
  patch --forward --strip=1 --input="$srcdir/fix-cmake-find-glog.patch"
  patch --forward --strip=1 --input="$srcdir/fix-setup-py-for-python-extensions.patch"
  patch --forward --strip=1 --input="$srcdir/fix-gcc-traits.patch"

  # Remove test with compilation error
  sed -i '/heap_vector_types_test/d' CMakeLists.txt

  # Remove test missing file
  sed -i '/tuple_ops_test/d' CMakeLists.txt

  # Add our glog export and detect python early to solve some downstream issues (find_package may not be needed here)
  sed -i '/^project(/a\
add_definitions(-DGLOG_USE_GLOG_EXPORT)\n' CMakeLists.txt

  # Set Python extensions version
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
  )
  local skipped_tests_pattern="${skipped_tests[0]}$(printf '|%s' "${skipped_tests[@]:1}")"
  ctest --test-dir build --output-on-failure -E "$skipped_tests_pattern"
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" cmake --install build
}
# vim:set ts=2 sw=2 et:
