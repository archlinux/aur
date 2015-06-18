# Maintainer: Ainola

pkgname=gog-freedom-planet
pkgver=1.0.0.3
pkgrel=2
pkgdesc="Freedom Planet is a combat-based platform adventure that pits a spunky dragon girl and her friends against an alien attack force."
url="http://freedomplanet.galaxytrail.com/"
license=('custom')
arch=('i686' 'x86_64')
source=("gog://gog_freedom_planet_${pkgver}.tar.gz")
sha256sums=('6e1aa64edc14abd2594afe1acd160d6e0f3e3e910304ce254b33fe71634b963e')
install=("${pkgname}.install")

# You need to download the gog.com installer file manually or with lgogdownloader.
DLAGENTS+=("gog::/usr/bin/echo %u - This is is not a real URL, you need to download the GOG file manually to \"$PWD\" or setup a gog:// DLAGENT. Read this PKGBUILD for more information.")

# Prevent compressing final package
PKGEXT='.pkg.tar'

prepare(){
    cd "${srcdir}/Freedom Planet"
    [ $CARCH == "x86" ]    && rm -r "game/bin64"
    [ $CARCH == "x86_64" ] && rm -r "game/bin32"

    sed -r -i \
        's/(declare -r CURRENT_DIR="\$\( cd "\$\( dirname )'`
          `'"\$\{BASH_SOURCE\[0\]\}"(.*$)'`
          `'/\1$( readlink -nf "${BASH_SOURCE[0]}" )\2/' \
        "start.sh"
}

package(){
    cd "${srcdir}/Freedom Planet"
    # Install game
    install -d "${pkgdir}/opt/${pkgname}/"
    install -d "${pkgdir}/opt/${pkgname}/support"
    install -d "${pkgdir}/usr/bin/"
    cp -r "game/" "${pkgdir}/opt/${pkgname}/"
    install -Dm755 "start.sh" \
        "${pkgdir}/opt/${pkgname}/"
    install -Dm755 support/*.{sh,shlib} -t \
        "${pkgdir}/opt/${pkgname}/support"

    # Desktop integration
    install -Dm 644 "support/${pkgname}.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "docs/End User License Agreement.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 "support/${pkgname}-primary.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    ln -s "/opt/${pkgname}/start.sh" "${pkgdir}/usr/bin/${pkgname}"
}
