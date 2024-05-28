# Maintainer: abelian424

_pkgname="como"
pkgname="$_pkgname"
pkgver=0.1.0
pkgrel=4
pkgdesc='Library collection to easily create Wayland and X11 compositors'
url="https://github.com/winft/como"
license=('LGPL-2.1-only')
arch=('x86_64' 'aarch64')

depends=(
  kauth
  kcmutils
  kconfigwidgets
  kdecoration
  kglobalaccel
  kidletime
  kpackage
  kquickcharts
  kservice
  ksvg
  libepoxy
  libplasma
  libqaccessibilityclient-qt6
  qt6-5compat
  qt6-declarative
  qt6-tools
  wlroots

  # AUR
  wrapland

  ## implicit
  #kcolorscheme
  #kconfig
  #kcoreaddons
  #ki18n
  #kirigami
  #kwidgetsaddons
  #kwindowsystem
  #libinput
  #libx11
  #libxcb
  #libxkbcommon
  #qt6-base
  #wayland
  #xcb-util-image
  #xcb-util-keysyms
)
makedepends=(
  breeze
  clang
  extra-cmake-modules
  git
  kcrash
  kdeclarative
  kdoctools
  knewstuff
  knotifications
  kscreenlocker
  kxmlgui
  lld
  llvm
  microsoft-gsl
  ninja
  qt6-multimedia
  xorg-xwayland
)

provides=("kwin")
conflicts=("kwin")

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=(
  "$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext"
)
sha256sums=(
  '49d9b8b8b8197f4443f8eae71db8adecf51da73c221a4712d0d8cc46b9fdc09f'
)

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
    -DCMAKE_INSTALL_LIBDIR='lib'
    -DCMAKE_INSTALL_LIBEXECDIR="lib"
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  depends+=(
    hicolor-icon-theme
  )

  DESTDIR="$pkgdir" cmake --install build
}
