# Maintainer: James Zhu <james.zhu.engineer@gmail.com>

pkgname=gog-ftl
_name=gog-ftl-advanced-edition
pkgver=2.0.0.2
pkgrel=1
pkgdesc="Spaceship simulation roguelike-like (GOG version). Take your ship and crew through a randomly generated galaxy filled with glory and bitter defeat."
url="http://subsetgames.com/ftl.html"
license=('custom')
arch=('i686' 'x86_64')
depends=('sdl2')
source=("gog://${_name//-/_}_${pkgver}.sh"
        "${pkgname}.desktop")
sha256sums=('bda9a40e1ce857eaa9102fe9c0ec405d94c8a120657b5fab29315e70f63cc5ae'
            'e78e5e92de0677770ecbc981acccef10766bcb3c384b50da60a3dfa3b217de16')

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
    chmod -R 666 "${pkgdir}/opt/${pkgname}/game/data/resources/"
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
