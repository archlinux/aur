# Maintainer: Daniel Plaza <daniel.plaza.espi at gmail dot com>
# Contributor: Romain Bazile <gromain.baz at gmail dot com>

pkgname=mcuxpresso-ide
pkgver=11.2.1_4149
pkgrel=1
epoch=
pkgdesc="An easy-to-use integrated development environment (IDE) for creating, building, debugging, and optimizing your application. From BIN package distributed by NXP."
arch=('x86_64')
url="http://www.nxp.com/MCUXPresso"
license=('custom:"NXP"')
depends=('ncurses' 'glibc' 'lib32-glibc' 'jlink-software-and-documentation' 'dfu-util' 'libusb')

source=("file://mcuxpressoide-${pkgver}.${arch}.deb.bin")
noextract=("mcuxpressoide-${pkgver}.${arch}.deb.bin")
sha256sums=('f45ae45f6cdcb6232b9a03551cbcdc0fdad9e5c12898d26dd436fdd6a7091bb5')
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
    rm ${srcdir}/mcuxpressoide/usr/local/mcuxpressoide-${pkgver}/JLink_Linux_x86_64.deb
    # Rename main folder in place
    mv ${srcdir}/mcuxpressoide/usr/local/mcuxpressoide-${pkgver} ${srcdir}/mcuxpressoide/usr/local/${pkgname};
    # Update link in desktop file
    cat ${srcdir}/mcuxpressoide/usr/share/applications/com.nxp.mcuxpressoide.desktop | sed "s/mcuxpressoide-${pkgver}/mcuxpresso-ide/" > ${srcdir}/mcuxpressoide/usr/share/applications/com.nxp.mcuxpressoide.desktop.1
    cat ${srcdir}/mcuxpressoide/usr/share/applications/com.nxp.mcuxpressoide.desktop.1 | sed "s/usr\/local/opt/" > ${srcdir}/mcuxpressoide/usr/share/applications/com.nxp.mcuxpressoide.desktop
}


package() {
    # Copy main folder in place
    cp -ar ${srcdir}/mcuxpressoide/usr ${pkgdir}/;
    # Move application files to /opt as they don't obey standard file system hierarchy
    mv ${pkgdir}/usr/local ${pkgdir}/opt;
    # Copy licenses of software components (FreeRTOS, Java etc.) accarding to system directory structure
    mkdir ${pkgdir}/usr/share/licenses
    cp -ar ${pkgdir}/opt/mcuxpresso-ide/licenses ${pkgdir}/usr/share/licenses/${pkgname}
    # Copy udev rules from /lib to /usr/lib folder
    cp -ar ${srcdir}/mcuxpressoide/lib/udev ${pkgdir}/usr/lib/;
    # Add Product LICENSE file to licenses folder
    install -D -m644 ${srcdir}/ProductLicense.txt ${pkgdir}/usr/share/licenses/${pkgname}/ProductLicense.txt;
}
