# Maintainer: Benjamin ROBIN <dev@benjarobin.fr>

pkgname=mt7630-pcie-wifi-dkms
pkgver=20140625
pkgrel=5
pkgdesc="MT7630e PCIe Wifi (DKMS)"
arch=('i686' 'x86_64')
url="http://www.mediatek.com/en/downloads/mt7630-pcie/"
license=('GPL')
depends=('dkms')
optdepends=('linux-headers: If running standard kernel, otherwise find matching headers for your kernel')
install=MT7630e-wifi.install
source=('http://www.mediatek.com/AmazonS3/Downloads/linux/MT7630E_Wi-Fi_BT_Source_V3.14_20140625_v2.tar.gz'
        'dkms.conf'
        'MT7630E-3.15.patch'
        'MT7630E-4.0.patch')
md5sums=('d8583926d6c8ba8c3a1a8dd0b44a066e'
         'aa288cf135a28dcb2bc90e8f80ea4f97'
         '561dc16b3df8f48aa15c2ce1ce1e6d3b'
         '2997d0c6492e62f25050e92b3643d853')

prepare() {
    cd "$srcdir/MT7630E_Wi-Fi_BT_Source_V3.14_20140625_v2"
    patch -p1 -i "$srcdir/MT7630E-3.15.patch"
    patch -p1 -i "$srcdir/MT7630E-4.0.patch"
}

package() {
    cd "$srcdir/MT7630E_Wi-Fi_BT_Source_V3.14_20140625_v2"
    
    mkdir -p "${pkgdir}/usr/src/mt7630-pcie-wifi-${pkgver}"
    cp -RL --no-preserve='ownership' rt2x00/* "${pkgdir}/usr/src/mt7630-pcie-wifi-${pkgver}/"
    rm "${pkgdir}/usr/src/mt7630-pcie-wifi-${pkgver}"/*.sh
    install -m644 "$srcdir/dkms.conf" "${pkgdir}/usr/src/mt7630-pcie-wifi-${pkgver}/"
    
    install -D -m644 "firmware/Wi-FI/MT7650E234.bin" "$pkgdir/usr/lib/firmware/MT7650E234.bin"

    cd "${pkgdir}/usr/src/mt7630-pcie-wifi-${pkgver}/"
    echo '#!/bin/sh' > rm-orig-module.sh
    echo 'rm -f /usr/lib/modules/*/kernel/drivers/net/wireless/rt2x00/*' >> rm-orig-module.sh
    chmod +x rm-orig-module.sh
}
