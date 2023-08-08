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
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('hicolor-icon-theme' 'bash' 'electron8' 'glibc')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Redis.Viewer-${pkgver}.deb"
    "LICENSE::https://raw.githubusercontent.com/redisviewer/RedisViewer/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('a5b402a9267b62e52d81dc93469ccef7fe13ffd91e280a92f0bf70e63789dc49'
            '68f3ca5eaa3a59b7e01cbafc7848cb20ea108627ed0c94023e7536adfeeb3e89'
            '53979f6b74406057a8e9fc21cdbd14fcfd730c8c8847bcbd169dff65b8bb7783')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_appname}/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    chmod 755 "${pkgdir}/opt/${pkgname%-bin}/server/redismanager"
    sed "s|\"/opt/${_appname}/${_pkgname}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Utility|Utility;Development|g;s|${_pkgname}|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}