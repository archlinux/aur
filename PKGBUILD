# Maintainer: isaacify (isaac@bingoisaac.dev)

_pkgname="qflipper"
pkgname="$_pkgname-momentum-git"
pkgver=1.3.3.r7.g25691ce
pkgrel=1
pkgdesc="Desktop qFlipper app configured with Momentum Firmware update server"
license=('GPL3')
arch=('x86_64')
depends=(
  'libusb'
  'qt6-5compat'
  'qt6-declarative'
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
  "$_pkgname"::"git+https://github.com/Next-Flip/qFlipper"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

prepare() {
  cd "$_pkgname"
  git submodule init
  git config submodule.driver-tool/libwdi.url "$srcdir/libwdi"
  git config submodule.3rdparty/nanopb.url "$srcdir/nanopb"
  git -c protocol.file.allow=always submodule update
  
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

