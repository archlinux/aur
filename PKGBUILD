# Maintainer: envolution
# Contributor: envolution
# Contributor: David Runge <dvzrv@archlinux.org>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=cpptoml-git
_pkgname=cpptoml
pkgver=0.1.1+r256+gfededad71
pkgrel=1
pkgdesc="A header-only library for parsing TOML"
arch=(any)
url="https://github.com/skystrife/cpptoml"
license=(MIT)
makedepends=(cmake)
provides=("cpptoml=${pkgver%%+*}")
conflicts=(cpptoml)
source=(
  git+https://github.com/skystrife/cpptoml.git
  $pkgname-0.1.1-limit_header.patch::https://github.com/skystrife/cpptoml/pull/123/commits/c55a516e90133d89d67285429c6474241346d27a.patch
)
sha256sums=('SKIP'
            '889c4307ed34f9089ec5f56f5ffb53ae4730047ada8be013d21cd52f11575287')

pkgver() {
  cd "$srcdir/$_pkgname"
  _version=$(git describe --tags --abbrev=0 | tr - .)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version#'v'}+r${_commits}+g${_short_commit_hash}"
}

prepare() {
  # add missing header: https://github.com/skystrife/cpptoml/pull/123
  patch -Np1 -d $_pkgname -i ../$pkgname-0.1.1-limit_header.patch || true
}

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
    -W no-dev
    -S $_pkgname
  )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 "$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/" || true
  install -vDm 644 "$_pkgname/README.md" -t "$pkgdir/usr/share/doc/$pkgname/" || true
}
# vim:set ts=2 sw=2 et:
