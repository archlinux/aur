# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=codius
pkgname="vs${_appname}-bin"
_pkgname=VSCodius
pkgver=1.96.2
_electronversion=32
pkgrel=1
pkgdesc="Binary releases of Visual Studio Code without MS branding/telemetry/licensing and various personal workflow improvements.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/RubisetCie/vscodius"
license=('MIT')
provides=(
    "${pkgname%-bin}=${pkgver}"
    "code=${pkgver}"
)
conflicts=(
    "${pkgname%-bin}"
)
depends=(
    'libxkbfile'
    'gtk3'
    'nspr'
    'alsa-lib'
    'nss'
    'nodejs'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}-el8.${CARCH}.rpm"
    "LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/RubisetCie/vscodius/v${pkgver}/LICENSE.txt"
)
sha256sums=('28e42fc2af7e593cf9065b65d0b4974dbb068dc8ba21bedf673362dade6385b0'
            '9480271317925265e806a9a196aaa33410a962fa9d4d1e248a4a5187bc8c9df9')
prepare() {
    sed -i "s/\/usr\/share\/${_appname}\/${_appname}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/"*.desktop
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname%-bin}"}
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/codius/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/${_appname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/bash-completion/completions/${_appname}" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/zsh/site-functions/_${_appname}" -t "${pkgdir}/usr/share/zsh/functions/Completion/Zsh/_${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/"*.desktop -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/appdata/${_appname}.appdata.xml" "${pkgdir}/usr/share/appdata/${pkgname%-bin}.appdata.xml"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}