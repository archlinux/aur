# Maintainer: Giovanni Scafora <scafora.giovanni@gmail.com>

pkgname=sfp-master-git
_pkgname=SFP-Master
pkgver=1.0.7.r5.gcb5c158
pkgrel=1
pkgdesc="SFP-module programmer for CH341a devices"
arch=('x86_64')
url="https://github.com/bigbigmdm/SFP-Master"
license=('GPL-3.0-only')
depends=('qt6-base' 'libusb')
makedepends=('cmake' 'git' 'ninja')
optdepends=(
  'ezp-chip-data-editor: QT based editor chip database for EZP2019, EZP2019+, EZP2020, EZP2023, EZP2025, MinPro programmer devices'
  'imsprog: MSProg - software for CH341A-based programmers to work with I2C, SPI and MicroWire EEPROM/Flash chips'
)
source=("git+https://github.com/bigbigmdm/SFP-Master.git")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/${_pkgname}"
  (
    set -o pipefail
    git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd "${srcdir}/${_pkgname}"
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
  install -Dm0644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  DESTDIR="${pkgdir}" ninja -C "${srcdir}/${_pkgname}/build" install
}
