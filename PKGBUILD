# Maintainer: David Gonzalez <neko.eth0 AT gmail DOT com>
# Contributor: Ricardo Band <email AT ricardo DOT band>
_pkgver="10.1.0.0-4566"
_pkgbuild=18291
_folder_num="FOLDER07423496M"
_folder_gpg="FOLDER07423495M"
pkgname=dell-idractools
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="Dell EMC iDRAC Tools (RACADM, VMCLI, IPMI Tool)"
arch=('x86_64')
url='https://www.dell.com/support/home/en-us/drivers/driversdetails?driverid=df1nd&oscode=rhel8&productcode=poweredge-r7525'
license=('GPL2' 'LGPL2')
conflicts=(dell-srvadmin dell-mgmtstat)
makedepends=(rpmextract)
# http://downloads.dell.com/published/pages/poweredge-r640.html
source=("https://dl.dell.com/${_folder_gpg}/1/DellEMC-iDRACTools-Web-LX-${_pkgver}_A00.tar.gz.sign"
        "https://dl.dell.com/${_folder_num}/1/DellEMC-iDRACTools-Web-LX-${_pkgver}_A00.tar.gz")
sha256sums=('ae88b3ccef2e3d7cbc25aea5e48e1e9a5cfd760cd5e651ba1ab65e6b57bf32a0'
            'e8329bce40684805bfcebf6975e2fe18850d302329e4424170acdc460d5c1d2a')
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

