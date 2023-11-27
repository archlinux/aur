# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chatd
pkgver=1.0.1
pkgrel=2
pkgdesc="Chat with your documents using local AI"
arch=('x86_64')
url="https://chatd.ai/"
_ghurl="https://github.com/BruceMacD/chatd"
_ollamaurl="https://github.com/jmorganca/ollama"
_ollamaver=0.1.12
license=('MIT')
conflicts=("${pkgname}")
depends=(
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
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}"
    "ollama-${_ollamaver}::${_ollamaurl}/releases/download/v${_ollamaver}/ollama-linux-amd64"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            'a890d66c37621aed531dc7795fa62b2ac1b8bebcce87f56c5cef35b026a3ad0f'
            'fcaeb0dbb5ef834b40ae32c177deed39a8a79e280305c6195a84fa70b525b844')
build() {
    gendesk -f -n -q --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "${srcdir}/ollama-${_ollamaver}" "${srcdir}/${pkgname}-${pkgver}/src/service/ollama/runners/ollama-linux"
    #Not build rpm package
    sed '16,19d' -i forge.config.js
    npm install --cache "${srcdir}/npm-cache"
    npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/out/${pkgname}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname}"
    ln -sf "/usr/lib/${pkgname}/app/src/service/ollama/runners/ollama-linux" "${pkgdir}/usr/bin/ollama"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 128x128 256x256 512x512;do
      install -Dm644 "${srcdir}/${pkgname}-${pkgver}/public/${pkgname}.iconset/icon_${_icons}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644  "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}