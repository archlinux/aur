# Maintainer:   Nascher <kevin at nascher dot org>
# Contributor:  Ludovic LE ROUX <bojurama12@yahoo.com>

# This package is based on the gog-terraria package and the gog-freedom-planet package from Ainola.

pkgname=gog-shovel-knight
pkgver=2.5.0.7
pkgrel=1
pkgdesc='Yacht Club Games'
arch=("i686" "x86_64")
url='http://www.gog.com/game/shovel_knight'
license=('custom:commercial')
depends=('sdl2')
groups=('games')
source=("gog://${pkgname//-/_}_${pkgver}.sh" "${pkgname}.desktop")
sha512sums=('0aa037055fb440bbeec79f2bc3b743a9b145297921677fb4355d055801d2e5be8aadd6ac83b751ac0fa10fd13b30cd255ce5b867c321d3074a2b1021d85af1f7'
            'a30a86d218c1249aef5e4f8116d90b61913c74a0bb0629ef1a04c3736d2a3d1960d6b28d562aa83bbc49383594c55de346f9e1893e222e50bba6ebe0d8cd43fc')

# You need to download the gog.com installer file manually or with lgogdownloader.
DLAGENTS+=("gog::/usr/bin/echo %u - This is is not a real URL, you need to download the GOG file manually to \"$PWD\" or setup a gog:// DLAGENT. Read this PKGBUILD for more information.")

# Prevent compressing final package
PKGEXT='.pkg.tar'

prepare(){
    cd "$srcdir/data/noarch"
    [ $CARCH == "x86" ]    && rm -r "game/64"
    [ $CARCH == "x86_64" ] && rm -r "game/32"
    # The launcher expects the user to be in the game dir
    echo -e "#!/bin/sh\ncd /opt/${pkgname}\n./start.sh" > "${srcdir}/${pkgname}"
}

package() {
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
