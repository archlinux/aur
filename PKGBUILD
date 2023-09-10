# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=redis-viewer-bin
_pkgname=redisviewer
_appname="Redis Viewer"
pkgver=2.3.1
pkgrel=3
pkgdesc="A Redis visualization client tool that pursues ultimate performance, minimalist layout, efficient interaction, cross platform, and supports deserialization of Java bytecode."
arch=('x86_64')
url="https://github.com/redisviewer/RedisViewer"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('hicolor-icon-theme' 'bash' 'electron8' 'glibc')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_appname// /.}-${pkgver}.deb"
    "LICENSE::https://raw.githubusercontent.com/redisviewer/RedisViewer/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('9a06f66d0afb4491c61d46d3ce64dac5c3d08db7e738d625afa1187d82d5720e'
            '68f3ca5eaa3a59b7e01cbafc7848cb20ea108627ed0c94023e7536adfeeb3e89'
            '53979f6b74406057a8e9fc21cdbd14fcfd730c8c8847bcbd169dff65b8bb7783')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    chmod 755 "${srcdir}/opt/${_appname}/resources/server/redismanager"
    sed "s|\"/opt/${_appname}/${_pkgname}\" %U|${pkgname%-bin}|g;s|Utility|Utility;Development|g;s|${_pkgname}|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_appname}/resources/server" "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}