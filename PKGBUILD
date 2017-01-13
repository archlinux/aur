# Maintainer: Ainola

pkgname=gog-lovers-in-a-dangerous-spacetime
pkgver=2.8.0.10
pkgrel=2
pkgdesc="Only through teamwork can you triumph over the evil forces of Anti-Love."
url="http://www.loversinadangerousspacetime.com/"
license=('custom')
arch=('i686' 'x86_64')
depends=('gtk2')
depends_x86_64=('lib32-glib2')
depends_i686=('glib2')
# If Firejail is installed, this application will be sandboxed automatically.
optdepends=('firejail: Automatically sandbox this application from your OS')
source=("gog://${pkgname//-/_}_${pkgver}.sh"
        "${pkgname}.desktop"
        "$pkgname")
sha256sums=('e18bb73920ddd6678f40dfaba0d3f7159098ee557f95b50518b460915d572007'
            '996a51f45a1745d5641eab449efe5d3d0fa8d6786599ca997af493f7a7cb81d6'
            '0bc91599f0d4e38a6a29e03be97994204e278dfb8d0e802ac771f96d72f76773')

# You need to download the gog.com installer file manually or with lgogdownloader.
DLAGENTS+=("gog::/usr/bin/echo %u - This is is not a real URL, you need to download the GOG file manually to \"$PWD\" or setup a gog:// DLAGENT. Read this PKGBUILD for more information.")

# Prevent compressing final package
PKGEXT='.pkg.tar'

prepare(){
    cd "$srcdir/data/noarch"
    [ $CARCH == "x86" ]    && rm -r "game/LoversInADangerousSpacetime.x86_64"
    [ $CARCH == "x86_64" ] && rm -r "game/LoversInADangerousSpacetime.x86"
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
    install -Dm644 data/noarch/gameinfo "$pkgdir/opt/$pkgname/gameinfo"

    # Desktop integration
    install -Dm644 "data/noarch/support/icon.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "data/noarch/docs/End User License Agreement.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
