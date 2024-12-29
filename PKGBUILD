# Maintainer: DeltaCopy <7x0bb03yq@mozmail.com>
# Description: Builds Darkly from https://github.com/Bali10050/Darkly

# basic info
pkgname="darkly"
pkgver=0.5.13
pkgrel=1
pkgdesc="Bali10050's fork of Lightly (A modern style for qt applications)"
url="https://github.com/Bali10050/darkly"
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
  'e978bec25a11e94dfa62e9316929049f5006b61cf1de6633cc53db37ae8d0f4b'
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
  cmake --build $build_dir
)

package() (
  install -dm755 "$pkgdir.git"
  DESTDIR="$pkgdir" cmake --install $build_dir
  rm -rf "$pkgdir/usr/lib/cmake"
)
