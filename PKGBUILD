# Maintainer: envolution
# Contributor: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Morteza NourelahiAlamdari <m@0t1.me>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=google-crc32c-git
pkgver=1.1.2+r6+g2bbb3be
pkgrel=1
pkgdesc="CRC32C implementation with support for CPU-specific acceleration instructions"
arch=(x86_64)
url="https://github.com/google/crc32c"
license=(BSD-3-Clause)
depends=(
  gcc-libs
)
makedepends=(
  cmake
)
conflicts=(google-crc32c)
provides=(google-crc32c)
source=("$pkgname-${pkgver%%+*}::git+https://github.com/google/crc32c.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}-${pkgver%%+*}"
  git describe --tags --long 2>/dev/null | sed 's/^v//;s/-\([0-9]\+\)-/+r\1+/;s/-g/+g/'
}

build() {
  cd "${pkgname}-${pkgver%%+*}"
  cmake -B build -S . \
      -DCMAKE_BUILD_TYPE=None \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DBUILD_SHARED_LIBS=yes \
      -DCRC32C_BUILD_TESTS=OFF \
      -DCRC32C_BUILD_BENCHMARKS=OFF \
      -DCRC32C_USE_GLOG=OFF \
      -DCRC32C_INSTALL=ON \
      -Wno-dev
  cmake --build build
}

package() {
  cd "${pkgname}-${pkgver%%+*}"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
# vim:set ts=2 sw=2 et:
