# Maintainer: Romain Bazile <gromain.baz at gmail dot com>

pkgname=mcuxpresso-ide
pkgver=10.0.0_344
pkgrel=1
epoch=
pkgdesc="An easy-to-use integrated development environment (IDE) for creating, building, debugging, and optimizing your application. From BIN package distributed by NXP."
arch=('x86_64')
url="http://www.nxp.com/MCUXPresso"
license=('custom:"NXP"')
depends=('dfu-util' 'libusb' 'webkitgtk' 'ncurses' 'glibc')
source=("https://freescaleesd.flexnetoperations.com/337170/457/11291457/mcuxpressoide-${pkgver}.${arch}.deb.bin" "LICENSE")
noextract=("mcuxpressoide-${pkgver}.${arch}.deb.bin")
sha256sums=('e39a767b6bd8ef9e84efa2e20ecc07cc8c7a8bbcfb04633d52e0d02ea2b5ce73'
            'f54634d263ed329288adbcd617f971502a22f38717602c504371a49301d37fb2')
options=('!strip')

prepare() {
    chmod +x mcuxpressoide-${pkgver}.${arch}.deb.bin
    ./mcuxpressoide-${pkgver}.${arch}.deb.bin --noexec --keep --target ${srcdir}
    cd ${srcdir}/
    mkdir mcuxpressoide
    bsdtar -x -f mcuxpressoide-${pkgver}.${arch}.deb -C mcuxpressoide/
    bsdtar -x -f mcuxpressoide/data.tar.gz -C mcuxpressoide/
    mkdir JLink_Linux_x86_64
    bsdtar -x -f JLink_Linux_x86_64.deb -C JLink_Linux_x86_64/
    bsdtar -x -f JLink_Linux_x86_64/data.tar.gz -C JLink_Linux_x86_64/
}


package() {
    mkdir -p ${srcdir}/mcuxpressoide/usr/share/NXPLPCXpress;
    mv ${srcdir}/mcuxpressoide/lib/udev/rules.d/55-pemicro.rules ${srcdir}/mcuxpressoide/lib/udev/rules.d/57-pemicro.rules
    cp -r ${srcdir}/mcuxpressoide/usr ${pkgdir}/;
    cp -r ${srcdir}/mcuxpressoide/lib ${pkgdir}/usr/;
    cp -r ${srcdir}/JLink_Linux_x86_64/usr ${pkgdir}/;
    cp -r ${srcdir}/JLink_Linux_x86_64/opt ${pkgdir}/;
    cp -r ${srcdir}/JLink_Linux_x86_64/etc ${pkgdir}/;
    install -D -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE;
}
