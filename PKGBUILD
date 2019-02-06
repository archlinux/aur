# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=rtl8812au-aircrack-ng-dkms-git
_pkgbase=rtl8812au
pkgver=5.2.20.2.r564.g87b2f78
pkgrel=1
pkgdesc="rtl8812AU chipset driver maitained by aircrack-ng"
arch=('i686' 'x86_64')
url="https://github.com/aircrack-ng/rtl8812au/"
license=('GPL2')
depends=('dkms' 'bc' 'libelf')
makedepends=('git')
optdepends=('linux-headers: build modules against the Arch kernel'
            'linux-lts-headers: build modules against the LTS kernel'
            'linux-zen-headers: build modules against the ZEN kernel'
            'linux-hardened-headers: build modules against the HARDENED kernel')
conflicts=("${_pkgbase}")
source=("git+https://github.com/aircrack-ng/rtl8812au.git#branch=v5.2.20"
        "dkms.conf")
sha256sums=('SKIP'
            '7f2d6df66d1d68baac01e4b1867aa6bc4f6d3cb19bdaa1d43ad58a4243049dcd')

pkgver() {
    cd ${srcdir}/${_pkgbase}
    printf '%s.r%s.g%s' '5.2.20.2' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
        sed -e "s/88XXau/8812au/" \
            -e "s/88XXae/8812ae/" \
            -e "s/88XXas/8812as/" \
            -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/Makefile
}
