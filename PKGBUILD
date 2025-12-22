# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=flashorama-bin
_pkgname=Flashorama
pkgver=1.3.2
_electronversion=11
pkgrel=1
pkgdesc="Heaventy's Flashorama Electron App (Based on NewCP-App).(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://flashorama.heaventy-projects.fr/"
_ghurl="https://github.com/DarkShoro/HeaventyFlashorama"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'python-setuptools'
)
options=(
    "!strip"
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('e7b7cd15f8f16c1f7bd07ec072e10bb57965b15c1835a59a70094c9a7cc2b52c'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/usr/lib/${_pkgname}/${_pkgname}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    _get_electron_version
    sed -e "
        s/${_pkgname} %U/${pkgname%-bin} %U/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
        s/Utility/Game/g
    " -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    rm -rf "${srcdir}/usr/lib/${_pkgname}/resources/app/lib/PepperFlashPlayer.plugin/Contents/MacOS"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${_pkgname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib/${_pkgname}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/lib/${_pkgname}/resources/app/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}