# Maintainer: mikl_ls  <mikl_ls at protonmail dot com>
# Maintainer: Skallwar <estblcsk(at)gmail(dot)com>

pkgname=rtl8821cu-morrownr-dkms-git
_pkgbase=rtl8821cu
_pkgver="5.12.0.4"
pkgver=5.12.0.4.120.7d16a68
repoversion="20210916"
pkgrel=1
pkgdesc="rtl8821cu chipset driver (morrownr fork)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/morrownr/8821cu-${repoversion}"
license=('GPL2')
depends=('dkms')
makedepends=('git' 'bc')
conflicts=("${_pkgbase}-git" "${_pkgbase}-dkms-git")
source=("git+https://github.com/morrownr/8821cu-${repoversion}"
        'dkms.conf')
sha256sums=('SKIP'
	    'a0552ddb8658b5416ae373db569f7fef9a111c9b995a85071bd89fd4cf8c804f')

prepare() {
    if [ $CARCH = "armv7h" ]; then
	sed -i 's/CONFIG_PLATFORM_I386_PC = y/CONFIG_PLATFORM_I386_PC = n/g' ${srcdir}/8821cu-${repoversion}/Makefile
	sed -i 's/CONFIG_PLATFORM_ARM_RPI = n/CONFIG_PLATFORM_ARM_RPI = y/g' ${srcdir}/8821cu-${repoversion}/Makefile
       
    elif [ $CARCH = "aarch64" ]; then
	sed -i 's/CONFIG_PLATFORM_I386_PC = y/CONFIG_PLATFORM_I386_PC = n/g' ${srcdir}/8821cu-${repoversion}/Makefile
	sed -i 's/CONFIG_PLATFORM_ARM_RPI = y/CONFIG_PLATFORM_ARM_RPI = n/g' ${srcdir}/8821cu-${repoversion}/Makefile
	sed -i 's/CONFIG_PLATFORM_ARM64_RPI = n/CONFIG_PLATFORM_ARM64_RPI = y/g' ${srcdir}/8821cu-${repoversion}/Makefile
   fi
}

pkgver() {
    cd ${srcdir}/8821cu-${repoversion}
    printf "%s" ${_pkgver} "." "$(git rev-list --count HEAD)" "." "$(git rev-parse --short HEAD)"

}

package() {
    	cd ${srcdir}/8821cu-${repoversion}
        mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        mkdir -p ${pkgdir}/etc/modprobe.d
        cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
	cp ${srcdir}/8821cu-${repoversion}/8821cu.conf ${pkgdir}/etc/modprobe.d/8821cu.conf 
        cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        # Set name and version
        sed -e "s/@PKGBASE@/${_pkgbase}-dkms/" \
                        -e "s/@PKGVER@/${pkgver}/" \
                        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
