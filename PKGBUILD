# Maintainer: Ricardo Band <email@ricardo.band>

pkgname=dell-idractools
pkgver=9.3.0.3379
_pkgver="9.3.0-3379"
_pkgbuild=14516
pkgrel=2
pkgdesc="Dell EMC iDRAC Tools (RACADM, VMCLI, IPMI Tool)"
arch=('x86_64')
url='https://www.dell.com/support/home/de/de/debsdt1/drivers/driversdetails?driverid=G3NDF&oscode=RHE70&productcode=poweredge-r640'
license=('GPL2' 'LGPL2')
conflicts=(dell-srvadmin dell-mgmtstat)
makedepends=(rpmextract)
# http://downloads.dell.com/published/pages/poweredge-r640.html
source=("http://downloads.dell.com/FOLDER05446180M/1/DellEMC-iDRACTools-Web-LX-${_pkgver}_A00.tar.gz"
        "http://downloads.dell.com/FOLDER05446181M/1/DellEMC-iDRACTools-Web-LX-${_pkgver}_A00.tar.gz.sign")
sha256sums=("3e36131d618a4cbd3526c31f936451c225cdfa470ab8293cac6f5304a2442e28"
            "de3aa3d6955e490cd6a43d102a4435fa133c5ac4ef58866afd538eaf9f046a42")
validpgpkeys=("42550ABD1E80D7C1BC0BAD851285491434D8786F")

package() {
    rpm2cpio ${srcdir}/iDRACTools/racadm/RHEL7/${arch}/srvadmin-argtable2-${_pkgver}.${_pkgbuild}.el7.${arch}.rpm | bsdtar -xf - -C ${pkgdir}
    rpm2cpio ${srcdir}/iDRACTools/racadm/RHEL7/${arch}/srvadmin-hapi-${_pkgver}.${_pkgbuild}.el7.${arch}.rpm | bsdtar -xf - -C ${pkgdir}
    rpm2cpio ${srcdir}/iDRACTools/racadm/RHEL7/${arch}/srvadmin-idracadm7-${_pkgver}.${_pkgbuild}.el7.${arch}.rpm | bsdtar -xf - -C ${pkgdir}

    # cleanup
    # remove redundant service file
    rm -rf ${pkgdir}/etc/systemd/system/instsvcdrv.service
    # merge /usr/lib64 with /usr/lib
    mv ${pkgdir}/usr/lib64/* ${pkgdir}/usr/lib/
    rm -rf ${pkgdir}/usr/lib64

    # create symlink to racadm
    mkdir -p ${pkgdir}/usr/local/bin
    ln -s /opt/dell/srvadmin/bin/idracadm7 ${pkgdir}/usr/local/bin/idracadm7
    ln -s /usr/local/bin/idracadm7 ${pkgdir}/usr/local/bin/racadm
}

