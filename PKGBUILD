# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=postcat-bin
_pkgname=Postcat
pkgver=0.5.1
pkgrel=3
pkgdesc="Postcat 是一个可扩展的 API 工具平台。集合基础的 API 管理和测试功能，并且可以通过插件简化你的 API 开发工作，让你可以更快更好地创建 API。An extensible API tool."
arch=('x86_64')
url="https://www.postcat.com/"
_ghurl="https://github.com/Postcatlab/postcat"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron22'
    'hicolor-icon-theme'
    'dbus-glib'
    'libdbusmenu-glib'
    'gtk2'
    'gdk-pixbuf2'
    'libxext'
    'libx11'
)
makedepends=(
    'squashfuse'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('9a1a3928d64df829b151d9aac4a69a4a8a0db6427f478c8af1cead260383e1ae'
            '27ca86b042456d0f5f7eade9c5217818de2698c22c05ea6f07852a470a849841')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g;s|Utility|Utility;Development|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}