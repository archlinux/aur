# Maintainer: Skallwar <estblcsk(at)gmail(dot)com>

pkgname=rtl8821cu-dkms-git
_pkgbase=rtl8821cu
pkgver=5.4.1118f1bc7e8
pkgrel=1
pkgdesc="rtl8821cu chipset driver"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/brektrou/rtl8821CU"
license=('GPL2')
depends=('dkms')
makedepends=('git' 'bc')
conflicts=("${_pkgbase}")
source=("git+https://github.com/brektrou/rtl8821CU"
        'dkms.conf')
sha256sums=('SKIP'
	    '6863d28cbb525eab0be7b5244a5b924302516142a1925fc6521ce49a2800b03d')

prepare() {
    if [ $CARCH = "armv7h" ]; then
        cp /lib/modules/$(uname -r)/build/arch/arm/Makefile \
            /lib/modules/$(uname -r)/build/arch/arm/Makefile.$(date +%Y%m%d%H%M)
        sed -i 's/-msoft-float//' \
            /lib/modules/$(uname -r)/build/arch/arm/Makefile
        ln -s /lib/modules/$(uname -r)/build/arch/arm \
            /lib/modules/$(uname -r)/build/arch/armv7l
    elif [ $CARCH = "aarch64" ]; then
        cp /lib/modules/$(uname -r)/build/arch/arm64/Makefile \
            /lib/modules/$(uname -r)/build/arch/arm64/Makefile.$(date +%Y%m%d%H%M)
        sed -i 's/-mgeneral-regs-only//' \
            /lib/modules/$(uname -r)/build/arch/arm64/Makefile
    fi
}

pkgver() {
    cd ${srcdir}/rtl8821CU
    printf '%s' '5.4.1' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd ${srcdir}/rtl8821CU
        mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        # Set name and version
        sed -e "s/@_PKGBASE@/${_pkgbase}-dkms/" \
                        -e "s/@PKGVER@/${pkgver}/" \
                        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
