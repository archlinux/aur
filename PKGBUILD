# Maintainer: Ainola

pkgname=gog-lovers-in-a-dangerous-spacetime
pkgver=2.3.0.5
pkgrel=1
pkgdesc="Only through teamwork can you triumph over the evil forces of Anti-Love."
url="http://www.loversinadangerousspacetime.com/"
license=('custom')
arch=('i686' 'x86_64')
depends=('gtk2')
depends_x86_64=('lib32-glib2')
depends_i686=('glib2')
source=("gog://${pkgname//-/_}_${pkgver}.sh"
        "${pkgname}.desktop")
sha256sums=('6e2dc7120f062e8f12040d77a6f3c760247c842bedef62b11ed6416d46765102'
            '996a51f45a1745d5641eab449efe5d3d0fa8d6786599ca997af493f7a7cb81d6')

# You need to download the gog.com installer file manually or with lgogdownloader.
DLAGENTS+=("gog::/usr/bin/echo %u - This is is not a real URL, you need to download the GOG file manually to \"$PWD\" or setup a gog:// DLAGENT. Read this PKGBUILD for more information.")

# Prevent compressing final package
PKGEXT='.pkg.tar'

prepare(){
    cd "$srcdir/data/noarch"
    [ $CARCH == "x86" ]    && rm -r "game/LoversInADangerousSpacetime.x86_64"
    [ $CARCH == "x86_64" ] && rm -r "game/LoversInADangerousSpacetime.x86"
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
