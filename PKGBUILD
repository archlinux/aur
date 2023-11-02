# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chatd
pkgver=1.0.0
_ollamaver=0.1.7
pkgrel=1
pkgdesc="Chat with your documents using local AI"
arch=('x86_64')
url="https://chatd.ai/"
_ghurl="https://github.com/BruceMacD/chatd"
_ollamaurl="https://github.com/jmorganca/ollama"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'bash'
    'electron24'
    'hicolor-icon-theme'
    'libvips'
)
makedepends=(
    'gendesk'
    'npm'
    'nodejs>=18'
)
source=(
    "${pkgname}-${pkgver}.zip::${_ghurl}/archive/refs/tags/v${pkgver}.zip"
    "ollama-${_ollamaver}::${_ollamaurl}/releases/download/v${_ollamaver}/ollama-linux-amd64"
    "${pkgname}.sh"
)
sha256sums=('a0bad114958419c22ef5ab40ff5e8e96a8a408f31050decc7feeaa89bdff01bf'
            'fcaeb0dbb5ef834b40ae32c177deed39a8a79e280305c6195a84fa70b525b844')
build() {
    gendesk -f -n -q --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "${srcdir}/ollama-${_ollamaver}" "${srcdir}/${pkgname}-${pkgver}/src/service/ollama/runners/ollama-linux-x64"
    sed '19,22d' -i forge.config.js
    npm install
    npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    ln -sf "/usr/lib/${pkgname}/src/service/ollama/runners/ollama-linux-x64" "${pkgdir}/usr/bin/ollama"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/out/${pkgname}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 128x128 256x256 512x512;do
      install -Dm644 "${srcdir}/${pkgname}-${pkgver}/public/${pkgname}.iconset/icon_${_icons}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644  "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
