# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=live2d-kanban-desktop
pkgver=2.7.0
pkgrel=1
pkgdesc="An AI Based live2d Kanban for Desktop Users Using Electron.基于Electron制作的桌面看板娘，支持日程提醒、小窗模式、ChatGPT集成、网页搜索、本地moc模型加载与独立设置界面等"
arch=('x86_64')
url="http://studio.zerolite.cn/post/338/waifuproject2-live2d-kanban-desktop/"
_githuburl="https://github.com/JimHans/live2d-kanban-desktop"
license=('GPL3')
conflicts=("${pkgname}")
depends=('bash' 'electron22')
makedepends=('gendesk' 'npm' 'nodejs>=16' 'asar')
source=("${pkgname}-${pkgver}.zip::${_githuburl}/archive/refs/tags/v${pkgver}.zip"
    "${pkgname}.sh")
sha256sums=('b3966e6bc558d66a588bd9ed59b329016a371c3689964a6128668f1110375de1'
            '5aed7b01e2eded3e95a61ee560a9ca49dd205f2ca9946dbcea3a95702340b34e')
prepare() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm i
    npm run pack
    asar e "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed "s|app.ico|app.png|g" -i "${srcdir}/app.asar.unpacked/index.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/app.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}