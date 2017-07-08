# Maintainer: Ainola

pkgname=gog-hyper-light-drifter
pkgver=2.7.0.8
pkgrel=1
pkgdesc="Explore a beautiful, vast and ruined world riddled with unknown dangers and lost technologies."
url="http://www.heart-machine.com/"
license=('custom')
arch=('i686' 'x86_64')
depends=('gtk2')
depends_x86_64=('lib32-glu' 'lib32-alsa-lib' 'lib32-gtk2' 'lib32-openal')
depends_i686=('glu' 'alsa-lib' 'gtk2' 'openal')
# If Firejail is installed, this application will be sandboxed automatically.
optdepends=('firejail: Automatically sandbox this application from your OS')
source=("gog://${pkgname//-/_}_${pkgver}.sh"
        "${pkgname}.desktop"
        "$pkgname")
sha256sums=('26d8e936846330f1572b24566bc03e1d33625fb6b3d880a6f6908580917adaa0'
            '12d8e225fb307ec3e1fd4507a3113b23e32721edcd365ad94864557ef5ebcd14'
            'd828f819954ad4c66fbbaa3e6bce93e4e7b7af63e22ede3f391b9457a6b9891c')

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
