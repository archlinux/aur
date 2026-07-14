# Maintainer: taotieren <admin@taotieren.com>

pkgname=imsprog-git
pkgver=1.8.5.r75.g13fbc23
pkgrel=1
pkgdesc="I2C, MicroWire and SPI EEPROM/Flash chip Programmer - is a program to read, write EEPROM chips use the CH341A programmer device and CH347T programmer device"
arch=($CARCH)
url="https://github.com/bigbigmdm/IMSProg"
license=('GPL-3.0-or-later')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
_qt=qt6
depends=(
  libgcc
  libstdc++
  libusb
  $_qt-base
)
makedepends=(
  cmake
  git
  ninja
  $_qt-tools
)
optdepends=(
  "ezp-chip-data-editor: QT based editor chip database for EZP2019, EZP2019+, EZP2020, EZP2023, EZP2025, MinPro programmer devices"
  "sfp-master: SFP-module programmer for CH341a devices"
)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  (
    set -o pipefail
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
  cd "${srcdir}/${pkgname}"
  # see：https://wiki.archlinux.org/title/CMake_package_guidelines
  cmake -S . \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -B build \
    -G Ninja \
    -Wno-dev

  ninja -C build
}

package() {
  install -Dm0644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  DESTDIR="${pkgdir}" ninja -C "${srcdir}/${pkgname}/build" install
}
