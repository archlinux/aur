# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname="lightly"
pkgname="$_pkgname-git"
pkgver=0.4.1.r73.g00ca234
pkgrel=1
pkgdesc="Modern style for Qt applications"
url="https://github.com/boehs/lightly"
arch=('x86_64' 'aarch64')
license=("GPL-2.0-or-later")

depends=(
  'frameworkintegration'
  'hicolor-icon-theme'
  'kcmutils'
  'kcolorscheme'
  'kconfig'
  'kcoreaddons'
  'kdecoration'
  'kguiaddons'
  'kiconthemes'
  'kwindowsystem'
  'qt6-declarative'

  ## implicit
  #ki18n
  #kwidgetsaddons
  #qt6-base
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'git'
)

provides=(
  "$_pkgname=${pkgver%%.r*}"
  lightly-qt6-git
  lightly-qt
)
conflicts=(
  "$_pkgname"
  lightly-boehs-git
  lightly-qt6-git
  lightly-qt
)

_pkgsrc="$_pkgname"
source=(
  "$_pkgname"::"git+$url.git#branch=qt6"
  "qt6-missing-config.patch"
)
sha256sums=(
  'SKIP'
  '2553ff71310e265a9481c0afb9d50bbd1d9f66d47bd67675956199601c1a6501'
)

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc"
  patch -Np1 -F100 -i ../qt6-missing-config.patch
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"

  cmake --build build/kdecoration/config/
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
