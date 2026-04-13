# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=altarik-launcher-bin
_pkgname=Altarik-Launcher
pkgver=2.3.3
_electronversion=40
pkgrel=1
pkgdesc="A Minecraft custom launcher developped to launch the game with our own modpack.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://altarik.fr/"
_ghurl="https://github.com/AltarikMC/Launcher"
license=("BSD-3-Clause")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'imagemagick'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/${pkgver}/${_pkgname//-/.}-linux-x64-${pkgver}.zip"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/AltarikMC/Launcher/${pkgver}/LICENSE"
    "${pkgname%-bin}-${pkgver}.ico::https://raw.githubusercontent.com/AltarikMC/Launcher/${pkgver}/icon.ico"
    "${pkgname%-bin}.sh"
)
sha256sums=('d42103f478f4321a176c006a29f3a1c67a86bea3174bab6b94ec9d32ac9733f0'
            '3a3a7d8474ca58bf2620f0a95275445faf654df7d4061afc209458b5fc8f8a2c'
            '5dbc783060b213ca39548ace82bbc9a2ffa35031b70728027a7a8e14dad2260a'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/${_pkgname//-/ }-linux-x64/${_pkgname//-/ }" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    magick "${srcdir}/${pkgname%-bin}-${pkgver}.ico" "${srcdir}/${pkgname%-bin}.png"
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Game" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/${_pkgname//-/ }-linux-x64/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/${_pkgname//-/ }-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-6.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
