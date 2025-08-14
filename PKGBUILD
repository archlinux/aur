# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Giorgio Gilestro <giorgio at gilest dot ro>
# Contributor: Richard Mathot <rim at odoo dot com>
_pkgbase=r8152
pkgname=${_pkgbase}-dkms
pkgver=2.20.1.20250814
pkgrel=1
pkgdesc="A kernel module for Realtek RTL8152/RTL8153/RTL8154/RTL8156 Based USB Ethernet Adapters"
url="http://www.realtek.com"
license=('GPL-2.0-only')
arch=('i686' 'x86_64')
depends=('glibc' 'dkms')
conflicts=("${_pkgbase}")
optdepends=('linux-headers: Build the module for Arch kernel'
            'linux-lts-headers: Build the module for LTS Arch kernel')
source=(
    "https://github.com/wget/realtek-r8152-linux/archive/v${pkgver}.tar.gz"
    'dkms.conf'
)
sha512sums=('a5ed2c6eb2eed553f5bb18095447f3c563c4d09c6307664392a6c41786429c012a88b86b66c08a3c904a787df48794e384b2b28faf0038d21552df293b41eef8'
            '1a89004b40ee4f23c1d6fab7fe14ff5786362248cb16cedb21f144acda05b1c46afa5b38de065fad8fe712fdf65625063a3e312651a2a371cd00c9625d19f2c0')

package() {
    install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

    sed -e "s/@PKGNAME@/${_pkgbase}/g" \
        -e "s/@PKGVER@/${_pkgbase}/g" \
        -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

    cp -dr --no-preserve='ownership' "realtek-${_pkgbase}-linux-${pkgver}" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/src"
    install -D -m644 "realtek-${_pkgbase}-linux-${pkgver}/50-usb-realtek-net.rules" "${pkgdir}/usr/lib/udev/rules.d/50-usb-realtek-net.rules"
}
