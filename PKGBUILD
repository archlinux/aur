# Maintainer: DeltaCopy <7x0bb03yq@mozmail.com>
# Description: Builds Lightly from https://github.com/Bali10050/Lightly

# basic info
pkgname="lightly-qt6"
pkgver=0.5.11
pkgrel=1
pkgdesc="Bali10050's fork of Lightly (A modern style for qt applications)"
url="https://github.com/Bali10050/lightly"
arch=('x86_64' 'aarch64')
license=("GPL-2.0-or-later")
pkgdir="$srcdir/fakeinstall_kf6"
build_dir="build_kf6"

makedepends=(
  'cmake'
  'extra-cmake-modules'
  'git'
)

options=(!emptydirs !debug)

source=(
    "${pkgname}.git::git+${url}.git#tag=v${pkgver//_/-}"
)

sha256sums=(
  '2dfe303947f28e2c2b50d78d4adc2f3e5f4a36960981e5666f0fed8842a9e7ef'
)

# KF6/Qt6
depends_kf6=(
  'kdecoration'
  'qt6-declarative'
  'kcoreaddons'
  'kcmutils'
  'kcolorscheme'
  'kconfig'
  'kguiaddons'
  'kiconthemes'
  'kwindowsystem'
)

# KF5/QT5 for backward compatibility
depends_kf5=(
    'kcmutils5'
    'frameworkintegration5'
    'kconfigwidgets5'
    'kiconthemes5'
    'kirigami2'
    'kwindowsystem5'
)

depends=("${depends_kf6[@]}" "${depends_kf5[@]}")

conflicts=(
  lightly-kf6
  lightly-qt
  lightly-qt6-bin
)

pkgver() {
  cd "$srcdir/$pkgname.git"
  git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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

  # for build optimization: use all cores -1 to not overload system

  printf "Using $(($(nproc) - 1)) cores\n"
  cmake --build $build_dir -j $(($(nproc) - 1))
)

package() (
  install -dm755 "$pkgdir.git"
  DESTDIR="$pkgdir" cmake --install $build_dir
  rm -rf "$pkgdir/usr/lib/cmake"
)
