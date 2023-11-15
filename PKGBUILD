# Maintainer:
# Contributor: Zren <zrenfire@gmail.com>

_pkgname="material-kwin-decoration"
pkgname="${_pkgname}-git"
pkgver=0.0.7.r39.g0e989e5
pkgrel=1
pkgdesc="Material-ish window decoration theme for KWin, with LIM support"
url='https://github.com/Zren/material-decoration'
license=('GPL')
arch=('x86_64')

depends=(
  kconfig5
  kconfigwidgets5
  kcoreaddons5
  kdecoration
  kiconthemes5
  kwindowsystem5

  ## runtime?
  #kauth5
  #kcodecs5

  ## implicit
  #gcc-libs
  #glibc
  #kguiaddons5
  #ki18n5
  #kwidgetsaddons5
  #libxcb
  #qt5-base
  #qt5-x11extras
)
makedepends=(
  cmake
  extra-cmake-modules
  git
  kwayland5
)
optdepends=(
  'appmenu-gtk-module: gtk app support'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' 2>/dev/null \
    | sed -E 's/^v/0.0./;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build
}
