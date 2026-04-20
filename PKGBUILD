# Maintainer: Lotte V
# Contributor: Lotte V
pkgname=slabeler-le
pkgver=1.0
pkgrel=1
pkgdesc="Proprietary software for labeling speech/singing audio"
arch=('x86_64')
url="https://m-lo7.itch.io/slabeler-le"
license=('LicenseRef-custom')
groups=('slabeler')
depends=('libgcc' 'alsa-lib')
options=('!strip' '!emptydirs')
source=("SLabeler-linux.zip::https://m-lo7.itch.io/slabeler-le" "slabeler-le.desktop" "LICENSE")
md5sums=('694265ada186a44250428ec8ad3dbc64'
         '666391a8748ee269b6f23264bb1abcdc'
         '4247e0c0b44b09b93901cab7b0d22ab0')
sha512sums=('86ff3e451a6783a0066e4010128c720827995631ffd2943b63dca35cffa893a69808a1f6dbf1e34b79e9e7efd721e37a421807a66fe775ec5b7e230b113c89ec'
            'f1464580bd75087bc0e59e468073a21a0656897a04aad3c6c300a6b55adec2677f30da9b03447b2e3ed7bb1e3edd27923f6b8260a55a018cffd71056519d695a'
            '2cbb910a59da520bb31ca9da3171cbf1aaf2ab82a04c7e7ba763113dc94fe572883617685302fdadb489922be12716a4c7e2684e4f384200ff6ed19ff3a60416')

prepare() {
    if [ ! -f "${srcdir}/SLabeler-linux.zip" ]; then
        echo ""
        echo "  ERROR: Source file 'SLabeler-linux.zip' not found in the build directory."
        echo "  Please download it manually from: ${url}"
        echo "  And place it in the same directory as this PKGBUILD."
        echo ""
        return 1
    fi
}

package() {
    # 1. Create the folder in /opt
    install -d "${pkgdir}/opt/${pkgname}"

    # 2. Dump EVERYTHING in there
    # This includes assets, the binary, and the desktop/icon if you want
    cp -r "${srcdir}/assets" "${pkgdir}/opt/${pkgname}/"
    install -m755 "${srcdir}/SLabeler" "${pkgdir}/opt/${pkgname}/"

    # 3. THE NUCLEAR OPTION: Permissions
    # We make the folder world-writable so the log file can be created by anyone
    chmod -R 777 "${pkgdir}/opt/${pkgname}"

    # 4. Standard Launcher & Desktop Integration
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/SLabeler" "${pkgdir}/usr/bin/${pkgname}"

    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/pixmaps"
    install -m644 "${srcdir}/$pkgname.desktop" "${pkgdir}/usr/share/applications/"
    install -m644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
