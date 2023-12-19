# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=edencommon
pkgver=2023.12.18.00
pkgrel=1
pkgdesc="Shared library for Watchman and Eden projects"
arch=(x86_64)
url="https://github.com/facebookexperimental/edencommon"
license=(MIT)
depends=(
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
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "build-shared-library.patch"
)
sha256sums=(
  'b2c0f0db94adde6734fdf79da53a90b95697637da46f46b5eb3d955faeb478bd'
  '000dfb9e316e486cb047fe4c5547b716033a99bb78a9eef0e7e4d860d017a092'
)
options=(!lto)

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="$srcdir/build-shared-library.patch"
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

  ctest --test-dir build --output-on-failure
}

package() {
  cd "$_archive"

  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
