# Maintainer: KafCoppelia <k740677208@gmail.com>

# BUILD INSTRUCTIONS:
#
# 1. Log in to nxp.com
# 2. Go to https://www.nxp.com/design/design-center/software/development-software/mcuxpresso-software-and-tools-/linkserver-for-microcontrollers:LINKERSERVER
# 3. Click on "Download" and download the current version
# 4. Accept the License terms
# 5. Download the .deb.bin package and place it in the same directory as the PKGBUILD
# 6. Build

pkgname=linkserver
pkgver=1.6.133
pkgrel=1
pkgdesc="LinkServer is a utility for launching and managing GDB servers for NXP debug probes, which also provides a command-line target flash programming capabilities."
arch=('x86_64')
url="https://www.nxp.com/design/design-center/software/development-software/mcuxpresso-software-and-tools-/linkserver-for-microcontrollers:LINKERSERVER"
license=('custom:LA_OPT_NXP_Software_License')
depends=('bash' 'bzip2' 'expat' 'gcc-libs' 'glibc' 'libusb' 'openssl-1.1' 'systemd-libs' 'zlib' 'xz' )
_source="LinkServer_${pkgver}.${arch}.deb.bin"
source=("file://${_source}")
noextract=("${_source}")
sha256sums=('e398fa28ff059a04625672a0cb4d12f8c8c86322b08b07a898e75855315990f9')
options=('!strip')

prepare() {
    chmod +x ${_source}
    ./${_source} --noexec --keep --target ${srcdir}
    rm ${_source}
    cd ${srcdir}
    mkdir linkserver
    bsdtar -x -f LinkServer_${pkgver}.${arch}.deb -C linkserver/
    rm LinkServer_${pkgver}.${arch}.deb
    bsdtar -x -f linkserver/data.tar.gz -C linkserver/
    rm linkserver/data.tar.gz

    mkdir mcu-link
    bsdtar -x -f MCU-Link.deb -C mcu-link/
    rm MCU-Link.deb
    bsdtar -x -f mcu-link/data.tar.gz -C mcu-link/
    rm mcu-link/data.tar.gz
    mkdir lpcscrypt
    bsdtar -x -f LPCScrypt.deb -C lpcscrypt/
    rm LPCScrypt.deb
    bsdtar -x -f lpcscrypt/data.tar.gz -C lpcscrypt/
    rm lpcscrypt/data.tar.gz
    # Rename main folder in place
    mv ${srcdir}/linkserver/usr/local/LinkServer_${pkgver} ${srcdir}/linkserver/usr/local/${pkgname}
    # Move MCU-LINK in the subfolder
    mv ${srcdir}/mcu-link/usr/local/MCU-LINK_installer_* ${srcdir}/linkserver/usr/local/${pkgname}/MCU-LINK
    # Move LPCScrypt in the subfolder
    mv ${srcdir}/lpcscrypt/usr/local/lpcscrypt-* ${srcdir}/linkserver/usr/local/${pkgname}/lpcscrypt
}


package() {
    # Copy main folder in place
    cp -ar ${srcdir}/linkserver/usr ${pkgdir}/
    # Move application files to /opt as they don't obey standard file system hierarchy
    mv ${pkgdir}/usr/local ${pkgdir}/opt
    # Copy udev rules from /lib to /usr/lib folder
    cp -ar ${srcdir}/linkserver/lib/udev ${pkgdir}/usr/lib/
    cp -ar ${srcdir}/mcu-link/lib/udev ${pkgdir}/usr/lib/
    cp -ar ${srcdir}/lpcscrypt/lib/udev ${pkgdir}/usr/lib/
    # Add Product LICENSE file to licenses folder
    install -D -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
