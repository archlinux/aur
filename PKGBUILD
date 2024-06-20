# Maintainer:

## useful links
# https://github.com/winft/como
# https://github.com/winft/theseus-ship
# https://github.com/winft/wrapland

# options
: ${_pkgver_como:=0.2.0}

# basic info
_pkgname="theseus-ship"
pkgname="$_pkgname"
pkgver=6.1.0
pkgrel=1
pkgdesc="Wayland and X11 Compositor for the KDE Plasma desktop (formerly kwinft)"
url="https://github.com/winft/theseus-ship"
license=("LGPL-2.1-only")
arch=('x86_64' 'aarch64')

depends=(
  ## como
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

  ## theseus-ship
  kcrash
  kdbusaddons
  knewstuff
  kscreenlocker
  pixman
  qt6-multimedia

  # AUR
  wrapland
)
makedepends=(
  breeze
  clang
  extra-cmake-modules
  git
  kdeclarative
  kdoctools
  knotifications
  kxmlgui
  lld
  llvm
  microsoft-gsl
  ninja
  xorg-xwayland
)
optdepends=(
  'qt6-virtualkeyboard: virtual keyboard support'
)

provides=(
  "como=$_pkgver_como"
  "kwin=$pkgver"
  "kwinft=$pkgver"
  "theseus-ship=$pkgver"
)
conflicts=(
  "como"
  "kwin"
  #"kwinft"
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
sha256sums=('24a43c5cb49760eb89f0414aa03f0007441fb2b8ef934e9ccb39af01646a27a9'
            'dd3bb31644636e4d3e855df36b4467b20312184ac2b5462594c211107f36824c')

build() {
  export CC=clang
  export CXX=clang++
  export LDFLAGS+=" -fuse-ld=lld"

  local _cmake_options

  # como
  _cmake_options=(
    -B build_como
    -S "$_pkgsrc_como"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_LIBEXECDIR="lib"
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build_como
  DESTDIR="$srcdir/fakeinstall" cmake --install build_como

  # theseus-ship
  _cmake_options=(
    -B build_theseus
    -S "$_pkgsrc_theseus"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_LIBEXECDIR="lib"

    -Dcomo_DIR="$srcdir/fakeinstall/usr/lib/cmake/como"
    -DKWinDBusInterface_DIR="$srcdir/fakeinstall/usr/lib/cmake/KWinDBusInterface"

    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build_theseus
  DESTDIR="$srcdir/fakeinstall" cmake --install build_theseus
}

package() {
  cp --reflink=auto -r "$srcdir/fakeinstall"/* "$pkgdir/"
  chmod -R u=rwX,go=rX "$pkgdir/"
}
