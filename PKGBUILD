# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=codius
pkgname="vs${_appname}-bin"
_pkgname=VSCodius
pkgver=1.95.1
_electronversion=32
pkgrel=1
pkgdesc="Binary releases of Visual Studio Code without MS branding/telemetry/licensing and various personal workflow improvements.Prebuilt version."
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
makedepends=(
    'gendesk'
)
options=('!strip')
noextract=("${pkgname%-bin}-${pkgver}.zip")
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}-Linux-x64-${pkgver}.zip"
    "LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/RubisetCie/vscodius/v${pkgver}/LICENSE.txt"
)
sha256sums=('179f4209e6ef8408120c4d245c30f67449f2464bbc0347a4ad3523bd8559dda4'
            '9480271317925265e806a9a196aaa33410a962fa9d4d1e248a4a5187bc8c9df9')
build() {
    gendesk -f -n -q --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Development" --name="${_pkgname}" --exec="${pkgname%-bin}"
    install -Dm755 -d "${srcdir}/usr/lib/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${srcdir}/usr/lib/${pkgname%-bin}"
    chmod +x "${srcdir}/usr/lib/${pkgname%-bin}/${_appname}"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/bin"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib" "${pkgdir}/usr"
    ln -sf "/usr/lib/${pkgname%-bin}/${_appname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/completions/bash/${_appname}" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/completions/zsh/_${_appname}" -t "${pkgdir}/usr/share/zsh/functions/Completion/Zsh/_${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
