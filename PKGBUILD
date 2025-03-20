# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Contributor: João Figueiredo

_pkgname="ksnip"
pkgname="$_pkgname-git"
pkgver=1.10.1.r115.g2fc56dd
pkgrel=1
pkgdesc="Screenshot and annotation tool (Qt6)"
url="https://github.com/ksnip/ksnip"
license=("GPL-2.0-or-later")
arch=('x86_64')

depends=(
  hicolor-icon-theme
  kimageannotator
  qt6-base
  qt6-svg
)
makedepends=(
  cmake
  extra-cmake-modules
  git
  ninja
  qt6-tools
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+https://github.com/ksnip/ksnip.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[A-Za-z][A-Za-z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() (
  #export PATH="/usr/lib/qt6/bin:$PATH"

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DBUILD_WITH_QT6=ON
    -DBUILD_TESTS=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
)

package() {
  DESTDIR="$pkgdir" cmake --install build
}
