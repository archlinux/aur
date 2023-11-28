# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=kanban-desktop
pkgname="live2d-${_appname}-bin"
pkgver=2.8.0
pkgrel=1
pkgdesc="An AI Based live2d Kanban for Desktop Users Using Electron.基于Electron制作的桌面看板娘，支持日程提醒、小窗模式、ChatGPT集成、网页搜索、本地moc模型加载与独立设置界面等"
arch=('x86_64')
url="http://studio.zerolite.cn/post/338/waifuproject2-live2d-kanban-desktop/"
_ghurl="https://github.com/JimHans/live2d-kanban-desktop"
license=('GPL3')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=(
    'electron22'
    'expat'
)
makedepends=(
    'gendesk'
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}-AppImage.tar.gz"
    "live2dcubismcore.min.js::https://cubism.live2d.com/sdk-web/cubismcore/live2dcubismcore.min.js"
    "${pkgname%-bin}.sh"
)
sha256sums=('ec355432de2d20013c2c80c576dda280da5c4103441f72784a3b998a2af6094f'
            '942783587666a3a1bddea93afd349e26f798ed19dcd7a52449d0ae3322fcff7c'
            'e36e774675a2d17dce49ee4b03fc246f73cc2aebd4189c2233822947cfeeb9b9')
build() {
    gendesk -q -f -n --pkgname "live2d-${_appname}-bin" --categories "Utility" --name "${pkgname%-bin}" --exec "${pkgname%-bin}"
    asar e "${srcdir}/${_appname}-${pkgver}/resources/app.asar" "${srcdir}/app.asar.unpacked"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/${_appname}-${pkgver}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 "${srcdir}/live2dcubismcore.min.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/app.asar.unpacked/assets/applogo256.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}