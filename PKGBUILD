# Maintainer: Alexander Sulfrian <asulfrian@zedat.fu-berlin.de>

_pkgbase=pivccu-modules
pkgname=${_pkgbase}-dkms
pkgver=1.0.39
pkgrel=2
pkgdesc="Kernel modules needed for Homematic"
arch=('x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/alexreinert/piVCCU/"
license=('GPL')
depends=('dkms')
makedepends=('dtc')
conflicts=("${_pkgbase}")
source=("pivccu::git+https://github.com/alexreinert/piVCCU#commit=7a692da961423f496ce65164b271a3ef4dd800b2"
        "dkms.conf"
        "proc_ops.patch")
sha256sums=('SKIP'
            '0440113135ab4b9a2d46859abd2854f831e99da06f9e410c56bef199b7d0a6df'
            'ea2b82dae4cd092fa802528261fc88e0e7610c83a8ead7669bbb28b92ee9c6c4')

prepare() {
    cd "$srcdir/pivccu/"
    patch -p1 < "$srcdir/proc_ops.patch"
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
