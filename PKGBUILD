# Maintainer: Théo Martel <marteltheo@gmail.com>
# Heavily borrowed from James Zhu's GOG packages

pkgname=gog-into-the-breach
_name=into-the-breach
pkgver=1.2.24.38624
pkgrel=1
pkgdesc="Mecha turn based strategy game (GOG version)"
url="http://subsetgames.com/itb.html"
license=('custom')
arch=('i686' 'x86_64')
depends=('sdl2')
source=("gog://${_name//-/_}_${pkgver//./_}.sh"
        "${pkgname}.desktop")
sha256sums=('16dce36cc511b4a838dda27384dbe662a25612dc1187d2ec7f1336f9d95b32d5'
            'f1217b1fa26bf9fa1cf4c3f6fce23bc7f989e0d1396adfad8f5d0a6d31b5eaef')

PKGEXT='.pkg.tar'

# You need to download the gog.com installer file manually or with lgogdownloader.
DLAGENTS+=("gog::/usr/bin/echo %u - This is is not a real URL, you need to download the GOG file manually to \"$PWD\" or setup a gog:// DLAGENT. Read this PKGBUILD for more information.")

prepare(){
    # Unzip will produce an error code because it is unable to unzip the Installer.
    # Therefore, a conditional into a no-op command will keep the PKGBUILD from failing
    # Of course, if you have any real problems unzipping the PKGBUILD will not abort.
    unzip "${_name//-/_}_${pkgver}.sh" || :
    cd "${srcdir}/data/noarch"

    sed -r -i \
    's/(CURRENT_DIR="\$\( cd "\$\( dirname )'`
      `'"\$\{BASH_SOURCE\[0\]\}"(.*$)'`
      `'/\1$( readlink -nf "${BASH_SOURCE[0]}" )\2/' \
    "start.sh"
}

package(){
    cd "${srcdir}/data/noarch"
    # Install game
    install -d "${pkgdir}/opt/${pkgname}/"
    install -d "${pkgdir}/opt/${pkgname}/support"
    install -d "${pkgdir}/usr/bin/"
    cp -r "game/" "${pkgdir}/opt/${pkgname}/"
    chmod -R 666 "${pkgdir}/opt/${pkgname}/game/resources/"
    install -Dm755 "start.sh" "${pkgdir}/opt/${pkgname}/"
    install -Dm644 "gameinfo" "${pkgdir}/opt/${pkgname}/"
    install -Dm755 support/*.{sh,shlib} -t "${pkgdir}/opt/${pkgname}/support"

    # Desktop integration
    install -Dm 644 "support/icon.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "docs/End User License Agreement.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    ln -s "/opt/${pkgname}/start.sh" "${pkgdir}/usr/bin/${pkgname}"
}
 
