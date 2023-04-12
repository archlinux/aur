# Maintainer: Daniel Plaza <daniel.plaza.espi at gmail dot com>
# Contributor: Romain Bazile <gromain.baz at gmail dot com>
# Maintainer: Matyas Mehn <matyas.mehn at tum dot de>

# BUILD INSTRUCTIONS:
#
# 1. Log in to nxp.com
# 2. Go to https://www.nxp.com/design/software/development-software/mcuxpresso-software-and-tools-/mcuxpresso-integrated-development-environment-ide:MCUXpresso-IDE
# 3. Click on "Download" and download the current version
# 4. Accept the License terms
# 5. Download the .deb.bin package and place it in the same directory as the PKGBUILD
# 6. Build!
#
# No refunds for broken AUR helpers, just use makepkg.
#

pkgname=mcuxpresso-ide
pkgver=11.7.1_9221
pkgrel=1
epoch=
pkgdesc="An easy-to-use integrated development environment (IDE) for creating, building, debugging, and optimizing your application. From BIN package distributed by NXP."
arch=('x86_64')
url="http://www.nxp.com/MCUXPresso"
license=('custom:"NXP"')
depends=('ncurses' 'glibc' 'lib32-glibc' 'jlink-software-and-documentation' 'dfu-util' 'libusb')

source=("file://mcuxpressoide-${pkgver}.${arch}.deb.bin")
noextract=("mcuxpressoide-${pkgver}.${arch}.deb.bin")
sha256sums=('92af942b6aa1e4e421ade929cdd69bd754e24c96fff75c687dea1a03fe99ce48')
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
