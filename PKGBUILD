# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=writer
pkgname="ai-${_pkgname}"
pkgver=1.2.0
pkgrel=1
pkgdesc="A markdown editor powered by AI (Ollama)"
arch=('x86_64')
url="https://github.com/Intellicode/writer"
license=('GPL3')
conflicts=("${pkgname}")
depends=('bash' 'electron26' 'hicolor-icon-theme')
makedepends=('gendesk' 'npm' 'nodejs>=12')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('498fc2f9aab6318c6051b2fcb0e48f4c9ea4931ead54b25b111f48552fcf40a7'
            '27b4977cdc701d0fc5a6cf932ce9fe8100ef08012775d07b4279d16c8e5511c8')
prepare() {
    gendesk -q -f -n --pkgname "ai-${_pkgname}" --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    cp -r src/components/header src/components/Header
    npm install
    npm run make
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/out/${_pkgname}-linux-x64/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/logo.iconset/icon_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}