# Maintainer: xx777 <zenmchen at gmail dot com>

_pkgbase=rtl8xxxu
pkgname=rtl8xxxu-dkms-git
pkgver=r27.972686d
pkgrel=1
pkgdesc="Driver for Realtek 802.11n USB wireless chips"
arch=('any')
url="https://github.com/a5a5aa555oo/rtl8xxxu"
license=('GPL2')
depends=('dkms' 'linux-firmware>=20230625.ee91452d-1')
makedepends=('git')
source=("git+https://github.com/a5a5aa555oo/rtl8xxxu")
sha256sums=('SKIP')
optdepends=('usb_modeswitch: For RTL8188GU/RTL8192FU users, use this tool to switch the adapter to wifi mode if needed.')

prepare() {
    cd "${srcdir}"/${_pkgbase}
    sed -e "/POST_INSTALL/d" -e "/PACKAGE_VERSION/d" -i dkms.conf
    printf "PACKAGE_VERSION=\"@PKGVER@\"\n" >> dkms.conf
    echo "blacklist rtl8xxxu" > blacklist-rtl8xxxu.conf
    echo "options rtl8xxxu_git ht40_2g=1" > rtl8xxxu_git.conf
}

pkgver() {
    cd "${srcdir}"/${_pkgbase}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "${srcdir}"/${_pkgbase}
    install -Dm 644 -t "${pkgdir}"/etc/modprobe.d blacklist-rtl8xxxu.conf rtl8xxxu_git.conf
    install -Dm 644 -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver} *.c *.h Makefile dkms.conf
    sed -e "s/@PKGVER@/${pkgver}/" -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
