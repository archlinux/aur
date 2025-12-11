# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Contributor: João Figueiredo

_pkgname="ksnip"
pkgname="$_pkgname-git"
pkgver=1.10.1.r125.g5f9832f
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

prepare() {
  cd "$_pkgsrc"

  # fix for Qt 6.10.1
  sed -E -e '/QT_COMPONENTS/s&(Widgets)&\1 Gui GuiPrivate&' -i CMakeLists.txt
  sed -E -e 's&(Qt\$\{QT_MAJOR_VERSION\})::(Widgets)&\1::\2 \1::Gui&' -i src/CMakeLists.txt
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[A-Za-z][A-Za-z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() (
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
