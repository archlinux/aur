# Maintainer: Ricardo Band <email@ricardo.band>

pkgname=dell-idractools
pkgver=9.3.1.3669
_pkgver="9.3.1-3669"
_pkgbuild=15500
pkgrel=2
pkgdesc="Dell EMC iDRAC Tools (RACADM, VMCLI, IPMI Tool)"
arch=('x86_64')
url='https://www.dell.com/support/home/de/de/debsdt1/drivers/driversdetails?driverid=G3NDF&oscode=RHE70&productcode=poweredge-r640'
license=('GPL2' 'LGPL2')
conflicts=(dell-srvadmin dell-mgmtstat)
makedepends=(rpmextract)
# http://downloads.dell.com/published/pages/poweredge-r640.html
source=("http://downloads.dell.com/FOLDER05818334M/1/DellEMC-iDRACTools-Web-LX-${_pkgver}_A00.tar.gz.sign"
        "http://downloads.dell.com/FOLDER05818335M/1/DellEMC-iDRACTools-Web-LX-${_pkgver}_A00.tar.gz")
sha256sums=('SKIP'
            'e10370eefdd61208cba7092df0dca696943cd15db6b1464e0467f883a9190879')
validpgpkeys=("42550ABD1E80D7C1BC0BAD851285491434D8786F")

package() {
    rpm2cpio ${srcdir}/iDRACTools/racadm/RHEL8/${arch}/srvadmin-argtable2-${_pkgver}.${_pkgbuild}.el8.${arch}.rpm | bsdtar -xf - -C ${pkgdir}
    rpm2cpio ${srcdir}/iDRACTools/racadm/RHEL8/${arch}/srvadmin-hapi-${_pkgver}.${_pkgbuild}.el8.${arch}.rpm | bsdtar -xf - -C ${pkgdir}
    rpm2cpio ${srcdir}/iDRACTools/racadm/RHEL8/${arch}/srvadmin-idracadm7-${_pkgver}.${_pkgbuild}.el8.${arch}.rpm | bsdtar -xf - -C ${pkgdir}

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

