# Maintainer: tleydxdy <shironeko(at)waifu(dot)club>

pkgname=system76-power
pkgver=1.1.19
pkgrel=1
pkgdesc="System76 Power Management"
arch=('any')
url="https://github.com/pop-os/system76-power"
license=('GPL')
install="${pkgname}.install"
depends=(
'dbus'
'libusb'
'polkit'
)
optdepends=(
'system76-acpi-dkms: some systems might need this driver'
'system76-dkms: some systems might need this driver'
'system76-io-dkms: some systems might need this driver'
)
makedepends=('rust')
source=(
"https://github.com/pop-os/${pkgname}/archive/${pkgver}.tar.gz"
'use-mkinitcpio.patch'
'makefile.patch'
)
sha256sums=('eb369011f45dd0b8869f032d8b6aad56e290329f312a7ad602adf2a133baa709'
            'a6f45126461f22b47ac9671280e2cf2fbd52e389642d8dd865844bf2b7d43715'
            '61f8a26463527404b55bb7ee5dc18d909ad44bf56ac743ec8b081324c0def1e5')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # use mkinitcpio -P inplace of update-initramfs -u
  patch --no-backup-if-mismatch -Np1 -i "${srcdir}"/use-mkinitcpio.patch
  # fix makefile
  patch --no-backup-if-mismatch -Np1 -i "${srcdir}"/makefile.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make sysconfdir="/usr/lib" DESTDIR="${pkgdir}" install
}
