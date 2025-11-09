# Maintainer:
# Contributor: DeltaCopy <7x0bb03yq@mozmail.com>

_pkgname="vinyl"
pkgname="$_pkgname-git"
pkgver=6.5.2.r4.ge3b59e0
pkgrel=1
pkgdesc="Vinyl Theme for KDE Plasma 6"
url="https://github.com/ekaaty/vinyl-theme"
license=("GPL-2.0-or-later")
arch=('x86_64' 'aarch64')

depends=(
  'frameworkintegration'
  'kcmutils'
  'kcolorscheme'
  'kconfig'
  'kcoreaddons'
  'kdecoration'
  'kdoctools'
  'kguiaddons'
  'kiconthemes'
  'kirigami'
  'kwindowsystem'
  'libplasma'
  'qt6-declarative'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'git'
  'python'
  'python-cairosvg'
  'python-lxml'
  'xorg-xcursorgen'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!strip' '!debug')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() (
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
)

package() (
  DESTDIR="$pkgdir" cmake --install build --prefix /usr
  rm -rf "$pkgdir/usr/lib/cmake"
)
