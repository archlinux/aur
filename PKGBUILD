# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chatd-bin
pkgver=1.0.1
pkgrel=2
pkgdesc="Chat with your documents using local AI"
arch=('x86_64')
url="https://chatd.ai/"
_ghurl="https://github.com/BruceMacD/chatd"
_ollmaurl="https://github.com/jmorganca/ollama"
_ollmaver=0.1.12
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'electron24'
    'hicolor-icon-theme'
    'libvips'
    'python'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64.zip"
    "ollama-linux-${_ollmaver}::${_ollmaurl}/releases/download/v${_ollmaver}/ollama-linux-amd64"
    "${pkgname%-bin}.sh"
)
sha256sums=('d403be8aa8a26ec555db850efbc59277ec57e0d4f393795919d9b125029e2a2d'
            'a890d66c37621aed531dc7795fa62b2ac1b8bebcce87f56c5cef35b026a3ad0f'
            'fcaeb0dbb5ef834b40ae32c177deed39a8a79e280305c6195a84fa70b525b844')
build() {
    gendesk -f -n -q --categories "Utility" --name "${pkgname%-bin}" --exec "${pkgname%-bin}"
    install "${srcdir}/ollama-linux-${_ollmaver}" "${srcdir}/${pkgname%-bin}-linux-x64/resources/app/src/service/ollama/runners/ollama-linux"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/app/src/service/ollama/runners/ollama-linux" "${pkgdir}/usr/bin/ollama"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 128x128 256x256 512x512;do
      install -Dm644 "${srcdir}/${pkgname%-bin}-linux-x64/resources/app/public/${pkgname%-bin}.iconset/icon_${_icons}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644  "${srcdir}/${pkgname%-bin}-linux-x64/resources/app/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}