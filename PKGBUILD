# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Shaun Ren <shaun DOT ren (at) linux (dOt) com>
# Contributor: Simon Hanna <simon DOT hanna (at) serve-me (dOt) info>

pkgname=rtl8812au-aircrack-dkms-git
_pkgbase=rtl8812au
pkgver=r564.87b2f78
pkgrel=1
pkgdesc="Aircrack-ng kernel module for Realtek 8812au network cards with dkms support, with monitor mode and injection support"
url="https://github.com/aircrack-ng/rtl8812au#branch=v5.2.20"
license=('GPL')
arch=('any')
makedepends=('git')
depends=('dkms')
conflicts=('rtl8812au-dkms-git' 'rtl8812au-inject-dkms-git')
source=('git+https://github.com/aircrack-ng/rtl8812au.git'
        'dkms.conf'
		'tarjet.patch')

sha256sums=('SKIP'
            '35dfd4e4f9ce29bac9f512ec9859bbe45d512fb6e98a4e36666e0996e07b06a2'
            'ad4b5b9e8c7131f40f82530c9630c2b27dab1e9fd8df4b22e26f5fd576042252')

pkgver() {
	cd ${srcdir}/${_pkgbase}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd ${srcdir}/${_pkgbase}
	patch -Np1 -i "${srcdir}/tarjet.patch"
}

package() {
	cd ${srcdir}/${_pkgbase}
	mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
	cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
	cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
	
	# Set name and version
	sed -e "s/@_PKGBASE@/${_pkgbase}-dkms/" \
		-e "s/@PKGVER@/${pkgver}/" \
		-i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
