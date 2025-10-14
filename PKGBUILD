# Maintainer: DeltaCopy <7x0bb03yq@mozmail.com>
# Description: Builds Vinyl theme from https://github.com/ekaaty/vinyl-theme
# PKGBUILD issues: https://github.com/DeltaCopy/vinyl-git-aur

# basic info
pkgname="vinyl-git"
_pkgname="vinyl"
pkgver=r110.f16a505
pkgrel=1
pkgdesc="Vinyl Theme for KDE Plasma 6"
url="https://github.com/ekaaty/vinyl-theme"
arch=('x86_64' 'aarch64')
license=("GPL-2.0-or-later")
pkgdir="$srcdir/fakeinstall_kf6"
build_dir="build_kf6"

makedepends=(
  'cmake'
  'extra-cmake-modules>=6.13.0'
  'git'
)

options=(!emptydirs !debug)

source=(
    "${_pkgname}.git::git+${url}.git"
)

sha256sums=('SKIP')

depends=(
  'kdecoration'
  'qt6-declarative'
  'kcoreaddons'
  'kcmutils'
  'kcolorscheme'
  'kconfig'
  'kguiaddons'
  'kiconthemes'
  'kwindowsystem'
  'kdoctools'
  'kpackage'
  'frameworkintegration'
  'python-cairosvg'
  'python-lxml'
  'xorg-xcursorgen'
  'libplasma>=6.3.0'
)

depends=("${depends[@]}")

provides=("vinyl-git")

pkgver() {
  cd "$srcdir/$_pkgname.git"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname.git"
}

build() (
  local cmake_options=(
    -B $build_dir
    -S "$_pkgname.git"
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${cmake_options[@]}"

  cmake --build $build_dir
)

package() (
  install -dm755 "$pkgdir.git"
  DESTDIR="$pkgdir" cmake --install $build_dir --prefix /usr
  rm -rf "$pkgdir/usr/lib/cmake"
)
