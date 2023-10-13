# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=wx-read
pkgver=0.2.2
pkgrel=2
pkgdesc="A simple Electron application for Weixin Read.一个极简版微信读书桌面客户端"
arch=('x86_64')
url="https://github.com/estepona/wx-read-desktop"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron22')
makedepends=('gendesk' 'npm' 'nodejs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname%-bin}.sh")
sha256sums=('2e81953311c2259a78fafd11d83950894b6acc254dcea2442c0c624cbf3f74b0'
            '682421a4ee60da70a59c5cd4a7e1a671051d99039fc0f7270f3e84e6b917c9a3')
prepare() {
    gendesk -f -n -q --categories "Utility" --name "微信读书 ${pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${pkgname}-desktop-${pkgver}"
    npm ci
    npm run build
    npx electron-builder --linux AppImage --x64
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname}-desktop-${pkgver}/release/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/${pkgname}-desktop-${pkgver}/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-desktop-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}