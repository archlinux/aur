# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="etherealengine-control-center-bin"
pkgver=0.3.3
pkgrel=1
pkgdesc="One stop solution for all your Metaverse needs. A desktop app for managing Ethereal Engine cluster. "
arch=('x86_64')
url="https://etherealengine.org/"
_githuburl="https://github.com/EtherealEngine/etherealengine-control-center"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=('electron23' 'hicolor-icon-theme' 'fuse2')
optdepends=('bash')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Ethereal-Engine-Control-Center-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/EtherealEngine/etherealengine-control-center/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('f9080724bb2ce880e90a2f3f70895905d4789df257934fc15fb78798751bbf82'
            'd346da664afe040f323eb3aecc74d5bb2a8b6d61a7ff53ccfaf1611add61a41d'
            '3efed03386679beb63ff27a262d7dd69e43a424adf62d8e705f09e9c47396399')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    for _icons in 8x8 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} \;
}