# Maintainer:

_pkgname="kontainer"
pkgname="$_pkgname-git"
pkgver=1.2.1.r0.g94e8b21
pkgrel=1
pkgdesc="A simple Kirigami GUI for Distrobox"
url="https://github.com/DenysMb/Kontainer"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'kirigami'
  'kirigami-addons'
  'kio'
  'qqc2-desktop-style'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'git'
  'ninja'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="denysmb.kontainer"
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
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  depends+=(
    'distrobox'
  )

  DESTDIR="$pkgdir" cmake --install build
}
