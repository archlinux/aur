# Maintainer: Network_Jack <Network_Jack@null.net>

pkgname=nrf5x-sniffer
_pkgname='nRF-Sniffer-for-802.15.4'
pkgver=0.8.0
pkgrel=1
pkgdesc="nRF-based 802.15.4 sniffer (firmware and Wireshark plugin)"
arch=('any')
url="https://github.com/NordicSemiconductor/nRF-Sniffer-for-802.15.4"
license=('Custom')
depends=('wireshark-cli' 'python' 'python-pyserial')
optdepends=('nrf5x-command-line-tools: for flashing firmware on nRF52840-DK (PCA10056)'
	    'nrfconnect-appimage: for flashing the firmware on nRF52840-Dongle (PCA10059)')
makedepends=(python-build python-installer python-wheel)
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/NordicSemiconductor/nRF-Sniffer-for-802.15.4/archive/v${pkgver}.tar.gz")
sha256sums=('9c6d055826e4234caa04f71814feff591b617d58ba72d2279696ccd331b0f6df')


build() {
    cd ${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {

    # make python package
    cd ${_pkgname}-${pkgver}
    python -m installer --destdir="${pkgdir}" dist/*.whl
    
    # Install firmware
    local firmware="nrf802154_sniffer_nrf52840dk.hex nrf802154_sniffer_nrf52840dongle.hex nrf802154_sniffer_nrf5340dk.hex"
    cd nrf802154_sniffer
    for file in ${firmware};do
      install -Dm644 ${file} "${pkgdir}/usr/share/${pkgname}/firmware/${file}"
    done
    
    #Install wireshark plugin
    install -Dm755 nrf802154_sniffer.py "${pkgdir}/usr/lib/wireshark/extcap/nrf802154_sniffer.py"
}

#package() {
#  cd "${_pkgname}-${pkgver}"
#  # Install license and readme
#  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/nrf5x-sniffer/LICENSE"
#  install -Dm644 README.md "${pkgdir}/usr/share/${pkgname}/nrf5x-sniffer/README.md"
#
#  cd nrf802154_sniffer
#  # Wireshark files
#  install -Dm755 nrf802154_sniffer.py "${pkgdir}/usr/lib/wireshark/extcap/nrf802154_sniffer.py"
#  install -Dm755 nrf802154_sniffer.lua "${pkgdir}/usr/lib/wireshark/plugins/nrf802154_sniffer.lua"
#  # Firmware and instructions
#  install -Dm644 nrf802154_sniffer_dongle.hex "${pkgdir}/usr/share/${pkgname}/firmware/nrf802154_sniffer_dongle.hex"
#  install -Dm644 nrf802154_sniffer.hex "${pkgdir}/usr/share/${pkgname}/firmware/nrf802154_sniffer.hex"
#}

