# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mockoon
pkgver=4.0.0
pkgrel=1
pkgdesc="The easiest and quickest way to run mock APIs locally. No remote deployment, no account required, open source."
arch=('any')
url="https://mockoon.com/"
_githuburl="https://github.com/mockoon/mockoon"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron24' 'hicolor-icon-theme')
makedepends=('gendesk' 'asar' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('89614e32551a0899f1dcaee74fb5fa9131760c1a82ec809b590f5dcabe341f8a'
            '50311a2d0babe4a433b06a1457cfd1309c7f8ab8e3ffad3eef98c300f6ccec66')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install
    npm run build:desktop:prod
    asar extract "${srcdir}/${pkgname}-${pkgver}/packages/desktop/packages/linux-unpacked/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/${pkgname}-${pkgver}/packages/desktop/dist" "${srcdir}/app.asar.unpacked"
    asar pack "${srcdir}/app.asar.unpacked" "${srcdir}/${pkgname}.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.asar" -t "${pkgdir}/opt/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/packages/desktop/build-res/icon_${_icons}x32.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}