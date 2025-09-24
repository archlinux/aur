# Maintainer:
# Contributor: L. Bradley LaBoon <me@bradleylaboon.com>

_pkgname="qflipper"
pkgname="$_pkgname-git"
pkgver=1.3.3.r3.g1d26683
pkgrel=2
pkgdesc="Desktop application for updating Flipper Zero firmware via PC"
url="https://github.com/flipperdevices/qFlipper"
license=('GPL-3.0-only')
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

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git"
  "libwdi"::"git+https://github.com/pbatard/libwdi"
  "nanopb"::"git+https://github.com/nanopb/nanopb"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc"
  git submodule init
  git config submodule.driver-tool/libwdi.url "$srcdir/libwdi"
  git config submodule.3rdparty/nanopb.url "$srcdir/nanopb"
  git -c protocol.file.allow=always submodule update

  # https://github.com/flipperdevices/qFlipper/pull/233
  git cherry-pick -n 57316893037d119931011d9abd4a05ed158c7a24

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
