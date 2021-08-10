# Maintainer:

pkgname=mcuxpresso-secure-provisioning
pkgver=3.1
pkgrel=1
epoch=
pkgdesc="The MCUXpresso Secure Provisioning Tool is a GUI-based application provided to simplify generation and provisioning of bootable executables on NXP MCU devices."
arch=('x86_64')
url="https://www.nxp.com/design/software/development-software/mcuxpresso-software-and-tools-/mcuxpresso-secure-provisioning-tool:MCUXPRESSO-SECURE-PROVISIONING"
license=('custom:"NXP"')
depends=('openssl' 'hidapi' 'libusb')

_install_dir=/opt/nxp
_deb_name=${pkgname}-v${pkgver}-${pkgrel}_amd64.deb
_binary_deb_name=${_deb_name}.bin

source=("file://${_binary_deb_name}")
noextract=("${_binary_deb_name}")
sha512sums=('a6a80396aa577e1e3901f29c613d4c85eda69f983172c91c37c49a08fa0790797961d230a540eadf2aeef4975321ebc4a5a950f94e4c4cd51b7cbc13b3d31b01')
options=('!strip')

prepare() {
    chmod +x ${_binary_deb_name}
    ./${_binary_deb_name} --nox11 --noexec --keep --target ${srcdir}
    cd ${srcdir}/
    mkdir ${pkgname}
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
