# Maintainer:
# Contributor: Michael Kuc <michaelkuc6 at gmail dot com>

_pkgname="libcaption"
pkgname="${_pkgname}-git"
pkgver=0.7.r21.ge8b6261
pkgrel=1
pkgdesc="Free open-source CEA608 / CEA708 closed-caption encoder/decoder "
url="https://github.com/szatmary/libcaption"
license=('MIT')
arch=('x86_64')

depends=(
  'glibc'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
)

provides=("${_pkgname}")
conflicts=("${_pkgname}")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  local _tag _revision _hash
  _tag=$(git tag | sort -rV | head -1)
  _revision=$(git rev-list --count --cherry-pick "$_tag"...HEAD)
  _hash=$(git rev-parse --short=7 HEAD)
  printf '%s.r%s.g%s' "${_tag:?}" "${_revision:?}" "${_hash:?}"
}

build() {
  export CFLAGS
  CFLAGS+=" -ffat-lto-objects"

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -m644 -D "$_pkgsrc/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
