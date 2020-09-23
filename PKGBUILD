# Maintainer: Ricardo Band <email@ricardo.band>

pkgname=dell-idractools
_pkgver=9.4.0-3732
_folder_sign=FOLDER05920766M
_folder=FOLDER05920767M
pkgver=${_pkgver/-/.}
pkgrel=2
pkgdesc="Dell EMC iDRAC Tools (RACADM, VMCLI, IPMI Tool)"
arch=('x86_64')
url='https://www.dell.com/support/home/de/de/debsdt1/drivers/driversdetails?driverid=G3NDF&oscode=RHE70&productcode=poweredge-r640'
license=('GPL2' 'LGPL2')
conflicts=(dell-srvadmin dell-mgmtstat)
makedepends=(rpmextract)
# http://downloads.dell.com/published/pages/poweredge-r640.html
source=("https://dl.dell.com/${_folder_sign}/1/DellEMC-iDRACTools-Web-LX-${_pkgver}_A00.tar.gz.sign"
        "https://dl.dell.com/${_folder}/1/DellEMC-iDRACTools-Web-LX-${_pkgver}_A00.tar.gz")
sha256sums=('SKIP'
            'bd7cecb61fbf46818355c5c142e23b3b35466cacc5bb56ee24dc9a6da728d595')
validpgpkeys=("42550ABD1E80D7C1BC0BAD851285491434D8786F")

package() {
    rpm2cpio ${srcdir}/iDRACTools/racadm/RHEL8/${arch}/srvadmin-argtable2-${_pkgver}.*.el8.${arch}.rpm | bsdtar -xvf - -C ${pkgdir}
    rpm2cpio ${srcdir}/iDRACTools/racadm/RHEL8/${arch}/srvadmin-hapi-${_pkgver}.*.el8.${arch}.rpm | bsdtar -xvf - -C ${pkgdir}
    rpm2cpio ${srcdir}/iDRACTools/racadm/RHEL8/${arch}/srvadmin-idracadm7-${_pkgver}.*.el8.${arch}.rpm | bsdtar -xvf - -C ${pkgdir}

    # cleanup
    # remove redundant service file
    rm -rf ${pkgdir}/etc/systemd/system/instsvcdrv.service
    # merge /usr/lib64 with /usr/lib
    mv ${pkgdir}/usr/lib64/* ${pkgdir}/usr/lib/
    rm -rf ${pkgdir}/usr/lib64
    rm -rf ${pkgdir}/usr/lib/.build-id
    rm -rf ${pkgdir}/etc/rc.d

    # create symlink to racadm
    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/dell/srvadmin/bin/idracadm7 ${pkgdir}/usr/bin/racadm
}

