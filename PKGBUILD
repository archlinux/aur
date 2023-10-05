# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=edencommon
pkgver=2023.10.02.00
pkgrel=1
pkgdesc="Shared library for Watchman and Eden projects"
arch=(x86_64)
url="https://github.com/facebookexperimental/edencommon"
license=(MIT)
depends=()
makedepends=(
  boost
  cmake
  gmock
  folly
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('16ba3c513526a96007171fba40970589f0aac667a2f092f8ee6d26534e2847ae')
options=(!lto)

_archive="$pkgname-$pkgver"

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
