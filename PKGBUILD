# Maintainer: Maykel Moya <mmoya at mmoya dot org>
pkgname=ax-usb-nic-dkms
_pkgname="${pkgname%-*}"
pkgver=3.2.0
pkgrel=1
arch=('any')
pkgdesc="Kernel module for ASIX USB Ethernet Controller"
url="https://www.asix.com.tw/en/support/download"
license=('GPL2')
depends=('dkms')
_archivename="asix_usb_nic_linux_driver_v${pkgver}"
source=(
    "${_archivename}.tar.bz2::https://www.asix.com.tw/en/support/download/file/1783"
    'ax-usb-nic.modprobe.conf'
    'dkms.conf'
    '0001-Fix-building-on-6.9.patch'
)
sha256sums=(
    '39d3f5d3a3fcc7a641f55514a610bf12f243509f4dbb6bd7ae7101dd30110e82'
    '652e3715724de0c1893ffbdfc48a66c7c09e82015429f10254869934dea40b55'
    '222bfd44b45b317f7dd856dc11c64afd33eb6f5bbe5e1a46851b93a3b53f1751'
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

    install -Dm644 ../ax-usb-nic.modprobe.conf "${pkgdir}/usr/lib/modprobe.d/ax-usb-nic.conf"
}
