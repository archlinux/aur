# Maintainer: tleydxdy <shironeko(at)waifu(dot)club>

pkgname=system76-power
pkgver=1.2.3
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
provides=('power-profiles-daemon')
optdepends=(
'system76-acpi-dkms: some systems might need this driver'
'system76-dkms: some systems might need this driver'
'system76-io-dkms: some systems might need this driver'
)
makedepends=('rust')
source=(
"https://github.com/pop-os/${pkgname}/archive/${pkgver}.tar.gz"
'use-mkinitcpio.patch'
)
sha256sums=('bf1e31a9cb77661dd9bd594bd469327b65aab96c4e07b66da1e5cc77fc7219b3'
            'bae03d96faea0f7ea80cb1cc5d4f2f97804509db378aaacb3e1d08cd38e05765')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # use mkinitcpio -P inplace of update-initramfs -u
  patch --no-backup-if-mismatch -Np1 -i "${srcdir}"/use-mkinitcpio.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  CFLAGS+=" -ffat-lto-objects"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make sysconfdir="/usr/lib" DESTDIR="${pkgdir}" install
}
