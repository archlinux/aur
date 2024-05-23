# Maintainer: zebulon <zeb (at)zebulon(dot)org(dot)uk>
# Contributor: NovaMoon <novamoon1 (at)gmail(dot)com>
# Contributor: Erikas Rudinskas <erikmnkl (at)gmail(dot)com>
# Contributor: Marcel Unbehaun <f.rostze.ux at gmail dot com>

pkgname=rtl8814au-dkms-git
_pkgbase=rtl8814au
pkgver=5.8.5.1.r182.g8105736
pkgrel=1
pkgdesc="RTL8814AU and RTL8813AU chipset driver with firmware v5.8.5.1"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/morrownr/8814au"
license=('GPL2')
depends=('dkms' 'bc')
makedepends=('git')
conflicts=("${_pkgbase}")
source=("git+https://github.com/morrownr/8814au.git"
        'dkms.conf'
        'arm.patch')
sha256sums=('SKIP'
	    'f01d80e7925aac5b5282cf7a89683967d44d19f11c50de9c745316326e5c6adb'
	    '2911f6c1285277d0507b2ad7a09c20edd682476be67502db63f63663cac97efb')

pkgver() {
    cd ${srcdir}/8814au
    printf '%s.r%s.g%s' '5.8.5.1' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
		if [ "$CARCH" = "arm" ] || [ "$CARCH" = "armv6h" ] || [ "$CARCH" = "armv7h" ] || [ "$CARCH" = "aarch64" ]; then
			msg2 "Applying patch for ARM architecture..."
			patch ${srcdir}/rtl8814au/Makefile -i ${srcdir}/arm.patch
		fi
		cd ${srcdir}/8814au
        mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        # Set name and version
        sed -e "s/@_PKGBASE@/${_pkgbase}-dkms/" \
                        -e "s/@PKGVER@/${pkgver}/" \
                        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
