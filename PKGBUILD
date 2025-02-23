# Maintainer: David Gonzalez <neko.eth0 AT gmail DOT com>
# Contributor: Ricardo Band <email AT ricardo DOT band>
_pkgver="11.3.0.0-795"
_folder_num="FOLDER12638439M"
_folder_gpg="FOLDER12638420M"
_driver_id="mfv7t"
pkgname=dell-idractools
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="Dell iDRAC Tools (RACADM, VMCLI, IPMI Tool)"
arch=('x86_64')
url="https://www.dell.com/support/home/en-us/drivers/driversdetails?driverid=${_driver_id}"
license=('custom:Dell EULA rev 23OCT2024')
install=${pkgname}.install
conflicts=(dell-srvadmin dell-mgmtstat)
makedepends=(rpmextract)
source=("https://dl.dell.com/${_folder_gpg}/1/Dell-iDRACTools-Web-LX-${_pkgver}_A00.tar.gz.sign"
        "https://dl.dell.com/${_folder_num}/1/Dell-iDRACTools-Web-LX-${_pkgver}_A00.tar.gz"
        LICENSE)
sha256sums=('SKIP'
            'cfbeb964a158ae2000c93e856acf91ac595ec9324008df6a6b7fa6d31e8ee3f5'
            '9bc2344836f09db9c0a9b7d1faa06ee59b6b77b5fff75ea2e607f71bd1a29f4e')
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

    # add LICENSE file
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
