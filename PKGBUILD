# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=edencommon
pkgver=2024.05.27.00
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
  gtest
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
)
sha256sums=(
  '8cffb562c011769a7e54ec62ae204800f18017d338c43de05d950c29cdfdbe42'
  'ffe1476d4edccb5ab8de82a9c2dd97e85dec8bea216ea3e1adb48b6c2946111a'
)

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="$srcdir/build-shared-libraries.patch"

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
