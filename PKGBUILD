# Maintainer: DeltaCopy <7x0bb03yq@mozmail.com>
# Description: Builds Transistor from https://invent.kde.org/saurov/transistor
# PKGBUILD issues: https://github.com/DeltaCopy/transistor-git-aur

# basic info
pkgname="transistor-git"
_pkgname="transistor"
pkgver=r21.fa9a7df
pkgrel=2
pkgdesc="Internet radio player that provides access to a station database with over 50,000 stations."
url="https://invent.kde.org/saurov/transistor"
arch=('x86_64' 'aarch64')
license=("GPL-2.0-or-later")
pkgdir="$srcdir/fakeinstall_kf6"
build_dir="build"
options=(!emptydirs)
source=("${_pkgname}.git::git+${url}")
sha256sums=('SKIP')
provides=($pkgname)

makedepends=(
  'cmake'
  'extra-cmake-modules'
  'git'
  'gcc'
  'binutils'
  'ninja'
)

depends=(
  'qt6-base'
  'qt6-declarative'
  'qt6-multimedia-ffmpeg'
  'qt6-svg'
  'kirigami'
  'kcoreaddons'
  'kdbusaddons'
  'kiconthemes'
  'knotifications'
  'jack'
)

depends=("${depends[@]}")

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
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=Release
    -GNinja
    -Wno-dev
  )

  cmake "${cmake_options[@]}"
  ninja -C $build_dir
)

package() (
  DESTDIR="$pkgdir" ninja install -C $build_dir
  rm -rf "$pkgdir/usr/lib/cmake"
)
