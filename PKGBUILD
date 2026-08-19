# Maintainer: sockeye-d (me@fishies.dev)
pkgname=godl
pkgver=1.4.0
pkgrel=1
pkgdesc="Godot project and version manager"
arch=('x86_64')
url="https://codeberg.org/fishn/godl"
license=('MIT')
source=("git+https://codeberg.org/fishn/godl.git#tag=v${pkgver}" "git+https://invent.kde.org/fishy/kitemviews#commit=52fe8223f50dbe72f37f885ab0a870a6145dd2c4")
sha256sums=('SKIP' 'SKIP')
depends=('git' 'qt6-base' 'kcoreaddons' 'kconfig' 'kconfigwidgets' 'karchive' 'kwidgetsaddons' 'kxmlgui' 'kcolorscheme')
optdepends=('scons: for godot-cpp project development')
makedepends=('cmake' 'extra-cmake-modules')

prepare() {
  cd "godl" || exit 1
  git submodule init
  git config submodule.thirdparty/kitemviews.url "$srcdir/kitemviews"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "godl" || exit 1
  local cmake_options=(
    -B build
    -S .
    -W no-dev
    -D CMAKE_BUILD_TYPE=MinSizeRel
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}" || exit 1
  cmake --build build -j "$(nproc --all)"
}

package() {
  cd "godl" || exit 1
  DESTDIR="$pkgdir" cmake --install build
}
