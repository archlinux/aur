# Maintainer: Maykel Moya <mmoya at mmoya dot org>

pkgname=asix-ax88179-dkms
_pkgname="${pkgname%-*}"
pkgver=3.3.0
pkgrel=1
pkgdesc='A kernel module for ASIX AX88179B USB network adapters'
url="https://www.asix.com.tw/en/product/USBEthernet/Super-Speed_USB_Ethernet/AX88179B"
license=('GPL2')
depends=('dkms')
arch=('any')

_archivename="asix_usb_nic_linux_driver_v${pkgver}"
source=(
    "${_archivename}.tar.bz2::https://www.asix.com.tw/en/support/download/file/1800"
    'dkms.conf'
    'modprobe.conf'
    '0001-Fix-building-on-6.9.patch'
)
sha256sums=(
    '09c4de9a39631e810d9100904941700ccf7da5fc4702beda0c88fa90ca7fd076'
    '280c3fd129bb3ac8b763e65dbbe7383ca795a435021f4c978a7f6b03d696b616'
    '652e3715724de0c1893ffbdfc48a66c7c09e82015429f10254869934dea40b55'
    '3fbd56b450d850e3bd3b513ded95328e529fd49a43481c2161cea4c9c09922bc'
)

package() {
    find -type f -exec chmod 644 {} +

    mkdir -p "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
    cp -pr "${_archivename}"/* "${pkgdir}/usr/src/${_pkgname}-${pkgver}"

    cp ../????-*.patch "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
    (
        cd "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
        for patchfile in ????-*.patch; do
            patch -p1 <$patchfile
        done
    )

    install -Dm644 ../dkms.conf "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"
    sed -e "s/@PKGVER@/${pkgver}/" -i "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"

    install -Dm644 ../modprobe.conf "${pkgdir}/usr/lib/modprobe.d/${_pkgname}.conf"
}
