# Maintainer: Ainola

pkgname=gog-stardew-valley
pkgver=2.3.0.4
pkgrel=1
pkgdesc="An open-ended country-life RPG"
url="http://stardewvalley.net"
license=('custom')
arch=('i686' 'x86_64')
depends=('sdl2')
source=("gog://${pkgname//-/_}_${pkgver}.sh"
        "${pkgname}.desktop")
sha256sums=('88e1fae7226c7bfa91cb28c137c24867e12b1a0b6e824e6ffe73e1eefc166aac'
            'eb5f427f4698ac99a0b2c05f08530ef2cc0d7f90090ae93b3efa29f27b8f431b')

# You need to download the gog.com installer file manually or with lgogdownloader.
DLAGENTS+=("gog::/usr/bin/echo %u - This is is not a real URL, you need to download the GOG file manually to \"$PWD\" or setup a gog:// DLAGENT. Read this PKGBUILD for more information.")

# Prevent compressing final package
PKGEXT='.pkg.tar'

prepare(){
    # Unzip will produce an error code because it is unable to unzip the Installer.
    # Therefore, a conditional into a no-op command will keep the PKGBUILD from failing
    # Of course, if you have any real problems unzipping the PKGBUILD will not abort.
    unzip -d "${srcdir}/stardew-valley" "${pkgname//-/_}_${pkgver}.sh" || :
    cd "${srcdir}/stardew-valley/data/noarch"

    sed -r -i \
    's/(CURRENT_DIR="\$\( cd "\$\( dirname )'`
      `'"\$\{BASH_SOURCE\[0\]\}"(.*$)'`
      `'/\1$( readlink -nf "${BASH_SOURCE[0]}" )\2/' \
    "start.sh"
}

package(){
    cd "${srcdir}/stardew-valley/data/noarch"
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
