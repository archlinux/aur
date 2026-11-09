# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgname=rtl8188gu-dkms-git
_pkgbase=rtl8188gu
pkgver=r12.9dec829
pkgrel=1
pkgdesc="Linux driver for Realtek RTL8188GU"
url="https://github.com/lwfinger/rtl8188gu"
license=('GPL-1.0-or-later')
arch=('x86_64')
depends=('dkms' 'bc' 'linux-headers')
makedepends=('git')
conflicts=("${_pkgbase}-dkms")
source=("git+https://github.com/lwfinger/rtl8188gu.git" "dkms.conf" "ioctl_cfg80211.patch")
sha256sums=('SKIP'
            '214b8d7ee2968e49be23567d5fa8073cf3da593e71574154e0d41d11b1abd30e'
            '55e490451bb89f49c20583fa2b6e65357f16b1aefccf2ac1497d2031a091e0bc')

pkgver() {
	cd ${srcdir}/${_pkgbase}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd ${srcdir}/${_pkgbase}
    mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
    cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
    cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
    patch -p1 ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/os_dep/linux/ioctl_cfg80211.c < ${srcdir}/ioctl_cfg80211.patch
    
    sed -e "s/@_PKGBASE@/${_pkgbase}-dkms/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i ${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
