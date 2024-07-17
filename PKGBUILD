# Maintainer:

_pkgname="corepdf"
pkgname="$_pkgname-git"
pkgver=4.5.0.r10.g8a42dc9
pkgrel=1
pkgdesc="A PDF viewer from the C Suite"
url="https://gitlab.com/cubocore/coreapps/corepdf"
license=('GPL-3.0-only')
arch=('x86_64' 'aarch64')

depends=(
  libcprime
  poppler-qt5
)
makedepends=(
  git
  cmake
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' 2> /dev/null \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
