# Maintainer: Swix

pkgname=gog-terraria
pkgver=2.17.0.21
pkgrel=1
pkgdesc="The very world is at your fingertips as you fight for survival, fortune, and glory."
url="http://terraria.org/"
license=('custom')
arch=('i686' 'x86_64')
depends=('sdl2')
# If Firejail is installed, this application will be sandboxed automatically.
optdepends=('firejail: Automatically sandbox this application from your OS')
source=("gog://${pkgname//-/_}_${pkgver}.sh"
        "${pkgname}.desktop"
        "$pkgname")
sha256sums=('630469066fafb8ab8c105f835d74be81b528095065fcfac871bd4e6eb5e62b5e'
            '815bf359c2828cdefee1e33a978a84a2ebb538450197a5792b62e382ae3e3093'
            '939f39e8b8cbb30ae95648d299008df030b6c6e8e583893da1916e024b493e5b')

# You need to download the gog.com installer file manually or with lgogdownloader.
DLAGENTS+=("gog::/usr/bin/echo %u - This is is not a real URL, you need to download the GOG file manually to \"$PWD\" or setup a gog:// DLAGENT. Read this PKGBUILD for more information.")

# Prevent compressing final package
PKGEXT='.pkg.tar'

prepare(){
    # Unzip will produce an error code because it is unable to unzip the Installer.
    # Therefore, a conditional into a no-op command will keep the PKGBUILD from failing
    # Of course, if you have any real problems unzipping the PKGBUILD will not abort.
    unzip -d "${srcdir}/terraria" "${pkgname//-/_}_${pkgver}.sh" || :
}

package(){
    cd "${srcdir}/terraria/data/noarch"

    # Install game
    install -d "${pkgdir}/opt/${pkgname}/"
    install -d "${pkgdir}/opt/${pkgname}/support"
    install -d "${pkgdir}/usr/bin/"

    cp -r "game/" "${pkgdir}/opt/${pkgname}/"
    find "${pkgdir}/opt/${pkgname}/" -type d -exec chmod 755 "{}" \;
    install -Dm755 "start.sh" \
        "${pkgdir}/opt/${pkgname}/"
    install -Dm755 support/*.{sh,shlib} -t \
        "${pkgdir}/opt/${pkgname}/support"
    install -Dm644 gameinfo \
        "${pkgdir}/opt/${pkgname}/gameinfo"

    # Desktop integration
    install -Dm644 "support/icon.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "docs/End User License Agreement.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "${srcdir}/${pkgname}" \
        "${pkgdir}/usr/bin/${pkgname}"
}
