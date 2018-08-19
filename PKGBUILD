# Maintainer: zebulon <zeb (at)zebulon(dot)org(dot)uk>
# Contributor: NovaMoon <novamoon1 (at)gmail(dot)com>
# Contributor: Erikas Rudinskas <erikmnkl (at)gmail(dot)com>

pkgname=rtl8814au-dkms-git
_pkgbase=rtl8814au
pkgver=4.3.21.r34.ga0c4479
pkgrel=2
pkgdesc="RTL8814AU and RTL8813AU chipset driver with firmware v4.3.21"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/zebulon2/rtl8814au"
license=('GPL2')
depends=('dkms' 'bc')
makedepends=('git')
conflicts=("${_pkgbase}")
source=("git+https://github.com/zebulon2/rtl8814au.git"
        'dkms.conf'
        'arm.patch')
sha256sums=('SKIP'
	    '36203d04d3ff9e4f117389a24257f608570c418bf4b93fba1b4efd41eb36229a'
	    '2911f6c1285277d0507b2ad7a09c20edd682476be67502db63f63663cac97efb')

pkgver() {
    cd ${srcdir}/rtl8814au
    printf '%s.r%s.g%s' '4.3.21' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
		if [ "$CARCH" = "arm" ] || [ "$CARCH" = "armv6h" ] || [ "$CARCH" = "armv7h" ] || [ "$CARCH" = "aarch64" ]; then
			msg2 "Applying patch for ARM architecture..."
			patch ${srcdir}/rtl8814au/Makefile -i ${srcdir}/arm.patch
		fi
		cd ${srcdir}/rtl8814au
        mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        # Set name and version
        sed -e "s/@_PKGBASE@/${_pkgbase}-dkms/" \
                        -e "s/@PKGVER@/${pkgver}/" \
                        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
