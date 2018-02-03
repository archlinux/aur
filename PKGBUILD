# Maintainer: Michael Niewöhner <foss@mniewoehner.de>

basename=thinkpad-wmi
pkgname=thinkpad_wmi-dkms
pkgver=r12.aa470c9
pkgrel=1
pkgdesc="DKMS controlled modules for ThinkPad's WMI Bios Settings functionality"
arch=('x86_64')
url="https://github.com/c0d3z3r0/thinkpad-wmi"
license=('GPL')
makedepends=('git')
depends=('dkms')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("git+https://github.com/c0d3z3r0/thinkpad-wmi.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${basename}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    dkmsdir="${pkgdir}/usr/src/${basename}-${pkgver}"
    install -d "${dkmsdir}"
    cp -a "${srcdir}/${basename}"/drivers/platform/x86/{thinkpad-wmi.c,Makefile} ${dkmsdir}
    cp "${srcdir}/${basename}"/debian/dkms.conf.in ${dkmsdir}/dkms.conf
    sed -E 's/^(PACKAGE_VERSION=).*/\1'${pkgver}'/g' -i ${dkmsdir}/dkms.conf
    sed '/BUILT_MODULE_LOCATION/d' -i ${dkmsdir}/dkms.conf
}
