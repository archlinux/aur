# Maintainer: envolution
# Contributor: Carl Smedstad <carsme@archlinux.org>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=edencommon-git
_pkgname=edencommon
pkgver=2025.06.02.00+r1649+g6c93ae382
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
  git
  boost
  cmake
  gtest
  mvfst
)
conflicts=(edencommon)
provides=(
  "edencommon=${pkgver%%+*}"
  libedencommon_os.so
  libedencommon_telemetry.so
  libedencommon_testharness.so
  libedencommon_utils.so
)
options=(!lto)
source=(
  git+https://github.com/facebookexperimental/edencommon.git
  "build-shared-libraries.patch"
)
sha256sums=('SKIP'
            '1f351de94a786c8be397c07454a48d28a0dd0b758924792e6e3f1f49405c492a')

pkgver() {
  cd "$srcdir/$_pkgname"
  _version=$(git describe --tags --abbrev=0 | tr - .)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version#'v'}+r${_commits}+g${_short_commit_hash}"
}

prepare() {
  cd $_pkgname
  patch -Np1 -i ../build-shared-libraries.patch
  # Use system CMake config instead of bundled module
  sed -i 's/find_package(Glog MODULE REQUIRED)/find_package(Glog CONFIG REQUIRED)/' \
    CMakeLists.txt
}

build() {
  cd $_pkgname
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

package() {
  cd $_pkgname
  DESTDIR="$pkgdir" cmake --install build
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE || true
}
# vim:set ts=2 sw=2 et:
