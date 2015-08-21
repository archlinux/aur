# Maintainer:   Nascher <kevin at nascher dot org>
# Contributor:  Ludovic LE ROUX <bojurama12@yahoo.com>

# This package is based on the gog-terraria package from Ainola.

pkgname=gog-shovel-knight
pkgver=2.3.0.5
pkgrel=1
pkgdesc="Yacht Club Games"
arch=("i686" "x86_64")
url="http://www.gog.com/game/shovel_knight"
license=('custom:commercial')
depends=('sdl2')
groups=("games")
source=("gog://${pkgname//-/_}_${pkgver}.sh" "${pkgname}.desktop")
sha512sums=('7c4d8329acd2ee8fe05551e34a9d2de5181b03c08480871938741f8b53b876ab58bf5261d75817a3931f49f695a5aa7a75e2bf1e946fb923636566c333a6e679'
            'a30a86d218c1249aef5e4f8116d90b61913c74a0bb0629ef1a04c3736d2a3d1960d6b28d562aa83bbc49383594c55de346f9e1893e222e50bba6ebe0d8cd43fc')

# You need to download the gog.com installer file manually or with lgogdownloader.
DLAGENTS+=("gog::/usr/bin/echo %u - This is is not a real URL, you need to download the GOG file manually to \"$PWD\" or setup a gog:// DLAGENT. Read this PKGBUILD for more information.")

# Prevent compressing final package
PKGEXT='.pkg.tar'

prepare(){
    # Unzip will produce an error code because it is unable to unzip the Installer.
    # Therefore, a conditional into a no-op command will keep the PKGBUILD from failing
    # Of course, if you have any real problems unzipping the PKGBUILD will not abort.
    unzip -d "${srcdir}/shovel-knight" "${pkgname//-/_}_${pkgver}.sh" || :
    cd "${srcdir}/shovel-knight/data/noarch"

    # We must `cd` to the install dir before launching since the /usr/bin/
    # launcher is merely a link. It expects a certain folder structure.
#    sed -r -i \
#        's/(declare -r CURRENT_DIR="\$\( cd "\$\( dirname )'`
#          `'"\$\{BASH_SOURCE\[0\]\}"(.*$)'`
#          `'/\1$( readlink -nf "${BASH_SOURCE[0]}" )\2/' \
#        "start.sh"
    sed -r -i \
        's/(CURRENT_DIR="\$\( cd "\$\( dirname )'`
          `'"\$\{BASH_SOURCE\[0\]\}"(.*$)'`
          `'/\1$( readlink -nf "${BASH_SOURCE[0]}" )\2/' \
        "start.sh"
}

package() {
    cd "${srcdir}/shovel-knight/data/noarch"
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
    install -Dm 644 "support/icon.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "docs/End User License Agreement.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    ln -s "/opt/${pkgname}/start.sh" "${pkgdir}/usr/bin/${pkgname}"
} 
