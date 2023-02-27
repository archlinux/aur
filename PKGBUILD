# Maintainer: WhiteFall <whitefall76@outlook.com>
# Maintainer: asukaminato <asukaminato at nyan dot eu dot org>
# Contributor: Jarrett Ye <jarrett.ye@outlook.com>


pkgname=supermemo18.05-git
pkgver=1.4
pkgrel=2
pkgdesc='A program that makes learning fun and easy.'
arch=('x86_64')
url='https://supermemopedia.com/wiki/Main_Page'
license=('proprietary')
depends=() # wine has some problem, so I use wine.AppImage
sha512sums=('SKIP'
            'SKIP'
            '4b632d356ea230f439ae6df6c858ec33b96d9c28141b336fc8bab06f883a0e8594d8856330936787220f43a9b81b70d8b99bdde5d04dd8ec1b0d9eff96a4fbf7'
            '314289d7abe7f1e188c37c03b92d3b968ba82aa85a270af6cf61f548f7696845b174cdcca4b935bd6c9270f47b8178edcb55052a9a534bf6ec123766c2e0be77'
            'a7eb83a5da1bb381db9750865edf8d6ba6ef27c0857d961675ef2182a0a33c3e45bd8a614f9c1deb4b3b73716fd754cda75232e31405485f11c84fe2e20c08d8'
            'd3ec37fe33cb67b6d8c9f2f945715c125363659e1e853ef37999668662c2697c6e17fb1f04f91f7b085660b8b20fa58a3e64a0dc248a03d971d24deedc7178b0'
            '948680480f34a40f19e6b1c7da796f3161e99df0f2e11b3bdca3ec743d697b4a08fb5c5e03d8ce1ed2f3ec021a210a33b48a8c8a4df9183707f341d6220c13b3')

source=('git+https://github.com/Zacharia2/SuperMemo18-ON-Wine.git#commit=f9375d8c4e7cd90f9b21e91ffdacde2f166304af' # wineprefix
        'git+https://github.com/L-M-Sherlock/sm18-lazy-package.git#commit=c5ab18d237e8411d70199a7093cd21a0fb2c3505' # software
        'https://github.com/Hackerl/Wine_Appimage/releases/download/v3.0/Wine-x86_64-ubuntu.latest.AppImage' # wine runtime
        'config.sh'
        'run.sh'
        "SuperMemo18.05.desktop"
        "SuperMemo18.05-winecfg.desktop"
        )

options=('!strip') # appimage can't strip


package() {
        local prefix="${pkgdir}/${HOME}/.local/share/wineprefixes/"
        mkdir -p "${prefix}"
        printf "===> put wineprefix\n"
        # https://stackoverflow.com/questions/8488253/how-to-force-cp-to-overwrite-without-confirmation
        yes | cp -rf "${srcdir}/SuperMemo18-ON-Wine/deb-package/opt/apps/supermemo/SM18.05-WINE-Vessel/" "${prefix}"
        printf "===> put binary\n"
        yes | cp -rf ${srcdir}/sm18-lazy-package/sm18/* "${prefix}/SM18.05-WINE-Vessel/drive_c/SuperMemo/"
        chown -R $USER:$USER "${prefix}/SM18.05-WINE-Vessel/"
        chmod -R 755 $prefix
        printf "===> put desktop file\n"
        install -Dm644 "SuperMemo18.05.desktop" -t "${pkgdir}/usr/share/applications/"
        install -Dm644 "SuperMemo18.05-winecfg.desktop" -t "${pkgdir}/usr/share/applications/"
        printf "===> put launch file\n"
        install -Dm755 run.sh -t "${pkgdir}/opt/apps/supermemo18/"
        install -Dm755 config.sh  -t "${pkgdir}/opt/apps/supermemo18/"
        printf "===> put Appimage\n"
        install -Dm755 "Wine-x86_64-ubuntu.latest.AppImage" "${pkgdir}/opt/apps/supermemo18/wine.AppImage"
        printf "===> put icon\n"
        install -Dm644 "${srcdir}/SuperMemo18-ON-Wine/deb-package/opt/apps/supermemo/SM18.05-WINE-Vessel/smicon.png"  "${pkgdir}/usr/share/pixmaps/supermemo18.png"
        printf "===> done\n"
}
