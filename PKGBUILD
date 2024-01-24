# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=codius
pkgname="vs${_appname}-bin"
_pkgname=VSCodius
pkgver=1.85.2
_electronversion=25
pkgrel=2
pkgdesc="Binary releases of Visual Studio Code without MS branding/telemetry/licensing and various personal workflow improvements."
arch=('x86_64')
url="https://github.com/RubisetCie/vscodius"
license=('MIT')
provides=(
    "${pkgname%-bin}=${pkgver}"
    'code'
)
conflicts=(
    "${pkgname%-bin}"
    'code'
)
depends=(
    "electron${_electronversion}"
    'libxkbfile'
)
makedepends=(
    'gendesk'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}-Linux-x64-${pkgver}.zip"
    "LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/RubisetCie/vscodius/v${pkgver}/LICENSE.txt"
    "${pkgname%-bin}.sh"
)
sha256sums=('65c0d3e82f08ff0caea8e9a560dddb48d8f78f696b6bcea92e67efd5a2794fb9'
            '9480271317925265e806a9a196aaa33410a962fa9d4d1e248a4a5187bc8c9df9'
            '08f4674b451d8aed830ed3a04b1071b214ea442ee4e56b6f673549fbcd38dc57')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -f -n -q --pkgname "vs${_appname}-bin" --categories "Development" --name "${_pkgname}" --exec "${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/resources/completions/bash/${_appname}" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
    install -Dm644 "${srcdir}/resources/completions/zsh/_${_appname}" -t "${pkgdir}/usr/share/zsh/functions/Completion/Zsh/_${pkgname%-bin}"
    install -Dm644 "${srcdir}/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}