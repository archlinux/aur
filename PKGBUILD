# Maintainer: CloverGit <clovergit@hotmail.com>

pkgname=peak-linux-driver-dkms
_pkgname=peak-linux-driver
pkgver=9.2.0
pkgrel=1
pkgdesc='Linux driver for PEAK-System CAN adapters'
arch=('any')
url='https://www.peak-system.com/fileadmin/media/linux/index.php'
license=('GPL-2.0-only' 'LGPL-2.1-only')
depends=('dkms')
provides=('peak-linux-driver')
conflicts=('peak-linux-driver')
install="${pkgname}.install"
source=(
  "https://www.peak-system.com/fileadmin/media/linux/files/${_pkgname}-${pkgver}.tar.gz"
  'dkms.conf'
)
sha256sums=('adc7e9d2459848d506b7d948fc52b1afe73db476f58537492c94f70a960a7a9a'
            'a277e6202f8ba761b3d0a1e1c5d4de0f5306a45fa14689aa1473e814e09ce36e')

package() {
  cd "${_pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  cp -r driver "${pkgdir}/usr/src/${_pkgname}-${pkgver}/"

  # copy dkms.conf
  install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"

  # set name and version and dkms.conf
  sed -e "s/@PKGNAME@/${_pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"

  install -Dm644 "driver/udev/45-pcan.rules" "${pkgdir}/usr/lib/udev/rules.d/45-pcan.rules"
  install -Dm644 "driver/udev/blacklist-peak.conf" "${pkgdir}/usr/lib/modprobe.d/blacklist-peak.conf"
  install -Dm755 "driver/lspcan" "${pkgdir}/usr/bin/lspcan"
  install -Dm644 "driver/pcan.conf" "${pkgdir}/usr/share/doc/${pkgname}/pcan.conf"
  install -Dm644 "driver/release_notes.txt" "${pkgdir}/usr/share/doc/${pkgname}/release_notes.txt"
}

# vim: set sw=2 ts=2 et:
