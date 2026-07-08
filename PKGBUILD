# Maintainer:
# Contributor: archlinux.info:tdy

_pkgname="cutechess"
pkgname="$_pkgname-git"
pkgver=1.5.1.r2.ge471973
pkgrel=1
pkgdesc="Tools for working with chess engines"
url="https://github.com/cutechess/cutechess"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'hicolor-icon-theme'
  'qt6-5compat'
  'qt6-base'
  'qt6-svg'
)
makedepends=(
  'cmake'
  'doxygen'
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
    -DWITH_TESTS=$CHECKFUNC
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
