# Maintainer: envolution
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: László Várady <laszlo.varady93@gmail.com>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=fizz-git
_pkgname=fizz
pkgver=2025.06.02.00+r5442+g66404ed44
pkgrel=1
pkgdesc="C++14 implementation of the TLS-1.3 standard"
arch=(x86_64)
url="https://github.com/facebookincubator/fizz"
license=(BSD-3-Clause)
depends=(
  double-conversion
  fmt
  folly
  gcc-libs
  gflags
  glibc
  google-glog
  libsodium
  openssl
  zlib
  zstd
)
makedepends=(
  boost
  cmake
  gtest
)
checkdepends=(expat)
provides=(
  "fizz=${pkgver%%+*}"
  libfizz.so
  libfizz_test_support.so
)
conflicts=(fizz)
source=(git+https://github.com/facebookincubator/fizz.git)
sha256sums=('SKIP')
pkgver() {
  cd "$srcdir/$_pkgname"
  _version=$(git describe --tags --abbrev=0 | tr - .)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version#'v'}+r${_commits}+g${_short_commit_hash}"
}

prepare() {
  cd $_pkgname
  # Use system CMake config instead of bundled module
  sed -i 's/find_package(Glog REQUIRED)/find_package(Glog CONFIG REQUIRED)/' \
    fizz/CMakeLists.txt
}

build() {
  cd $_pkgname
  cmake -S fizz -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -DBUILD_TESTS=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DPACKAGE_VERSION="${pkgver%%+*}"
  cmake --build build
}

package() {
  cd $_pkgname
  DESTDIR="$pkgdir" cmake --install build

  # Remove empty directories to avoid namcap warnings
  rm -vr "$pkgdir/usr/include/fizz/tool/test" || true
  rm -vr "$pkgdir/usr/include/fizz/util/test" || true

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE || true
}
# vim:set ts=2 sw=2 et:
