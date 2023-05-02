# Maintainer: David Gonzalez <neko.eth0 AT gmail DOT com>
# Contributor: Ricardo Band <email AT ricardo DOT band>
_pkgver="11.0.0.0-5139"
_folder_num="FOLDER08952875M"
_folder_gpg="FOLDER08952871M"
pkgname=dell-idractools
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="Dell iDRAC Tools (RACADM, VMCLI, IPMI Tool)"
arch=('x86_64')
url='https://www.dell.com/support/home/en-us/drivers/driversdetails?driverid=df1nd&oscode=rhel8&productcode=poweredge-r7525'
license=('GPL2' 'LGPL2')
conflicts=(dell-srvadmin dell-mgmtstat)
makedepends=(rpmextract)
source=("https://dl.dell.com/${_folder_gpg}/1/Dell-iDRACTools-Web-LX-${_pkgver}_A00.tar.gz.sign"
        "https://dl.dell.com/${_folder_num}/1/Dell-iDRACTools-Web-LX-${_pkgver}_A00.tar.gz")
sha256sums=('f425201ca75ff29f7462d537f563257d0a534c703a4fe6e27eebc515dffe42e9'
            '4d37118de72a5be2c8e5ff5586b347a1b4d0b601d948d2a71a29f135801ef795')
validpgpkeys=("42550ABD1E80D7C1BC0BAD851285491434D8786F")

# dl.dell.com doesn't like cURL
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

package() {
    rpm2cpio ${srcdir}/iDRACTools/racadm/RHEL8/${arch}/srvadmin-argtable2-${_pkgver}.el8.${arch}.rpm | bsdtar -xf - -C ${pkgdir}
    rpm2cpio ${srcdir}/iDRACTools/racadm/RHEL8/${arch}/srvadmin-hapi-${_pkgver}.el8.${arch}.rpm | bsdtar -xf - -C ${pkgdir}
    rpm2cpio ${srcdir}/iDRACTools/racadm/RHEL8/${arch}/srvadmin-idracadm7-${_pkgver}.el8.${arch}.rpm | bsdtar -xf - -C ${pkgdir}

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

