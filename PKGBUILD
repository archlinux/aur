# Maintainer: Ainola

pkgname=gog-hyper-light-drifter
pkgver=2.6.0.7
pkgrel=1
pkgdesc="Explore a beautiful, vast and ruined world riddled with unknown dangers and lost technologies."
url="http://www.heart-machine.com/"
license=('custom')
arch=('i686' 'x86_64')
depends=('gtk2')
depends_x86_64=('lib32-glib2')
depends_i686=('glib2')
source=("gog://${pkgname//-/_}_${pkgver}.sh"
        "${pkgname}.desktop")
sha256sums=('6f7b7d70ae5fe28c9e45f9f0e6e8d084477bc6803eae7db323b21a7ae50f8636'
            '12d8e225fb307ec3e1fd4507a3113b23e32721edcd365ad94864557ef5ebcd14')

# You need to download the gog.com installer file manually or with lgogdownloader.
DLAGENTS+=("gog::/usr/bin/echo %u - This is is not a real URL, you need to download the GOG file manually to \"$PWD\" or setup a gog:// DLAGENT. Read this PKGBUILD for more information.")

# Prevent compressing final package
PKGEXT='.pkg.tar'

prepare(){
    cd "$srcdir/data/noarch"
    [ $CARCH == "x86" ]    && rm -r "game/HyperLightDrifter.x86_64"
    [ $CARCH == "x86_64" ] && rm -r "game/HyperLightDrifter.x86"
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
    # using straight cp on the supplied tarball tends to have screwy permissions
    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;
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
