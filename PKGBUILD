# Maintainer: Alexander Sulfrian <asulfrian@zedat.fu-berlin.de>

_pkgbase=pivccu-modules
pkgname=${_pkgbase}-dkms
pkgver=1.0.56
pkgrel=1
pkgdesc="Kernel modules needed for Homematic"
arch=('x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/alexreinert/piVCCU/"
license=('GPL')
depends=('dkms')
makedepends=('dtc')
conflicts=("${_pkgbase}")
source=("pivccu::git+https://github.com/alexreinert/piVCCU#commit=735b915a5828aabbee79cfafd0173240d823b90c"
        "dkms.conf"
        "kernel-5-10.patch")
sha256sums=('SKIP'
            '3f821472f7ea0d7e41f7182beb545312da6b03fbade7f00e44f376fdec98580b'
            '344498daef9cdbb2433213c24357ac4f7080e1b086482b01a2898d5e309cfaa0')

prepare() {
    cd pivccu
    patch --forward --strip=1 --input="${srcdir}/kernel-5-10.patch"
}

package() {
    install -Dm644 -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/ \
        pivccu/kernel/* dkms.conf

    # This is in the eq3_char_loop-dkms package
    sed -i '/eq3_char_loop/d' "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/Makefile

    # Set name and version in dkms.conf
    sed -e "s/@_PKGBASE@/${_pkgbase}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}

# vim:set sw=4 sts=4 et:
