# Maintainer:   Nascher <kevin@nascher.org>
# Contributor:  Ludovic LE ROUX <bojurama12@yahoo.com>

# This package is based on the gog-terraria package and the gog-freedom-planet package from Ainola.

suffix=_treasure_trove

pkgname=gog-shovel-knight
pkgver=2.8.0.10
pkgrel=1
pkgdesc='Yacht Club Games'
arch=("i686" "x86_64")
url='http://www.gog.com/game/shovel_knight'
license=('custom:commercial')
depends=('sdl2')
groups=('games')
source=("gog://${pkgname//-/_}${suffix}_${pkgver}.sh" "${pkgname}.desktop")
sha512sums=('5b48afc6cfc5e2e531a5fc1314466fd5f20abc1b61e8502a3093b0acb0fb2554ffdf1b0c9da5aca5109a471e14700f37c90bbae09b5048626807cd710583e0c4'
            'a30a86d218c1249aef5e4f8116d90b61913c74a0bb0629ef1a04c3736d2a3d1960d6b28d562aa83bbc49383594c55de346f9e1893e222e50bba6ebe0d8cd43fc')

# You need to download the gog.com installer file manually or with lgogdownloader.
DLAGENTS+=("gog::/usr/bin/echo %u - This is is not a real URL, you need to download the GOG file manually to \"$PWD\" or setup a gog:// DLAGENT. Read this PKGBUILD for more 
information.")

# If you want to use lgogdownloader
# DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
# source=("gogdownloader://shovel-knight/en3installer4" "${pkgname}.desktop")
#
# You can drop the file to the directory, where the PKGBUILD is and
# remove the "gog://" from the source.
# Example: "${pkgname//-/_}_${pkgver}.sh"


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
