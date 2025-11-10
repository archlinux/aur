# Maintainer: taotieren <admin@taotieren.com>

pkgname=sfp-master
pkgver=1.0.7
pkgrel=1
pkgdesc="SFP-module programmer for CH341a devices"
arch=($CARCH)
url="https://github.com/bigbigmdm/SFP-Master"
license=('GPL-3.0-only')
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
  gcc-libs
  glibc
  libusb
  qt6-base
)
makedepends=(
  cmake
  git
  ninja
  qt6-tools
)
optdepends=(
  "ezp-chip-data-editor: QT based editor chip database for EZP2019, EZP2019+, EZP2020, EZP2023, EZP2025, MinPro programmer devices"
  "imsprog: MSProg - software for CH341A-based programmers to work with I2C, SPI and MicroWire EEPROM/Flash chips"
)
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('b2b0ab872c531c71b24f750ba799819b08ec72358fe1c7c13cccd4dc21669b50')

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
