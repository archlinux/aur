# Maintainer: Maykel Moya <mmoya at mmoya dot org>

pkgname=asix-ax88179-dkms
_pkgname="${pkgname%-*}"
pkgver=4.2.0
pkgrel=1
pkgdesc='A kernel module for ASIX AX88179B USB network adapters'
url="https://www.asix.com.tw/en/product/USBEthernet/Super-Speed_USB_Ethernet/AX88179B"
license=('GPL-2.0-or-later')
depends=('dkms')
arch=('any')

_archivename="ASIX_USB_NIC_Linux_Driver_Source_v${pkgver}"
source=(
    "${_archivename}.tar.bz2::https://www.asix.com.tw/en/support/download/file/2151"
    'dkms.conf'
    'modprobe.conf'
    '0002-Complete-TX-NAPI-on-early-exit.patch'
)
sha256sums=(
    'dc8d89b1060ac2b0a4829d862f1cb39fbcb9fa5876746f8ff7b187567d237cfc'
    '280c3fd129bb3ac8b763e65dbbe7383ca795a435021f4c978a7f6b03d696b616'
    '652e3715724de0c1893ffbdfc48a66c7c09e82015429f10254869934dea40b55'
    '5ba79ac2d61ea9ece2ecb5c5219b109411d87e86b567b95511213de6571adf5d'
)

package() {
    find . -type f -exec chmod 644 {} +

    patch --binary -p2 -d "${_archivename}" <0002-Complete-TX-NAPI-on-early-exit.patch

    mkdir -p "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
    cp -pr "${_archivename}"/* "${pkgdir}/usr/src/${_pkgname}-${pkgver}"

    install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"
    sed -e "s/@PKGVER@/${pkgver}/" -i "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"

    install -Dm644 "${srcdir}/modprobe.conf" "${pkgdir}/usr/lib/modprobe.d/${_pkgname}.conf"
}
