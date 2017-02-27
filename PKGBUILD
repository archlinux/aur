# Maintainer: Patrice Peterson <runiq@archlinux.us>

pkgname=gog-rogue-legacy
pkgver=2.0.0.2
pkgrel=1
pkgdesc="A genealogical \"roguelite\" where anyone can be a hero"
url="http://www.cellardoorgames.com/roguelegacy"
license=('custom')
arch=('i686' 'x86_64')
# If Firejail is installed, this application will be sandboxed automatically.
optdepends=('firejail: Automatically sandbox this application from your OS')
source=("gog://${pkgname//-/_}_${pkgver}.sh"
        "${pkgname}.desktop"
        "$pkgname")
sha256sums=('ebf34ce765194a33c8923c127276a65774baf714cddcfb8dcf5bf9e2c707a413'
            'e59c63da334add041e2f8206e61fd916e00c25aea17d2492eb1102a60ad59087'
            '34f01b60634a6c1c2eb130cfec70257e9586619580c733d0376a8df677f20bec')

# You need to download the gog.com installer file manually or with lgogdownloader.
DLAGENTS+=("gog::/usr/bin/echo %u - This is is not a real URL, you need to download the GOG file manually to \"$PWD\" or setup a gog:// DLAGENT. Read this PKGBUILD for more information.")

# Prevent compressing final package
PKGEXT='.pkg.tar'

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
