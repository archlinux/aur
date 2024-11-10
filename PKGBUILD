# Maintainer:
# Contributor: Vincent Bernardoff <vb AT luminar.eu.org>

_pkgname="nng"
pkgname="$_pkgname-git"
pkgver=1.9.0.r187.gcbe9a27
pkgrel=1
pkgdesc="Rewrite of the SP protocol library known as libnanomsg"
url="https://github.com/nanomsg/nng"
license=('MIT')
arch=('x86_64')

depends=(
  'mbedtls'
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
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DNNG_ENABLE_DOC=OFF # missing files
    -DNNG_ENABLE_TLS=ON
    -DBUILD_SHARED_LIBS=ON
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
