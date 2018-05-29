# Maintainer: Romain Bazile <gromain.baz at gmail dot com>

pkgname=mcuxpresso-ide
pkgver=10.2.0_759
pkgrel=1
epoch=
pkgdesc="An easy-to-use integrated development environment (IDE) for creating, building, debugging, and optimizing your application. From BIN package distributed by NXP."
arch=('x86_64')
url="http://www.nxp.com/MCUXPresso"
license=('custom:"NXP"')
depends=('dfu-util' 'libusb' 'ncurses' 'glibc' 'lib32-glibc' 'jlink-software-and-documentation')

source=("https://freescaleesd.flexnetoperations.com/337170/167/12841167/mcuxpressoide-${pkgver}.${arch}.deb.bin" "LICENSE")
noextract=("mcuxpressoide-${pkgver}.${arch}.deb.bin")
sha256sums=('4acc95699c495075d37d11e500e74963ca76bb9080214e3d51cb4efcd5f3aa8e'
            '983aae56ab8f62d13cbae6a28761e6ffb228431002e8d502aed2fa5fa31a630f')
options=('!strip')

prepare() {
    chmod +x mcuxpressoide-${pkgver}.${arch}.deb.bin
    ./mcuxpressoide-${pkgver}.${arch}.deb.bin --noexec --keep --target ${srcdir}
    rm mcuxpressoide-${pkgver}.${arch}.deb.bin
    cd ${srcdir}/
    mkdir mcuxpressoide
    bsdtar -x -f mcuxpressoide-${pkgver}.${arch}.deb -C mcuxpressoide/
    rm mcuxpressoide-${pkgver}.${arch}.deb
    bsdtar -x -f mcuxpressoide/data.tar.gz -C mcuxpressoide/
    rm mcuxpressoide/data.tar.gz
    rm JLink_Linux_x86_64.deb
    # Rename main folder in place
    mv ${srcdir}/mcuxpressoide/usr/local/mcuxpressoide-${pkgver} ${srcdir}/mcuxpressoide/usr/local/${pkgname};
    # Update link in desktop file
    mv ${srcdir}/mcuxpressoide/usr/share/applications/com.nxp.mcuxpressoide.desktop ${srcdir}/mcuxpressoide/usr/share/applications/com.nxp.mcuxpressoide.desktop.old
    cat ${srcdir}/mcuxpressoide/usr/share/applications/com.nxp.mcuxpressoide.desktop.old | sed "s/mcuxpressoide-${pkgver}/mcuxpresso-ide/" > ${srcdir}/mcuxpressoide/usr/share/applications/com.nxp.mcuxpressoide.desktop
    rm ${srcdir}/mcuxpressoide/usr/share/applications/com.nxp.mcuxpressoide.desktop.old
}


package() {
    # Create folder for license file
    mkdir -p ${srcdir}/mcuxpressoide/usr/share/NXPLPCXpresso;
    # Move main folder in place 
    mv ${srcdir}/mcuxpressoide/usr ${pkgdir}/;
    # Move udev rules from /lib to /usr/lib folder
    mv ${srcdir}/mcuxpressoide/lib/udev ${pkgdir}/usr/lib/;
    # Add LICENSE file to licenses folder
    install -D -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE;
}
