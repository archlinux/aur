# Maintainer: Romain Bazile <gromain.baz at gmail dot com>

pkgname=mcuxpresso-ide
pkgver=11.0.1_2563
pkgrel=1
epoch=
pkgdesc="An easy-to-use integrated development environment (IDE) for creating, building, debugging, and optimizing your application. From BIN package distributed by NXP."
arch=('x86_64')
url="http://www.nxp.com/MCUXPresso"
license=('custom:"NXP"')
depends=('dfu-util' 'libusb' 'ncurses' 'glibc' 'lib32-glibc' 'jlink-software-and-documentation')

source=("https://freescaleesd.flexnetoperations.com/337170/187/14904187/mcuxpressoide-${pkgver}.${arch}.deb.bin" "LICENSE")
noextract=("mcuxpressoide-${pkgver}.${arch}.deb.bin")
sha256sums=('fe945229b6630048aedcdb0eab1aa638e63be36b28a98686038bd20cf4a7635d'
            '7909288faa4c24a6857b97a4ed3dde4b53d2d25447f72f06034f8320d0586152')
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
