# Maintainer:
# Contributor: Jan Neumann <neum dot ja at gmail dot com>
# Contributor: librewish <librewish at gmail dot com>

_pkgname="ksmoothdock"
pkgname="$_pkgname-git"
pkgver=6.3.r0.g30e51e8
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
  'python'
)


if [ x"$pkgname" == x"$_pkgname" ] ; then
  # normal package
  _pkgsrc="$_pkgname-${pkgver%%.r*}"
  _pkgext="tar.gz"
  source=(
   "$_pkgsrc.$_pkgext"::"$url/archive/v${pkgver%%.r*}.$_pkgext"
  )
  sha256sums=(
   '96eb9ce72ee4c44496c760c6bc9aa5e26b5cd3826729c112e7c81d2661effc02'
  )

  pkgver() {
    echo "${pkgver%%.r*}"
  }
else
  # git package
  makedepends+=('git')

  provides=("$_pkgname")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source=(
   "$_pkgsrc"::"git+$url.git"
  )
  sha256sums=(
   'SKIP'
  )

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
  }
fi

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
  DESTDIR="${pkgdir:?}" cmake --install build
}
