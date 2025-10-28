# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=ytm-dlp
pkgname="${_pkgname}-gui-bin"
pkgver=1.3.4
_electronversion=26
pkgrel=1
pkgdesc="An ElectronJS app for downloading music off Youtube Music.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/RENOMIZER/ytm-dlp-gui"
license=('Unlicense')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}-${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/RENOMIZER/ytm-dlp-gui/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('1fcbd01b2b355490e8a0105fd36d8e75d4e70a5d5f72cf6bdbe6d398f355388e'
            'f3f3a28ea1857068409ba80b8a2bd033dcf91d8889a37652425bdb6f6250cd79'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/usr/lib/${_pkgname}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    _get_electron_version
    sed -i "s/Audio;/AudioVideo;/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
