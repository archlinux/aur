# Maintainer:  b00rt00s <b00rt00s.aur@gmail.com>
# Contributor: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Shaun Ren <shaun DOT ren (at) linux (dOt) com>
# Contributor: Simon Hanna <simon DOT hanna (at) serve-me (dOt) info>

pkgname=rtl8814au-aircrack-dkms-git
_pkgbase=rtl8814au
pkgver=r90.27d2344
pkgrel=1
pkgdesc="Aircrack-ng kernel module for Realtek (USB adapters only) network cards with 8814au chipset"
url="https://github.com/aircrack-ng/rtl8814au"
license=('GPL')
arch=('x86_64')
makedepends=('git')
depends=('dkms')

replaces=('rtl8814au-dkms-git')
conflicts=('rtl8814au-dkms-git')

source=('rtl8814au::git+https://github.com/aircrack-ng/rtl8814au.git'
        'dkms.conf'
        '5.11.patch')

sha256sums=('SKIP'
            'b48a357efd1fd4365741c7cd5993619f60e518061e61fcb1c438f54b2d08149d'
            '9a4a28d0c33f0bc93aaf13f239821d523a2357968edd8478d03e9e1bd870c506')

pkgver() {
     cd ${srcdir}/${_pkgbase}
     (
        set -o pipefail
         git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
         printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
     )
}

prepare()
{
    patch -Np1 -i 5.11.patch
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
