# Maintainer: Ainola

pkgname=gog-freedom-planet
pkgver=2.2.0.6
pkgrel=1
pkgdesc="A combat-based platform adventure that pits a spunky dragon girl and her friends against an alien attack force."
url="http://freedomplanet.galaxytrail.com/"
license=('custom')
arch=('i686' 'x86_64')
source=("gog://gog_freedom_planet_${pkgver}.sh"
        "${pkgname}.desktop")
sha256sums=('6c09b0c768424c65638c842fa19b9d051dc2ae43cf956f6aab76f305ab76a912'
            'a6545600bb9af6aa24fe25b85366690930d8725477638aebb0c0220c836fe53f')
install="${pkgname}.install"

# You need to download the gog.com installer file manually or with lgogdownloader.
DLAGENTS+=("gog::/usr/bin/echo %u - This is is not a real URL, you need to download the GOG file manually to \"$PWD\" or setup a gog:// DLAGENT. Read this PKGBUILD for more information.")

# Prevent compressing final package
PKGEXT='.pkg.tar'

prepare(){
    cd "$srcdir/data/noarch"
    [ $CARCH == "x86" ]    && rm -r "game/bin64"
    [ $CARCH == "x86_64" ] && rm -r "game/bin32"
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
