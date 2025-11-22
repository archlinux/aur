# Maintainer:
# Contributor: Vincent Bernardoff <vb AT luminar.eu.org>

_pkgname="nng"
pkgname="$_pkgname-git"
pkgver=1.11.r687.g7291d12
pkgrel=1
pkgdesc="A lightweight, broker-less library"
url="https://github.com/nanomsg/nng"
license=('MIT')
arch=('x86_64')

depends=(
  'wolfssl'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  local _tag _version _revision _hash
  _tag=$(git tag -l 'v[0-9]*' | grep -Ev '[A-Za-z][A-Za-z]' | sort -rV | head -1)
  _version="${_tag#v}"
  _revision=$(git rev-list --count --cherry-pick "$_tag"...HEAD)
  _commit=$(git rev-parse --short=7 HEAD)
  printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_commit:?}"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DNNG_ENABLE_TLS=ON
    -DBUILD_SHARED_LIBS=ON
    -DNNG_ENABLE_TLS=ON
    -DNNG_TLS_ENGINE=wolf
    -DNNG_TESTS=$CHECKFUNC
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure || :
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
