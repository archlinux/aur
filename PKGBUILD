# Maintainer: Krakn - Dan.Ray.Beste@gmail.com
# Thanks to: Ainola for the base PKGBUILD (gog-undertale)

# All dependencies are included with the gog_owlboy_$version.sh file.
# For good measure I was able to track all but 2 down:
#   libCSteamworks - ??? Not entirely sure what this provides...
#   libsteam_api - ??? Not entirely sure what this provides...

pkgname=gog-stardew-valley
pkgver=2.3.0.4
pkgrel=1
pkgdesc="You’ve inherited your grandfather’s old farm plot in Stardew Valley. Armed with hand-me-down tools and a few coins, you set out to begin your new life."
url="http://stardewvalley.net/"
license=(
    'custom'
)
arch=(
    'i686'
    'x86_64'
)
depends_x86_64=(
    'openal'
    'sdl2'
)
depends_i686=(
    'lib32-openal'
    'lib32-sdl2'
)
optdepends=(
    'firejail: Automatically sandbox this application from your OS'
)
source=(
    "gog://${pkgname//-/_}_${pkgver}.sh"
    "${pkgname}.desktop"
    "${pkgname}"
)
sha256sums=(
    '88e1fae7226c7bfa91cb28c137c24867e12b1a0b6e824e6ffe73e1eefc166aac'
    '1dc48ca70b7274c065ee65e285102b07962096b650a34a898d10d6749039d3ca'
    '7e03458fab2b426cce514a42663e56efd33d072bd319f513a5c8bdf7f4e09905'
)
DLAGENTS+=(
    "gog::/usr/bin/echo %u Download the GOG file to ${PWD} or set up a gog:// DLAGENT."
)

package() {
    cd "${srcdir}"

    # Install game
    install -d "${pkgdir}/opt/${pkgname}/"
    install -d "${pkgdir}/opt/${pkgname}/support"
    install -d "${pkgdir}/usr/bin/"
    cp -r "data/noarch/game/" "${pkgdir}/opt/${pkgname}/"
    

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
    install -Dm755 "${srcdir}/${pkgname}" \
        "${pkgdir}/usr/bin/${pkgname}"
}
