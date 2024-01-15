# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>

pkgname=nsync
pkgver=1.26.0
pkgrel=2
pkgdesc="A C library that exports various synchronization primitives, such as mutexes"
arch=(x86_64)
url="https://github.com/google/nsync"
license=(Apache-2.0)
depends=(
  gcc-libs
  glibc
)
makedepends=(cmake)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "0001-nsync-export.patch"
)
sha256sums=(
  '80fc1e605bb3cf5f272811ece39c4fb6761ffcb9b30563301845cc9ff381eb8b'
  '7733d2979d9ec4ec7a9e7af8814544bdd68b5482ebaea1f00011ac8e1ea44258'
)

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  # Based on https://github.com/msys2/MINGW-packages/blob/master/mingw-w64-nsync/0001-nsync-mingw-w64.patch
  patch -Np1 -i ../0001-nsync-export.patch
}

build() {
  cd "$_archive"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON
  cmake --build build
}

check() {
  cd "$_archive"

  ctest --test-dir build --output-on-failure
}

package() {
  cd "$_archive"

  DESTDIR="$pkgdir" cmake --install build
}
