# Maintainer:

_pkgname="kdisplay"
pkgname="$_pkgname"
pkgver=6.1.0
pkgrel=1
pkgdesc='Display management app and daemon (kwinft)'
url="https://github.com/winft/kdisplay"
license=('LGPL-2.1-only')
arch=('x86_64' 'aarch64')

depends=(
  kdeclarative
  layer-shell-qt
  libplasma
  plasma5support
  qt6-sensors

  # AUR
  disman

  ## implicit
  #kcmutils
  #kconfig
  #kcoreaddons
  #kdbusaddons
  #kglobalaccel
  #ki18n
  #kirigami
  #ksvg
  #kwindowsystem
  #kxmlgui
  #qt6-declarative
)
makedepends=(
  clang
  extra-cmake-modules
  git
  lld
  llvm
  ninja
)

provides=("kscreen=$pkgver")
conflicts=("kscreen")

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('e118e8240ee0f1e2e212ddf123b89e46169f293f8c37c5ec06b1556425ab8032')

build() {
  export CC=clang
  export CXX=clang++
  export LDFLAGS+=" -fuse-ld=lld"

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
