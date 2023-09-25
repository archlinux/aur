# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=dialogcraft
_pkgname=DialogCraft
pkgver=0.9.4
pkgrel=1
pkgdesc="Desktop client for OpenAI GPT API."
arch=('any')
url="https://github.com/Hayden2018/dialogcraft"
license=('MIT')
conflicts=("${pkgname}")
depends=('libx11' 'libxcb' 'libxext' 'cairo' 'libdrm' 'expat' 'at-spi2-core' 'mesa' 'nss' 'gtk3' 'nspr' 'libcups' 'libxrandr' 'libxfixes' \
    'libxkbcommon' 'gcc-libs' 'libxcomposite' 'glibc' 'hicolor-icon-theme' 'glib2' 'alsa-lib' 'pango' 'dbus' 'libxdamage')
makedepends=('gendesk' 'npm' 'nodejs>=16')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0accad40b588b2298c93c7de174b824d2945f3488594f8d04932bc53fbc83701')
prepare() {
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname} --no-sandbox %U"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm ci
    sed '26,31d' -i forge.config.js
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