# Maintainer: James Zhu <james.zhu.engineer@gmail.com>

pkgname=gog-tis-100
pkgver=2.0.0.3
pkgrel=1
pkgdesc="The assembly language programming game you never asked for!"
url="http://www.zachtronics.com/tis-100/"
license=('custom')
arch=('i686' 'x86_64')
depends=('sdl2')
source=("gog://${pkgname//-/_}_${pkgver}.sh"
        "${pkgname}.desktop")
sha256sums=('e89421857a83ba0ac2fba7f813f2f8d85a6555351ba2bf7905e46fe170099a7f'
            'd2303362037e5aa3ffeb01d64b00ffb5160034d88c381e755730827566c7c9d6')

# You need to download the gog.com installer file manually or with lgogdownloader.
DLAGENTS+=("gog::/usr/bin/echo %u - This is is not a real URL, you need to download the GOG file manually to \"$PWD\" or setup a gog:// DLAGENT. Read this PKGBUILD for more information.")

prepare(){
    # Unzip will produce an error code because it is unable to unzip the Installer.
    # Therefore, a conditional into a no-op command will keep the PKGBUILD from failing
    # Of course, if you have any real problems unzipping the PKGBUILD will not abort.
    unzip "${pkgname//-/_}_${pkgver}.sh" || :
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
