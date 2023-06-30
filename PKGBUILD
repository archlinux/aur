# Maintainer: xx777 <zenmchen at gmail dot com>

_pkgbase=rtl8xxxu
pkgname=rtl8xxxu-dkms-git
pkgver=r22.6289e8f
pkgrel=3
pkgdesc="Driver for Realtek RTL8XXXXU usb wifi chips"
arch=('any')
url="https://github.com/lwfinger/rtl8xxxu"
license=('GPL2')
depends=('dkms' 'linux-firmware>=20230625.ee91452d-1')
makedepends=('git')
source=("git+https://github.com/lwfinger/rtl8xxxu")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}"/${_pkgbase}
    sed -i "/POST_INSTALL/d" dkms.conf
    sed -i "/BUILD_EXCLUSIVE_KERNEL/d" dkms.conf
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
    sed -e "s/git_2042944-1/${pkgver}/" -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
