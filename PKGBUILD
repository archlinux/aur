# Maintainer:
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dan Johansen <strit@manjaro.org>
# Contributor: Shaber

_pkgname="libcprime"
pkgname="$_pkgname-git"
pkgver=4.5.0.r2.gbc990a2
pkgrel=1
pkgdesc="A library for bookmarking, saving recent activites, managing settings of C-Suite"
url="https://gitlab.com/cubocore/libcprime"
license=('GPL3')
arch=('x86_64' 'aarch64')

depends=(
  qt6-base
)
makedepends=(
  cmake
  git
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  local _pkgver=$(
    git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' 2>/dev/null \
      | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
  )
  echo "${_pkgver:?}"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_LIBDIR='lib'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build
}
