# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: fill <mailbox@fillo.ru>
# Contributor: Anton Shestakov <engored*ya.ru>

_pkgname=flashrom
pkgname=${_pkgname}-starlabs
pkgver=1.3.0
_commit=fb14ceb302ac06bb07b75de354fc4bc82731f6be
pkgrel=2
provides=(${_pkgname})
conflicts=(${_pkgname})
pkgdesc="Utility for reading, writing, erasing and verifying flash ROM chips (StarLabs version)"
arch=(x86_64)
url='https://github.com/StarLabsLtd/flashrom'
license=(GPL-2.0-or-later)
depends=(
  libftdi
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
source=("${pkgname}::git+${url}.git#commit=${_commit}")
sha256sums=('3143d604c86e683e9a04222b3d2eb428c397210297e386c279be32896be55b5e')

build() {
  export CFLAGS+=' -Wno-error=calloc-transposed-args'
  arch-meson ${pkgname} build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"

  cd ${pkgname}
  sed -i 's#GROUP="plugdev"#TAG+="uaccess"#g' util/flashrom_udev.rules
  install -Dm644 util/flashrom_udev.rules "${pkgdir}"/usr/lib/udev/rules.d/70-flashrom.rules
}
