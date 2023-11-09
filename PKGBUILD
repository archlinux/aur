# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=dialogcraft
_pkgname=DialogCraft
pkgver=1.0.6
pkgrel=1
pkgdesc="Desktop client for OpenAI GPT API."
arch=('any')
url="https://github.com/Hayden2018/dialogcraft"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'libxfixes'
    'cairo'
    'nspr'
    'libdrm'
    'mesa'
    'libxrandr'
    'libxext'
    'libxcomposite'
    'libcups'
    'gtk3'
    'pango'
    'libxdamage'
    'alsa-lib'
    'expat'
    'nss'
    'at-spi2-core'
    'libx11'
    'libxkbcommon'
    'libxcb'
)
makedepends=(
    'gendesk'
    'npm'
    'nodejs>=16'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e2c5652a5fc20951aa5ff9c6ad3d827421e52717f9c650e2ca5a8528bac5d6a5')
build() {
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname} --no-sandbox %U"
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm ci
    sed -e '26,31d' -e '8,19d' -i forge.config.js
    npm run make
}
package() {
    install -Dm755 -d "${pkgdir}/"{usr/bin,opt/"${pkgname}"}
    cp -r "${srcdir}/${pkgname}-${pkgver}/out/${_pkgname}-linux-"*/* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}