# Maintainer: envolution
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: László Várady <laszlo.varady93@gmail.com>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Daichi Shinozaki <dsdseg at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=wangle-git
_pkgname=wangle
pkgver=2025.06.02.00+r6863+g86633ba4b
pkgrel=1
pkgdesc="C++ networking library providing client/server abstractions for building services"
arch=(x86_64)
url="https://github.com/facebook/wangle"
license=(Apache-2.0)
depends=(
  double-conversion
  fizz
  fmt
  folly
  gcc-libs
  gflags
  glibc
  google-glog
  openssl
)
makedepends=(
  git
  boost
  cmake
  gtest
)
checkdepends=(expat)
provides=("wangle=${pkgver%%+*}" libwangle.so)
conflicts=(wangle)
source=(git+https://github.com/facebook/wangle.git)
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
  # Use system CMake config instead of bundled module, incompatible with glog
  # v0.7.0+
  sed -i 's/find_package(Glog REQUIRED)/find_package(Glog CONFIG REQUIRED)/' \
    wangle/CMakeLists.txt
}

build() {
  cd $_pkgname
  cmake -S wangle -B build \
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
  rm -vr "$pkgdir/usr/include/wangle/service/test" || true
  rm -vr "$pkgdir/usr/include/wangle/ssl/test/certs" || true
  rm -vr "$pkgdir/usr/include/wangle/util/test" || true
}
# vim:set ts=2 sw=2 et:
