# Author: Ido Rosen <ido@kernel.org>
# Contributor: Florian Knodt <arch@adlerweb.info>
# Maintainer: form

pkgname="tn40xx"
pkgdesc="Tehuti Networks NIC driver for MV88X3110, MV88E2010, QT2025, TLK10232 and AQR105 10-GbE-NICs"
pkgver="0.3.6.17"
pkgrel=2
arch=("x86_64")
url="http://www.tehutinetworks.net/"
license=("GPL2")
depends=("linux>=2.6.32")
makedepends=("linux-headers>=2.6.32")
source=("http://www.tehutinetworks.net/images/UL240756/${pkgname}-${pkgver}.tgz"
	"tn40xx.install")
install=tn40xx.install
sha512sums=("21d9eea582edb018b6a1a066cdb7018e89d1b6fba087615792f47fb6412fc2c7d89a489e4de6fcf56a85804d22275867d973c57fdc1b07e37bb526ce67ecbdda"
	    "6647c472c0731fd079faf51e75e8b2b21fbc5b0cb98b019e7fda41c65d2cfc143539a69129ca8469e33ab9d3eb30b61e9ca4abdbcc41cd9410d67fafbfa6bc20")

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    # get latest installed kernel version. not the running one.
    _kernver="$(basename `ls -dlt /usr/lib/modules/[2-4]* | head -n 1 | cut -d "/" -f 2-`)"
    _driverpath="${pkgdir}/usr/lib/modules/${_kernver}/kernel/drivers/net/"
    _drivername="${_driverpath}${pkgname%}.ko"

    cd "${pkgname}-${pkgver}"

    #Upstream does not supply a LICENSE file
    #install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    #install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"

    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
    install -m644 Readme release_notes "${pkgdir}/usr/share/doc/${pkgname}"

    install -dm755 "${_driverpath}"
    install -m644 ${pkgname}.ko "${_driverpath}"
    strip "${_drivername}"
    xz "${_drivername}"

    install -dm755 "${pkgdir}/usr/lib/modules-load.d/"
    echo ${pkgname} > "${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf"

    if [ -d "/etc/pm/config.d/" ]; then
        install -dm755 "${pkgdir}/etc/pm/config.d/"
        echo "SUSPEND_MODULES=${pkgname}" > "${pkgdir}/etc/pm/config.d/${pkgname}"
    fi
}
