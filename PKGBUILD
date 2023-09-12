# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Giorgio Gilestro <giorgio at gilest dot ro>
# Contributor: Richard Mathot <rim at odoo dot com>
_pkgbase=r8152
pkgname=${_pkgbase}-dkms
pkgver=2.17.1.20230903
pkgrel=1
pkgdesc="A kernel module for Realtek RTL8152/RTL8153/RTL8154/RTL8156 Based USB Ethernet Adapters"
url="http://www.realtek.com"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' 'dkms')
conflicts=("${_pkgbase}")
optdepends=('linux-headers: Build the module for Arch kernel'
            'linux-lts-headers: Build the module for LTS Arch kernel')
source=(
    "https://github.com/wget/realtek-r8152-linux/archive/v${pkgver}.tar.gz"
    'dkms.conf'
)
sha512sums=('301ccc3f4b16fee2b4fb1d337ff03d87e98a55c747f7b6ce5e7cbce9088fcfdd0f068481dc0bff767f683d15fd39cd629b5ebb5440aaa5a59452d13897da4f76'
            '04d93f2297be0ffbd9ad8611ee619406af26f8fc987686e7150a68d4e8d9d94d104b76583a3190699587fd568c995e31c96332afa77b880a972eb24861ba5dea')

package() {
    install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

    sed -e "s/@PKGNAME@/${_pkgbase}/g" \
        -e "s/@PKGVER@/${_pkgbase}/g" \
        -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

    cp -dr --no-preserve='ownership' "realtek-${_pkgbase}-linux-${pkgver}" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/src"
    install -D -m644 "realtek-${_pkgbase}-linux-${pkgver}/50-usb-realtek-net.rules" "${pkgdir}/usr/lib/udev/rules.d/50-usb-realtek-net.rules"
}
