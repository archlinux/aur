# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>

_pkgname="qflipper"
pkgname="$_pkgname"
pkgver=1.3.3
pkgrel=1
pkgdesc="Desktop application for updating Flipper Zero firmware via PC"
license=('GPL3')
arch=('x86_64')
depends=(
  'libusb'
  'qt6-5compat'
  'qt6-quickcontrols2'
  'qt6-serialport'
  'qt6-svg'
)
makedepends=(
  'git'
  'qt6-tools'
)
source=(
  "libwdi"::"git+https://github.com/pbatard/libwdi"
  "nanopb"::"git+https://github.com/nanopb/nanopb"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

if [ x"$_pkgname" == x"$pkgname" ] ; then
  # normal package
  url="https://flipperzero.one/update"

  source+=("$_pkgname"::"git+https://github.com/flipperdevices/qFlipper#tag=$pkgver")
  sha256sums+=('SKIP')
else
  # x-git package
  url="https://github.com/flipperdevices/qFlipper"

  provides+=("$_pkgname")
  conflicts+=("$_pkgname")

  source+=("$_pkgname"::"git+https://github.com/flipperdevices/qFlipper")
  sha256sums+=('SKIP')

  pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g; s/^v//'
  }
fi

prepare() {
  cd "$_pkgname"
  git submodule init
  git config submodule.driver-tool/libwdi.url "$srcdir/libwdi"
  git config submodule.3rdparty/nanopb.url "$srcdir/nanopb"
  git -c protocol.file.allow=always submodule update

  # Use uucp group instead of dialout for udev rules
  sed -i 's/dialout/uucp/g' installer-assets/udev/42-flipperzero.rules
}

build() {
  local _qmake_options=(
    ../qFlipper.pro
    -spec linux-g++
    CONFIG+=qtquickcompiler
    DEFINES+=DISABLE_APPLICATION_UPDATES
    PREFIX=/usr
  )

  mkdir -p "$_pkgname/build"
  cd "$_pkgname/build"

  qmake6 "${_qmake_options[@]}"

  make qmake_all
  make
}

package() {
  make -C "$_pkgname/build" INSTALL_ROOT="$pkgdir" install
}
