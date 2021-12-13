# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Shaun Ren <shaun DOT ren (at) linux (dOt) com>
# Contributor: Simon Hanna <simon DOT hanna (at) serve-me (dOt) info>

pkgname=rtl88xxau-aircrack-dkms-git
_pkgbase=rtl88xxau
pkgver=r1174.3a6402e
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
            '1ac36b3713d6b719b8c5f820653bbe30ead8323165d52e6ad95d56da627fde88')

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
    cd "${srcdir}/${_pkgbase}"
    mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
    cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
    cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}

    # Set name and version
    sed -e "s/@_PKGBASE@/${_pkgbase}-dkms/" \
            -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
