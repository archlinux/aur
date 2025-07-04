# Maintainer: KafCoppelia <k740677208@gmail.com>
# Contributor: jacko <obri.jack.02@gmail.com>

# BUILD INSTRUCTIONS:
#
# 1. Log in to nxp.com
# 2. Go to https://www.nxp.com/design/design-center/software/development-software/mcuxpresso-software-and-tools-/linkserver-for-microcontrollers:LINKERSERVER
# 3. Click on "Download" and download the current version
# 4. Accept the License terms
# 5. Download the .deb.bin package and place it in the same directory as the PKGBUILD
# 6. Build

pkgname=linkserver
pkgver=25.6.131
pkgrel=1
pkgdesc="A utility for launching and managing GDB servers for NXP debug probes, which also provides a command-line target flash programming capabilities."
arch=('x86_64')
url="https://www.nxp.com/design/design-center/software/development-software/mcuxpresso-software-and-tools-/linkserver-for-microcontrollers:LINKERSERVER"
license=('LicenseRef-linkserver')
depends=('bash' 'bzip2' 'expat' 'gcc-libs' 'glibc' 'libusb' 'openssl-1.1' 'systemd-libs' 'zlib' 'xz' 'libx11' 'libxext' 'libxft' 'fontconfig' 'libxss'
    'libxfixes' 'libpng' 'libxcb' 'libxcursor' 'tk' 'libbsd' 'tcl' 'util-linux-libs' 'libxrender' 'freetype2')
_source="LinkServer_${pkgver}.${arch}.deb.bin"
source=("file://${_source}")
sha256sums=('2194c61b35cd06c01c3d448147607152f78337cf0cde6990ec5d105afc6c7778')
options=('!strip')

prepare() {
    chmod +x ${_source}
    ./${_source} --noexec --keep --target ${srcdir}
    rm ${_source}
    cd ${srcdir}
    # linkserver
    mkdir -p ${pkgname}
    bsdtar -xf LinkServer_${pkgver}.${arch}.deb -C ${pkgname}/
    rm LinkServer_${pkgver}.${arch}.deb
    bsdtar -xf ${pkgname}/data.tar.gz -C ${pkgname}/
    rm ${pkgname}/data.tar.gz
    # mcu-link
    mkdir -p mcu-link
    bsdtar -xf MCU-Link.deb -C mcu-link/
    rm MCU-Link.deb
    bsdtar -xf mcu-link/data.tar.gz -C mcu-link/
    rm mcu-link/data.tar.gz
    # lpcscrypt
    mkdir -p lpcscrypt
    bsdtar -xf LPCScrypt.deb -C lpcscrypt/
    rm LPCScrypt.deb
    bsdtar -xf lpcscrypt/data.tar.gz -C lpcscrypt/
    rm lpcscrypt/data.tar.gz
    # Rename main folder in place
    mv ${srcdir}/${pkgname}/usr/local/LinkServer_${pkgver} ${srcdir}/${pkgname}/usr/local/${pkgname}
    # Move MCU-LINK in the subfolder
    mv ${srcdir}/mcu-link/usr/local/MCU-LINK_installer_* ${srcdir}/${pkgname}/usr/local/${pkgname}/MCU-LINK
    # Move LPCScrypt in the subfolder
    mv ${srcdir}/lpcscrypt/usr/local/lpcscrypt-* ${srcdir}/${pkgname}/usr/local/${pkgname}/lpcscrypt
}


package() {
    # Copy main folder in place
    cp -ar ${srcdir}/${pkgname}/usr ${pkgdir}/
    # Move application files to /opt as they don't obey standard file system hierarchy
    mv ${pkgdir}/usr/local ${pkgdir}/opt
    # Copy udev rules from /lib to /usr/lib folder
    cp -ar ${srcdir}/${pkgname}/lib/udev ${pkgdir}/usr/lib/
    cp -ar ${srcdir}/mcu-link/lib/udev ${pkgdir}/usr/lib/
    cp -ar ${srcdir}/lpcscrypt/lib/udev ${pkgdir}/usr/lib/
    # Add Product LICENSE file to licenses folder
    install -D -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
