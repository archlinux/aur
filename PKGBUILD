# Maintainer:

pkgname=mcuxpresso-secure-provisioning
pkgver=4.1.1
pkgrel=1
epoch=
pkgdesc="The MCUXpresso Secure Provisioning Tool is a GUI-based application provided to simplify generation and provisioning of bootable executables on NXP MCU devices."
arch=('x86_64')
url="https://www.nxp.com/design/software/development-software/mcuxpresso-software-and-tools-/mcuxpresso-secure-provisioning-tool:MCUXPRESSO-SECURE-PROVISIONING"
license=('custom:"NXP"')
depends=('openssl' 'hidapi' 'libusb')

_install_dir=/opt/nxp
_deb_name=${pkgname}-v4.1-1_amd64.deb
_binary_deb_name=${_deb_name}.bin

source=("file://${_binary_deb_name}")
noextract=("${_binary_deb_name}")
sha512sums=('8db788d2c77b68b004c17d50b8e71c9930752d38291939afcf39294fc445f6eeab22afa4f17f691b63253db010e7ec9151f1756091abd7c79e512f4b48a0e98b')
options=('!strip')

prepare() {
    chmod +x ${_binary_deb_name}
    ./${_binary_deb_name} --nox11 --noexec --keep --target ${srcdir}
    cd ${srcdir}/
    mkdir -p ${pkgname}
    bsdtar -x -f ${_deb_name} -C ${pkgname}/
    rm ${_deb_name}
    bsdtar -x -f ${pkgname}/data.tar.gz -C ${pkgname}/
    rm ${pkgname}/data.tar.gz
}

package() {
    mkdir -p ${pkgdir}${_install_dir}
    # main tool
    cp -ar ${srcdir}/mcuxpresso-secure-provisioning${_install_dir}/* ${pkgdir}${_install_dir};
    # udev rules
    mkdir -p ${pkgdir}/usr/lib/udev/rules.d/
    cp -ar ${srcdir}/${pkgname}/etc/udev/rules.d/* ${pkgdir}/usr/lib/udev/rules.d;
    # licenses
    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
    install -D -m644 ${srcdir}/ProductLicense.txt ${pkgdir}/usr/share/licenses/${pkgname}/ProductLicense.txt;
    # desktop shortcut
    cp -ar ${srcdir}/mcuxpresso-secure-provisioning/usr/share/applications ${pkgdir}/usr/share/applications
}
