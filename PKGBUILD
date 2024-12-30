# Maintainer: DeltaCopy <7x0bb03yq@mozmail.com>
# Description: Builds Vinyl theme from https://github.com/ekaaty/vinyl-theme

# basic info
pkgname="vinyl"
pkgver=6.2.4.df777bd
pkgrel=2
pkgdesc="Vinyl Theme for KDE Plasma 6"
url="https://github.com/ekaaty/vinyl-theme"
arch=('x86_64' 'aarch64')
license=("GPL-2.0-or-later")
pkgdir="$srcdir/fakeinstall_kf6"
build_dir="build_kf6"

makedepends=(
  'cmake'
  'extra-cmake-modules>=6.7.0'
  'git'
)

options=(!emptydirs !debug)

source=(
    "${pkgname}.git::git+${url}.git"
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
  'inkscape'
  'xorg-xcursorgen'
)

depends=("${depends[@]}")

provides=("vinyl")

pkgver() {
  cd "$srcdir/$pkgname.git"
  git rev-parse --short HEAD
}

prepare() {
  cd "$srcdir/$pkgname.git"
}

build() (
  local cmake_options=(
    -B $build_dir
    -S "$pkgname.git"
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${cmake_options[@]}"

  cmake --build $build_dir
)

package() (
  install -dm755 "$pkgdir.git"
  DESTDIR="$pkgdir" cmake --install $build_dir
  rm -rf "$pkgdir/usr/lib/cmake"
)
