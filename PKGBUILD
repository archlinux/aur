# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=postcat-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Postcat 是一个可扩展的 API 工具平台。集合基础的 API 管理和测试功能，并且可以通过插件简化你的 API 开发工作，让你可以更快更好地创建 API。An extensible API tool."
arch=('x86_64')
url="https://www.postcat.com/"
_githuburl="https://github.com/Postcatlab/postcat"
license=('Apache')
provides=("${pkgname%-bin}")
conflits=("${pkgname%-bin}")
depends=('bash' 'electron22' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Postcat-${pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('9a1a3928d64df829b151d9aac4a69a4a8a0db6427f478c8af1cead260383e1ae'
            '73a0684084d779a69d188f11281d7f1dc1967d197cc11348329f592383448369')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Utility|Utility;Development|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} \;
}