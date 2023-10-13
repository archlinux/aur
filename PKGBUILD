# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=autorecord-manager
_pkgname=LiveAutoRecord
pkgver=4.3.4
pkgrel=2
pkgdesc="基于 Electron 的多平台直播自动录制软件"
arch=('any')
url="https://github.com/WhiteMinds/LiveAutoRecord"
license=('LGPL3')
conflicts=("${pkgname}")
depends=('bash' 'electron20')
makedepends=('gendesk' 'nodejs>=16.20.1' 'npm>=8.19.4' 'yarn')
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
    "${pkgname%-bin}.sh")
sha256sums=('5735afafaa1decd62301608d6546dd702b63641775fb839232e191a62fc411b4'
            'a203712105b67a53b7cef617b4d7d5411280c058171b671a0ec60b600eea7d68')
prepare() {
    gendesk -f -n -q --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    sed "s|electron-builder\",|electron-builder --linux AppImage\",|g" -i packages/electron/package.json
    yarn
    cd "${srcdir}/${_pkgname}-${pkgver}/packages/shared"
    yarn build
    cd "${srcdir}/${_pkgname}-${pkgver}/packages/manager"
    yarn build
    yarn app:build -p never
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/packages/electron/build/${pkgver}/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/packages/electron/build/icons/256x256.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}