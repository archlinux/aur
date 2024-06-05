# Maintainer:
# Contributor: Jan Neumann <neum dot ja at gmail dot com>
# Contributor: librewish <librewish at gmail dot com>

_pkgname="ksmoothdock"
pkgname="$_pkgname-git"
pkgver=6.3.r1.g09787bd
pkgrel=1
pkgdesc='A cool desktop panel for KDE Plasma 5'
arch=('x86_64')
url='https://github.com/dangvd/ksmoothdock'
license=('GPL3')

depends=(
  'kactivities5'
  'kxmlgui5'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'git'
  'python'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc"
  sed '/add_compile_options/d' -i "src/CMakeLists.txt"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc/src"
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
