# Maintainer:

_pkgname="darkly"
pkgname="$_pkgname-qt6-git"
pkgver=0.5.23.r0.gc1446a0
pkgrel=2
pkgdesc="Modern style for KF6/Qt6 applications (fork of Lightly)"
url="https://github.com/Bali10050/Darkly"
license=("GPL-2.0-or-later")
arch=('x86_64' 'aarch64')

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
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'git'
  'ninja'
)
optdepends+=("$_pkgname-qt5: KF5/Qt5 support")

provides=("$_pkgname-qt6")
conflicts=(
  "$_pkgname"
  "$_pkgname-qt6"
)

options=('!emptydirs')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() (
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DBUILD_QT5=OFF
    -DBUILD_QT6=ON
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
)

package() {
  DESTDIR="$pkgdir" cmake --install build

  # unwanted
  rm -rf "$pkgdir/usr/lib/cmake"
}
