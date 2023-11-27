# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=redis-viewer-bin
_pkgname=redisviewer
_appname="Redis Viewer"
pkgver=2.3.2
pkgrel=2
pkgdesc="A Redis visualization client tool that pursues ultimate performance, minimalist layout, efficient interaction, cross platform, and supports deserialization of Java bytecode."
arch=('x86_64')
url="https://github.com/redisviewer/RedisViewer"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'hicolor-icon-theme'
    'electron9'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_appname// /.}-${pkgver}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/redisviewer/RedisViewer/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('05782f359b7e9b97027f2aacbe99f6345208e862ee3ebd1046e80a0cf074f844'
            '68f3ca5eaa3a59b7e01cbafc7848cb20ea108627ed0c94023e7536adfeeb3e89'
            '570271bd08501ca00e87e32da3b6a003d5dfbce25d9d051a01c5a433e7736a32')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed -e "s|\"/opt/${_appname}/${_pkgname}\" %U|${pkgname%-bin}|g" \
        -e "s|Utility|Development|g" \
        -e "s|${_pkgname}|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 "${srcdir}/opt/${_appname}/resources/server/redismanager" -t "${pkgdir}/usr/lib/${pkgname%-bin}/server"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/server/manager.db" -t "${pkgdir}/usr/lib/${pkgname%-bin}/server"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/server/configs/config.yaml" -t "${pkgdir}/usr/lib/${pkgname%-bin}/server/configs"
    install -Dm644 "${srcdir}/opt/${_appname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}