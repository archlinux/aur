# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgname=rtl88x2ce-dkms-git
_pkgbase=rtl88x2ce
pkgver=r56.477ecdf
pkgrel=1
pkgdesc="Realtek RTL8822CE WLAN GNU/Linux Driver"
arch=('i686' 'x86_64')
license=('GPL-2.0-only')
url="https://github.com/juanro49/rtl88x2ce-dkms"
depends=('dkms' 'bc' 'linux-headers')
makedepends=('git')
conflicts=("${_pkgbase}-dkms")
source=("git+https://github.com/juanro49/rtl88x2ce-dkms.git" "patch.diff")
sha256sums=('SKIP'
            '8a172254daa0e4ec098a275b862b0a74878ae52a82ea892b6adc65d9a2b51efd')

pkgver() {
    cd ${srcdir}/${_pkgbase}-dkms
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${srcdir}/${_pkgbase}-dkms
    patch --forward -Np1 -i ${srcdir}/patch.diff
    find os_dep/linux -maxdepth 1 -name ".rtw_proc.o.d" -delete
}

package() {
    cd ${srcdir}/${_pkgbase}-dkms
    mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
    cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}

    # Set name and version
    sed -e "s/^PACKAGE_NAME=.*/PACKAGE_NAME=\"${_pkgbase}\"/" \
        -e "s/^PACKAGE_VERSION=.*/PACKAGE_VERSION=\"${pkgver}\"/" \
        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
