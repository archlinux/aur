# Maintainer: xx777 <zenmchen at gmail dot com>

_pkgbase=rtl8xxxu
pkgname=rtl8xxxu-dkms-git
pkgver=r18.bfb6595
pkgrel=1
pkgdesc="Driver for Realtek RTL8XXXXU wifi chips"
arch=('any')
url="https://github.com/a5a5aa555oo/rtl8xxxu"
license=('GPL2' 'custom')
depends=('dkms' 'linux-firmware>=20230404.2e92a49f-1')
makedepends=('git')
source=("git+https://github.com/a5a5aa555oo/rtl8xxxu.git")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}"/${_pkgbase}
    sed -i "/POST_INSTALL/d" dkms.conf
    echo "blacklist rtl8xxxu" > blacklist-rtl8xxxu.conf
}

pkgver() {
    cd "${srcdir}"/${_pkgbase}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "${srcdir}"/${_pkgbase}
    install -Dm 644 firmware/rtl8192fufw.bin "${pkgdir}"/usr/lib/firmware/rtlwifi/rtl8192fufw.bin
    install -Dm 644 firmware/LICENCE.rtlwifi_firmware.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
    install -Dm 644 blacklist-rtl8xxxu.conf "${pkgdir}"/etc/modprobe.d/blacklist-rtl8xxxu.conf
    install -Dm 644 -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver} *.c *.h Makefile dkms.conf
    sed -e "s/git_c8bc376-1/${pkgver}/" -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
