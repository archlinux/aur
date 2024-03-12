# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=edencommon
pkgver=2024.03.11.00
pkgrel=1
pkgdesc="Shared library for Watchman and Eden projects"
arch=(x86_64)
url="https://github.com/facebookexperimental/edencommon"
license=(MIT)
depends=(
  boost-libs
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
  libedencommon_utils.so
)
options=(!lto)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "build-shared-library.patch"
  "fmt-v10.2-compatibility.patch"
)
sha256sums=(
  'f5076de33abdb20feb1693b43b1fc164b09b33e0db20943042d9097228226e6d'
  '000dfb9e316e486cb047fe4c5547b716033a99bb78a9eef0e7e4d860d017a092'
  '019ae5911f839b4ff15c8508ce2824956ac5b2f0bb94182766f76863a81dbb35'
)

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="$srcdir/build-shared-library.patch"
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
