# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=edencommon
pkgver=2024.04.01.00
pkgrel=1
pkgdesc="Shared library for Watchman and Eden projects"
arch=(x86_64)
url="https://github.com/facebookexperimental/edencommon"
license=(MIT)
depends=(
  boost-libs
  fb303
  fmt
  folly
  gcc-libs
  glibc
  google-glog
)
makedepends=(
  boost
  cmake
  fbthrift
  gtest
  mvfst
)
provides=(
  libedencommon_os.so
  libedencommon_telemetry.so
  libedencommon_testharness.so
  libedencommon_utils.so
)
options=(!lto)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "build-shared-libraries.patch"
  "fmt-v10.2-compatibility.patch"
)
sha256sums=(
  '9d7f7de1f1ff6039125c10ec0e7c36de9008705222ecf617af01a1f88b7622a8'
  '49178a7eac4639a82ae17ca54833f4147170c6ae1b573d382771d92d88891c66'
  '019ae5911f839b4ff15c8508ce2824956ac5b2f0bb94182766f76863a81dbb35'
)

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="$srcdir/build-shared-libraries.patch"
  patch --forward --strip=1 --input="$srcdir/fmt-v10.2-compatibility.patch"

  # Use system CMake config instead of bundled module, incompatible with glog
  # v0.7.0+
  sed -i 's/find_package(Glog MODULE REQUIRED)/find_package(Glog CONFIG REQUIRED)/' \
    CMakeLists.txt
}

build() {
  cd "$_archive"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

check() {
  cd "$_archive"

  ctest --test-dir build --output-on-failure -E PathFuncs.move_or_copy
}

package() {
  cd "$_archive"

  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
