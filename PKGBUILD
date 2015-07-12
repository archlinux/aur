# Maintainer: Benjamin ROBIN <dev@benjarobin.fr>

pkgname=mt7630-pcie-wifi-dkms
_gitname=mt7630e
pkgver=22.d9899f0
pkgrel=1
pkgdesc="MT7630e PCIe Wifi (DKMS)"
arch=('i686' 'x86_64')
url="http://www.mediatek.com/en/downloads/mt7630-pcie/"
license=('GPL')
depends=('dkms')
optdepends=('linux-headers: If running standard kernel, otherwise find matching headers for your kernel')
install=MT7630e-wifi.install
source=('mt7630e::git+https://github.com/benjarobin/MT7630E.git#tag=v2.3.3'
        'dkms.conf')
md5sums=('SKIP'
         'ba71b64eac40daed63a3acbf3b8021a3')

pkgver() {
    cd "${_gitname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    cd "${_gitname}"
    
    mkdir -p "${pkgdir}/usr/src/mt7630-pcie-wifi-${pkgver}"
    cp -RL --no-preserve='ownership' rt2x00/* "${pkgdir}/usr/src/mt7630-pcie-wifi-${pkgver}/"
    rm -f "${pkgdir}/usr/src/mt7630-pcie-wifi-${pkgver}"/*.sh
    install -m644 "$srcdir/dkms.conf" "${pkgdir}/usr/src/mt7630-pcie-wifi-${pkgver}/"
    
    install -D -m644 "firmware/Wi-FI/MT7650E234.bin" "$pkgdir/usr/lib/firmware/MT7650E234.bin"
    
    mkdir -p "$pkgdir/usr/lib/modules-load.d/"
    echo mt7630e > "$pkgdir/usr/lib/modules-load.d/mt7630.conf"
}
