# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Giorgio Gilestro <giorgio at gilest dot ro>
# Contributor: Richard Mathot <rim at odoo dot com>
_pkgbase=r8152
pkgname=${_pkgbase}-dkms
pkgver=2.21.4.20260427
pkgrel=1
pkgdesc='A kernel module for Realtek RTL8152/RTL8153/RTL8154/RTL8156 Based USB Ethernet Adapters'
url='http://www.realtek.com'
license=('GPL-2.0-only')
arch=('i686' 'x86_64' 'aarch64')
depends=('glibc' 'dkms')
conflicts=("${_pkgbase}")
optdepends=('linux-headers: Build the module for Arch kernel'
            'linux-lts-headers: Build the module for LTS Arch kernel')
source=(
    "${_pkgbase}-${pkgver}.tar.gz::https://github.com/wget/realtek-r8152-linux/archive/v${pkgver}.tar.gz"
    'dkms.conf'
)
sha512sums=('fe46fb2bd1c1e1954d837ff212a9d6632c9756a41350bb687f2898bc60d509752f00442116e834fd354d298f54992a9e38d8388950ee2467735cc99fc855784c'
            '1a89004b40ee4f23c1d6fab7fe14ff5786362248cb16cedb21f144acda05b1c46afa5b38de065fad8fe712fdf65625063a3e312651a2a371cd00c9625d19f2c0')

package() {
    install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

    sed -e "s/@PKGNAME@/${_pkgbase}/g" \
        -e "s/@PKGVER@/${_pkgbase}/g" \
        -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

    cp -dr --no-preserve='ownership' "realtek-${_pkgbase}-linux-${pkgver}" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/src"
    install -D -m644 "realtek-${_pkgbase}-linux-${pkgver}/50-usb-realtek-net.rules" "${pkgdir}/usr/lib/udev/rules.d/50-usb-realtek-net.rules"
}
