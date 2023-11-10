# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hype
_pkgname=Hype
pkgver=1.0.15
pkgrel=2
pkgdesc="Find Hype moments from Twitch.tv"
arch=('x86_64')
url="https://hype.lol/"
_ghurl="https://github.com/TimIsOverpowered/Hype"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'dbus'
    'alsa-lib'
    'libxfixes'
    'libxdamage'
    'pango'
    'gtk3'
    'libcups'
    'cairo'
    'at-spi2-core'
    'expat'
    'nspr'
    'libxext'
    'libxcb'
    'libxcomposite'
    'libdrm'
    'libxkbcommon'
    'mesa'
    'nss'
    'libxrandr'
    'libx11'
)
makedepends=(
    'gendesk'
    'npm'
    'nodejs'
)
source=("${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4f9b3b9699c4c6a9910c5b4e96422e0fc91a59d30ee714e96159673e0bfc5596')
build() {
    gendesk -q -f -n --categories "AudioVideo;Utility" --name "${_pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${_pkgname}-${pkgver}"
    npm install
    npm run package
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/${pkgname%-bin},usr/bin}
    cp -r "${srcdir}/${_pkgname}-${pkgver}/out/${_pkgname}-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/build/favicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}