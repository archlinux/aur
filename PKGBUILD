# Maintainer: DeltaCopy <7x0bb03yq@mozmail.com>
# Description: Builds Lightly from https://github.com/Bali10050/Lightly

# basic info
pkgname="lightly-qt6"
pkgver=0.5.2 # change this to match the name of the release tag you want to build from
pkgrel=2
pkgdesc="Bali10050's fork of Lightly (A modern style for qt applications)"
url="https://github.com/Bali10050/lightly"
arch=('x86_64' 'aarch64')
license=("GPL-2.0-or-later")
pkgdir="$srcdir/fakeinstall_kf6"

makedepends=(
  'cmake'
  'extra-cmake-modules'
  'git'
)

options=(!emptydirs !debug)

source=(
    "${pkgname}.git::git+${url}.git#tag=v${pkgver//_/-}"
)

# use makepkg -g to generate the sha256sum for the release tag
sha256sums=(
  '7d3fc45304a2937a1565620a91453d20dca24dddeb180e702f039362b6d8ec6d'  # 0.5.2 tag
  #'86790e88ac2275cbf0bb398c143716f1f80014927861765c89b3e8dbea0387d7' # 0.5.1 tag
  #'50c3fbd437501c6ef9acc9fbce66a6b1457c4f6e0ea255eea02a65170586e4b9' # 0.5.0 tag
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

depends=("${depends_kf6[@]}")

conflicts=(
  lightly-kf6
  lightly-qt
)

provides=("lightly-qt6")

pkgver() {
  cd "$srcdir/$pkgname.git"
  git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname.git"
}

build() (
  local cmake_options=(
    -B build_kf6
    -S "$pkgname.git"
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${cmake_options[@]}"

  # for build optimization: use all cores -1 to not overload system

  printf "Using $(($(nproc) - 1)) cores\n"

  make -j $(($(nproc) - 1)) -C "$srcdir/build_kf6/kdecoration/config/"
  make -j $(($(nproc) - 1)) -C "$srcdir/build_kf6/colors/"
  make -j $(($(nproc) - 1)) -C "$srcdir/build_kf6/"
)

package() (
  install -dm755 "$pkgdir.git"
  DESTDIR="$pkgdir" cmake --install build_kf6
  rm -rf "$pkgdir/usr/lib/cmake"
)
