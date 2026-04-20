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
source=("SLabeler-linux.zip" "slabeler-le.desktop" "LICENSE")
md5sums=('694265ada186a44250428ec8ad3dbc64'
         '5ffdd72d199a462074071cecd9e33933'
         'd5723dd67805fc1c5f971a9fe7ae8133')
sha512sums=('86ff3e451a6783a0066e4010128c720827995631ffd2943b63dca35cffa893a69808a1f6dbf1e34b79e9e7efd721e37a421807a66fe775ec5b7e230b113c89ec'
            'bbd1921d15db93efb1d4b0e2a13751ebce21bc454d4cf6a5edd88ed999819c5b648a9901fb6f222d5ea6d8f6c24f8bc40ca01bd00494261c1fc9b42f719506da'
            'a753aeb1bfccdb152253cf8ec379961116b1ac8ced96b09761cffe966c2bd438bf265f81abaea8aba42a1c8a90b32e093c9a4dfa0f09a7f45eca8abacb6e2f48')

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
