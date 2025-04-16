# Maintainer: Stefan Biereigel <stefan@biereigel.de>

_pkgname="fparser"
pkgname="$_pkgname-git"
pkgver=r12.a952179
pkgrel=3
pkgdesc="Function Parser for C++, Fork from http://warp.povusers.org/FunctionParser/"
url="https://github.com/thliebig/fparser"
arch=('i686' 'x86_64')
license=('LGPL-3.0-only')

depends=(
  'gcc-libs'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
)

provides=('fparser')
conflicts=('fparser')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+https://github.com/thliebig/fparser.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
