# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Shaun Ren <shaun DOT ren (at) linux (dOt) com>
# Contributor: Simon Hanna <simon DOT hanna (at) serve-me (dOt) info>

pkgname=rtl88xxau-aircrack-dkms-git
_pkgbase=rtl88xxau
pkgver=r1123.e9fbf5c
pkgrel=1
pkgdesc="Aircrack-ng kernel module for Realtek 88XXau (USB adapters only) network cards (8811au, 8812au and 8821au chipsets) with monitor mode and injection support"
url="https://github.com/aircrack-ng/rtl8812au"
license=('GPL')
arch=('x86_64')
makedepends=('git')
depends=('dkms')
conflicts=('rtl8812au-aircrack-dkms-git' 'rtl8812au-dkms-git' 'rtl8821au-dkms-git' 'rtl8814au-dkms-git' 'rtl8812au-inject-dkms-git')

source=('rtl88xxau::git+https://github.com/aircrack-ng/rtl8812au.git#branch=v5.6.4.2'
        'dkms.conf')

sha256sums=('SKIP'
            'a1096f5141292aaf26e7556a170e8c9de86c4b6bb3fd3df48ee01996a223e56f')

pkgver() {
  cd ${srcdir}/${_pkgbase}
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
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
