# Maintainer:

_pkgname="kimageannotator"
pkgname="$_pkgname-git"
pkgver=0.7.1.r13.gb8b8734
pkgrel=1
pkgdesc="Tool for annotating images"
url="https://github.com/ksnip/kImageAnnotator"
license=('LGPL-3.0-only')
arch=('x86_64')

depends=(
  'kcolorpicker'
  'qt6-svg'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'qt6-tools'
)

provides=("$_pkgname")
conflicts=(
  "$_pkgname"
  "$_pkgname-qt6"
)

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
    -DBUILD_SHARED_LIBS=ON
    -DBUILD_WITH_QT6=ON
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
