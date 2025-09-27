# Maintainer: isaac (me@isaac.fish)

_pkgname="qflipper"
pkgname="$_pkgname-momentum-git"
pkgver=1.3.3.r21.gfd70b20
pkgrel=1
pkgdesc="Desktop qFlipper app configured with Momentum Firmware update server"
url="https://github.com/Next-Flip/qFlipper"
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

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git"
  "libwdi"::"git+https://github.com/pbatard/libwdi"
  "nanopb"::"git+https://github.com/nanopb/nanopb"
  "deviceinfo.patch"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  '3d1f3bc6fdb2a0d01345be00ae7b9bc5cf4e9af0af23838c38bbf9af1aadd03c'
)

prepare() {
  cd "$_pkgsrc"
  git submodule init
  git config submodule.driver-tool/libwdi.url "$srcdir/libwdi"
  git config submodule.3rdparty/nanopb.url "$srcdir/nanopb"
  git -c protocol.file.allow=always submodule update

  # https://github.com/flipperdevices/qFlipper/pull/233
  patch -Np1 -i "$srcdir/deviceinfo.patch"

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

  mkdir -p "$_pkgsrc/build"
  cd "$_pkgsrc/build"

  qmake6 "${_qmake_options[@]}"

  make qmake_all
  make
}

package() {
  make -C "$_pkgsrc/build" INSTALL_ROOT="$pkgdir" install
}
