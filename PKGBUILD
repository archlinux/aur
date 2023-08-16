# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=moyu-bin
pkgver=0.8.0_beta
pkgrel=1
pkgdesc="基于 Vue 和 Electron 的在线协同api接口管理工具。接口文档管理工具、接口工具、接口文档、api文档、api工具、快乐摸鱼"
arch=('x86_64')
url="https://online.jobtool.cn/"
_githuburl="https://github.com/trueleaf/moyu"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron16' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver//_/-}/${pkgname%-bin}-${pkgver%_beta}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/trueleaf/moyu/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('0dab0db5b1492b06f52104dcc4ebe7acce3817fb8b6abb3d9523bff69a2dcb19'
            'bbef3f01685fbef2be49493df601daf55815b3a044fb7361e160c9074ea515f7'
            '6b0139bbf6cbbf144b828195795b80168185afc031787a9f006cdacd13f2f5aa')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}