# Maintainer: Szabolcs Sipos <archur [at] balfug [dot] com>
# based on nrf5x-sniffer by GI_Jack

pkgname=nrf-sniffer-ble
pkgdesc="nRF Sniffer for Bluetooth LE - firmware, SnifferAPI and Wireshark plugin"
pkgver=4.1.1
pkgrel=1
arch=('any')
url="https://www.nordicsemi.com/Products/Development-tools/nRF-Sniffer-for-Bluetooth-LE"
depends=('python' 'python-pyserial' 'wireshark-cli' )
optdepends=('nrf5x-command-line-tools: for flashing the firmware'
            'nrfconnect-appimage: for flashing the firmware'
            'nrf-udev'
)
install="${pkgname}.install"
license=(custom)
options=(!strip)
source=("https://www.nordicsemi.com/-/media/Software-and-other-downloads/Desktop-software/nRF-Sniffer/sw/nrf_sniffer_for_bluetooth_le_${pkgver}.zip"
        'nrf_sniffer_ble.sh'
)
sha256sums=('26502447742346cd0b0c597564b12a621859ffd4ad05c029069c4fa22deddd40'
            'SKIP'
)

package() {
  cd "${srcdir}"

  # License and release notes
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 release_notes.txt -t "${pkgdir}/usr/share/${pkgname}/"

  # Firmware
  install -Dm644 hex/* -t "${pkgdir}/usr/share/${pkgname}/firmware"

  # extcap and SnifferAPI
  install -Dm655 extcap/nrf_sniffer_ble.py -t "${pkgdir}/usr/lib/${pkgname}/extcap/"
  mkdir -p "${pkgdir}/usr/lib/${pkgname}/pymodule"
  cp -r extcap/SnifferAPI "${pkgdir}/usr/lib/${pkgname}/pymodule"

  # Wireshark plugin
  install -Dm755 nrf_sniffer_ble.sh -t "${pkgdir}/usr/lib/wireshark/extcap/"
}
