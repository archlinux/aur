# Maintainer: Charles Villard <charles at villard (dot) it>

# This installs a proprietary NFC daemon for the Dell ControlVault3 Plus. The driver is distributed in binary
# form by its manufacturer and follows their own copyright - please refer to their license at the source
# or the LICENSE file installed by this package. The daemon runs the NFC stack needed to initialize and
# keep the state of the NFC controller of the CV device, enabling the Contactless CCID interface.

pkgname=broadcom-cv3plus-nfc
pkgver=6.4.23
pkgrel=1
pkgdesc="Proprietary NFC daemon for the Dell ControlVault3 Plus"
arch=(x86_64)
url="https://packages.broadcom.com/artifactory/dell-controlvault-drivers/"
license=(custom)
depends=(systemd libusb)
makedepends=()
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}")
options=('!strip')
groups=(fprint)

source=("${url}brcm_linux_nfc_${pkgver}.tgz")
sha256sums=('SKIP')

package() {
  # Install daemon binary
  install -Dm 755 usr/lib/broadcom-nfc/bcmnfcd.bin "$pkgdir/usr/lib/broadcom-nfc/bcmnfcd.bin"

  # Install configuration
  install -Dm 644 usr/lib/broadcom-nfc/bcmnfcd.conf "$pkgdir/usr/lib/broadcom-nfc/bcmnfcd.conf"

  # Install systemd service
  install -Dm 644 etc/systemd/system/broadcom-nfc.service "$pkgdir/etc/systemd/system/broadcom-nfc.service"

  # Install suspend/resume hook (use /usr/lib, /lib is a symlink on Arch)
  install -Dm 755 lib/systemd/system-sleep/bcmnfcd-control.sh "$pkgdir/usr/lib/systemd/system-sleep/bcmnfcd-control.sh"

  # Install licence
  install -Dm 644 LICENSE.broadcom "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
