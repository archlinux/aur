# Maintainer: hockinglee <hockinglee@gmail.com>
# Based on the Arch Linux flashrom package by Bruno Pagani <archange@archlinux.org> et al.

_pkgname=flashrom
pkgname=flashrom-minproi
pkgver=1.8.0
pkgrel=3
pkgdesc="Utility for reading, writing, erasing and verifying flash ROM chips, with Mini-Pro-I (MinproI, 1fc8:300b) programmer support, --ignore-size and --read-size"
arch=(x86_64)
url="https://review.coreboot.org/c/flashrom/+/97442"
license=(GPL-2.0-or-later)
depends=(
  libcrypto.so
  libftdi
  libjaylink
  libusb
  pciutils
)
makedepends=(
  cmocka
  git
  meson
  python-sphinx
)
optdepends=('dmidecode: for SMBIOS/DMI table decoder support')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=(
  "git+https://github.com/flashrom/flashrom.git#tag=v${pkgver}"
  "mproi_spi-v${pkgver}.patch"
  "partial-size-v${pkgver}.patch"
)
sha256sums=('c370c329b6cec5e84320c40931fa6200cd72f4e16b6bb2a83e57dcbeb7bd0f54'
            '8b4e0dcc80d9cd240d0f0f17556d0cbfd5e61f0ac0170c6f0e7f88f0bf28ab94'
            '5a887aa640dcf40de551afbc9bfed36a1c91dfe4db6adc5b1f5269074ce60117')

prepare() {
  cd ${_pkgname}
  # Mini-Pro-I driver, submitted upstream as https://review.coreboot.org/c/flashrom/+/97442
  git apply "${srcdir}/mproi_spi-v${pkgver}.patch"
  # --ignore-size (-w/-v of images smaller than the flash) and --read-size (-r of a prefix)
  git apply "${srcdir}/partial-size-v${pkgver}.patch"
  # udev rule for the Mini-Pro-I programmer
  sed -i '/^# Olimex ARM-USB-OCD$/i # Mini-Pro-I (MinproI)\nATTRS{idVendor}=="1fc8", ATTRS{idProduct}=="300b", MODE="664", GROUP="plugdev"\n' \
    util/flashrom_udev.rules
  sed -i 's#GROUP="plugdev"#TAG+="uaccess"#g' util/flashrom_udev.rules
}

build() {
  arch-meson ${_pkgname} build
  meson compile -C build
}

# FYI, tests are incompatible with LTO enabled
# check() {
#   meson test -C build --print-errorlogs
# }

package() {
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 ${_pkgname}/util/flashrom_udev.rules "${pkgdir}"/usr/lib/udev/rules.d/70-flashrom.rules
}
