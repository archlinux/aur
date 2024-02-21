# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=kanban-desktop
pkgname="live2d-${_appname}-bin"
pkgver=2.8.0
_electronversion=22
pkgrel=3
pkgdesc="An AI Based live2d Kanban for Desktop Users Using Electron.基于Electron制作的桌面看板娘，支持日程提醒、小窗模式、ChatGPT集成、网页搜索、本地moc模型加载与独立设置界面等"
arch=('x86_64')
url="http://studio.zerolite.cn/post/338/waifuproject2-live2d-kanban-desktop/"
_ghurl="https://github.com/JimHans/live2d-kanban-desktop"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'expat'
)
makedepends=(
    'gendesk'
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}-AppImage.tar.gz"
    "live2dcubismcore.min-${pkgver}.js::https://cubism.live2d.com/sdk-web/cubismcore/live2dcubismcore.min.js"
    "${pkgname%-bin}.sh"
)
sha256sums=('ec355432de2d20013c2c80c576dda280da5c4103441f72784a3b998a2af6094f'
            '942783587666a3a1bddea93afd349e26f798ed19dcd7a52449d0ae3322fcff7c'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="live2d-${_appname}-bin" --categories="Utility" --name="${pkgname%-bin}" --exec="${pkgname%-bin} %U"
    asar e "${srcdir}/${_appname}-${pkgver}/resources/app.asar" "${srcdir}/app.asar.unpacked"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/${_appname}-${pkgver}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 "${srcdir}/live2dcubismcore.min-${pkgver}.js" "${pkgdir}/usr/lib/${pkgname%-bin}/live2dcubismcore.min.js"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/app.asar.unpacked/assets/applogo256.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}