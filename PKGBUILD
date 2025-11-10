# Maintainer: taotieren <admin@taotieren.com>

pkgname=ezp-chip-data-editor-git
pkgver=r50.5af9e51
pkgrel=1
pkgdesc="QT based editor chip database for EZP2019, EZP2019+, EZP2020, EZP2023, EZP2025, MinPro programmer devices"
arch=($CARCH)
url="https://github.com/bigbigmdm/EZP2019-EZP2025_chip_data_editor"
license=('GPL-3.0-only')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(
  gcc-libs
  glibc
  qt5-base
)
makedepends=(
  cmake
  git
  ninja
  qt5-tools
)
optdepends=(
  "imsprog: MSProg - software for CH341A-based programmers to work with I2C, SPI and MicroWire EEPROM/Flash chips"
  "sfp-master: SFP-module programmer for CH341a devices"
)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  (
    set -o pipefail
    git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
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
