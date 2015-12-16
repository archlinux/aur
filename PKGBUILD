# Maintainer: Ainola

pkgname=gog-dont-starve
pkgver=2.1.0.3
pkgrel=1
pkgdesc="An uncompromising wilderness survival game full of science and magic"
url="https://www.kleientertainment.com/games/dont-starve"
license=('custom')
arch=('i686' 'x86_64')
depends=('sdl2' 'libcurl-gnutls')
source=("gog://gog_don_t_starve_${pkgver}.sh"
        "${pkgname}.desktop")
sha256sums=('8f8fca4d89626e43f4ee2d378cc30daf2a45c24c91a3bc1694d83a00fb0a062b'
            '609856aae2d19877f8afb764a8db15a8932e535b719cc342f4b42c3d0e4b1956')

# You need to download the gog.com installer file manually or with lgogdownloader.
DLAGENTS+=("gog::/usr/bin/echo %u - This is is not a real URL, you need to download the GOG file manually to \"$PWD\" or setup a gog:// DLAGENT. Read this PKGBUILD for more information.")

# Prevent compressing final package
PKGEXT='.pkg.tar'

prepare(){
    cd "$srcdir/data/noarch"
    [ $CARCH == "x86" ]    && rm -r "game/dontstarve64"
    [ $CARCH == "x86_64" ] && rm -r "game/dontstarve32"
    # The launcher expects the user to be in the game dir
    echo -e "#!/bin/sh\ncd /opt/${pkgname}\n./start.sh" > "${srcdir}/${pkgname}"
}

package(){
    cd "$srcdir"
    # Install game
    install -d "${pkgdir}/opt/${pkgname}/"
    install -d "${pkgdir}/opt/${pkgname}/support"
    install -d "${pkgdir}/usr/bin/"
    cp -r "data/noarch/game/" "${pkgdir}/opt/${pkgname}/"
    install -Dm755 "data/noarch/start.sh" \
        "${pkgdir}/opt/${pkgname}/"
    install -Dm755 data/noarch/support/*.{sh,shlib} -t \
        "${pkgdir}/opt/${pkgname}/support"

    # Desktop integration
    install -Dm 644 "data/noarch/support/icon.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "data/noarch/docs/End User License Agreement.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm 755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
