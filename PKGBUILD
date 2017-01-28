# Maintainer: Krakn - Dan.Ray.Beste@gmail.com
# Thanks to: Ainola for the base PKGBUILD (gog-undertale)

pkgname=gog-stardew-valley
pkgver=2.3.0.4
pkgrel=1
pkgdesc="You’ve inherited your grandfather’s old farm plot in Stardew Valley. Armed with hand-me-down tools and a few coins, you set out to begin your new life."
url="http://stardewvalley.net/"
license=('custom')
arch=('i686' 'x86_64')
depends_x86_64=("sdl2" "openal")
depends_i686=("lib32-openal" "lib32-sdl2")
# If Firejail is installed, this application will be sandboxed automatically.
optdepends=('firejail: Automatically sandbox this application from your OS')
source=(
    "gog://${pkgname//-/_}_${pkgver}.sh"
    "${pkgname}.desktop"
    "$pkgname"
)
sha256sums=(
    "88e1fae7226c7bfa91cb28c137c24867e12b1a0b6e824e6ffe73e1eefc166aac"
    "1dc48ca70b7274c065ee65e285102b07962096b650a34a898d10d6749039d3ca"
    "c17ec2da9bc6df0c15611877033553275bc775ea318c0be4f745efcdfb9b22d1"
)

# You need to download the gog.com installer file manually or with lgogdownloader.
DLAGENTS+=("gog::/usr/bin/echo %u Download the GOG file to \"$PWD\" or set up a gog:// DLAGENT.")

# Prevent compressing final package
PKGEXT=".pkg.tar"

package(){
    cd "${srcdir}"

    # Install game
    install -d "${pkgdir}/opt/${pkgname}/"
    install -d "${pkgdir}/opt/${pkgname}/support"
    install -d "${pkgdir}/usr/bin/"
    cp -r "data/noarch/game/" "${pkgdir}/opt/${pkgname}/"
    

    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;
    install -Dm755 "data/noarch/start.sh"               \
        "${pkgdir}/opt/${pkgname}/"
    install -Dm755 data/noarch/support/*.{sh,shlib} -t  \
        "${pkgdir}/opt/${pkgname}/support"

    # Desktop integration
    install -Dm 644 "data/noarch/support/icon.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "data/noarch/docs/End User License Agreement.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
