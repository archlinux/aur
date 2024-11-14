# Maintainer:
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

_pkgname="wxmaxima"
pkgname="$_pkgname-git"
pkgver=24.11.0.r0.g9898330
pkgrel=1
pkgdesc="A document based interface for the computer algebra system Maxima"
url="https://github.com/wxmaxima-developers/wxmaxima"
license=('GPL-2.0-or-later')
arch=('i686' 'x86_64')

depends=(
  'maxima'
  'webkit2gtk-4.1'
  'wxwidgets-gtk3'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*-*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config
    -DWXM_INTERPROCEDURAL_OPTIMIZATION=ON
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
