# Maintainer: Fabian Bornschein <plusfabi-cat-gmail-dog-com>

# In order to work, you need to set these variables first
__server=
__license=
__groupid=
# You can get the informations from the download URL
# Section 4 Install OPSWAT Client
# sudo ./setup.sh -s=1337 -l=835dchaxx0r7cha45c9f8882b85b3592 -g=6942069
# -s is the server value
# -l the license
# -g the groupid

pkgname=opswatclient-bin
pkgver=15.4.22.0
pkgrel=1
pkgdesc='OPSWAT Client for Linux'
arch=('x86_64')
license=('custom')
url='https://gears.opswat.com'
install="INSTALL"
depends=('gcc-libs' 'gtk3' 'curl' 'openssl')
source=("opswatclient_deb-${pkgver}.tar::https://s3-us-west-2.amazonaws.com/opswat-gears-cloud-clients/linux_installer/latest/opswatclient_deb.tar")
md5sums=('a5aaab7bab4893210f444e6a5871ca1b')


prepare() {
    # Check for licensing stuff that needs to be included into the install routine. (fill out line 4…6)
    if [ -z "${__server}" ] || [ -z "${__license}" ] || [ -z "${__groupid}" ]; then {
        printf "ERROR: You need to edit the pkgbuild and set server,license and your groupid first\n"
        exit 1
    }
    fi
    
    cd "${srcdir}"
    # extrackt the debian package
    ar -xv "${srcdir}/opswatclient_deb/opswatclient.deb"
    tar -xvf "${srcdir}/data.tar.xz"
    
    # removal of the outdated libraries
    rm "${srcdir}/usr/bin/opswatclient/lib/libcrypto.so"*
    rm "${srcdir}/usr/bin/opswatclient/lib/libcurl.so"*
    rm "${srcdir}/usr/bin/opswatclient/lib/libgcc_s.so"*
    rm "${srcdir}/usr/bin/opswatclient/lib/libssl.so"*
    rm "${srcdir}/usr/bin/opswatclient/lib/libstdc++.so"*
    
    # Write Licensind informations to the service file
    sed -i "s/\${SERVER}/${__server}/g; \
        s/\${LICENSE}/${__license}/g; \
        s/\${GROUPID}/${__groupid}/g;" "${srcdir}/lib/systemd/system/opswatclient.service"
    
    # Write Licensind informations to the INSTALL file
    sed -i "s/\${SERVER}/${__server}/g; \
        s/\${LICENSE}/${__license}/g; \
        s/\${GROUPID}/${__groupid}/g;" "./../INSTALL"
}

package() { 
    cd "${srcdir}"
    mv "${srcdir}/usr" "${pkgdir}/usr"
    mv "${srcdir}/lib" "${pkgdir}/usr/lib"
}
