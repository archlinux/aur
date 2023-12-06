# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=edencommon
pkgver=2023.12.04.00
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
  gmock
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
  '6de3a32ca6adf35c2fb0e1aff55bf3caa0785d80262e864353e667d82b16d1d9'
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
