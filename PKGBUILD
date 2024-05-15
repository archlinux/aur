# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=redis-viewer-bin
_pkgname=redisviewer
_appname="Redis Viewer"
pkgver=2.4.2
_electronversion=28
pkgrel=1
pkgdesc="A Redis visualization client tool that pursues ultimate performance, minimalist layout, efficient interaction, cross platform, and supports deserialization of Java bytecode."
arch=('x86_64')
url="https://github.com/redisviewer/RedisViewer"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_appname// /.}-${pkgver}-linux.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/redisviewer/RedisViewer/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('8299dcb41f8387305e649a8cc4daf8fcef962129afe0810e71b7974bdd1122ee'
            '68f3ca5eaa3a59b7e01cbafc7848cb20ea108627ed0c94023e7536adfeeb3e89'
            '41b6d61dffef064762b3eec3dfeca7a3e1f57cbcb6dce9a6940c06797a0eae9d')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "s|\"/opt/${_appname}/${_pkgname}\"|${pkgname%-bin}|g" \
        -e "s|Utility|Development|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 "${srcdir}/opt/${_appname}/resources/server/redismanager" -t "${pkgdir}/usr/lib/${pkgname%-bin}/server"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/server/manager.db" -t "${pkgdir}/usr/lib/${pkgname%-bin}/server"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/server/configs/config.yaml" -t "${pkgdir}/usr/lib/${pkgname%-bin}/server/configs"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}