# Maintainer:

## links
# https://github.com/winft/como
# https://github.com/winft/theseus-ship
# https://github.com/winft/wrapland

# options
: ${_pkgver_como:=0.3.0}
: ${_pkgver_wlroots=} # 0.18

# basic info
_pkgname="theseus-ship"
pkgname="$_pkgname"
pkgver=6.2.0
pkgrel=1
pkgdesc="Wayland and X11 Compositor for the KDE Plasma desktop (formerly kwinft)"
url="https://github.com/winft/theseus-ship"
license=("LGPL-2.1-only")
arch=('x86_64' 'aarch64')

depends=(
  ## como
  "wlroots${_pkgver_wlroots}"
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
  pixman
  qt6-5compat
  qt6-declarative
  qt6-tools

  ## theseus-ship
  kcrash
  kdbusaddons
  knewstuff
  kscreenlocker
  qt6-multimedia

  # AUR
  wrapland
)
makedepends=(
  breeze
  extra-cmake-modules
  git
  kdeclarative
  kdoctools
  knotifications
  kxmlgui
  microsoft-gsl
  ninja
  xorg-xwayland
)
optdepends=(
  'qt6-virtualkeyboard: virtual keyboard support'
)

provides=(
  "kwin=$pkgver"
  "kwinft=$pkgver"
  "theseus-ship=$pkgver"
)
conflicts=(
  "kwin"
  "kwinft"
  "theseus-ship"
)

install="$_pkgname.install"

_pkgsrc_como="como-$_pkgver_como"
_pkgsrc_theseus="theseus-ship-$pkgver"
_pkgext="tar.gz"
source=(
  "$_pkgsrc_como.$_pkgext"::"https://github.com/winft/como/archive/refs/tags/v$_pkgver_como.$_pkgext"
  "$_pkgsrc_theseus.$_pkgext"::"https://github.com/winft/theseus-ship/archive/refs/tags/v$pkgver.$_pkgext"
)
sha256sums=(
  '5a4c9b531bd2ccdad2a262e83f94d8cf585b6422280f5963cb5c6cc432ae031a'
  '1f3567a4b1dd1a69046fe8669d624f4245733a72354025f127e732f4600fde18'
)

prepare() {
  sed -E -e 's&<(drm_fourcc.h)>&<libdrm/\1>&' \
    -i "$_pkgsrc_como/como/render/backend/wlroots/texture_update.h"
}

_build_como() {
  _cmake_options=(
    -B build_como
    -S "$_pkgsrc_como"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_LIBEXECDIR="lib"
    -DPixman_INCLUDE_DIRS='/usr/include/pixman-1'
    -Dwlroots_INCLUDE_DIRS="$_wlroots_include"
    -Dwlroots_LIBRARIES="$_wlroots_library"
    -Dwlroots_VERSION="$_pkgver_wlroots"
    -DCMAKE_SKIP_RPATH=ON
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build_como
  DESTDIR="$srcdir/fakeinstall" cmake --install build_como
}

_build_theseus() {
  _cmake_options=(
    -B build_theseus
    -S "$_pkgsrc_theseus"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_LIBEXECDIR="lib"
    -DPixman_INCLUDE_DIRS='/usr/include/pixman-1'
    -Dwlroots_INCLUDE_DIRS="$_wlroots_include"
    -Dwlroots_LIBRARIES="$_wlroots_library"
    -Dwlroots_VERSION="$_pkgver_wlroots"
    -Dcomo_DIR="$srcdir/fakeinstall/usr/lib/cmake/como"
    -DKWinDBusInterface_DIR="$srcdir/fakeinstall/usr/lib/cmake/KWinDBusInterface"
    -DCMAKE_SKIP_RPATH=ON
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build_theseus
  DESTDIR="$srcdir/fakeinstall" cmake --install build_theseus
}

build() {
  local _cmake_options _wlroots_include _wlroots_library
  _wlroots_include="$(pacman -Ql wlroots$_pkgver_wlroots | grep -m1 /usr/include/wlroots | cut -d' ' -f2)"
  _wlroots_library="$(pacman -Ql wlroots$_pkgver_wlroots | grep -m1 /usr/lib/libwlroots | cut -d' ' -f2)"

  _build_como
  _build_theseus
}

package() {
  cp --reflink=auto -r "$srcdir/fakeinstall"/* "$pkgdir/"
  chmod -R u=rwX,go=rX "$pkgdir/"
}
