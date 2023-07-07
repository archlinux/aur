# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=bookmark
pkgname="${_appname}s-manager-bin"
pkgver=0.1.2
pkgrel=1
pkgdesc="Edit bookmarks, check url."
arch=("x86_64")
url="https://github.com/Hunlongyu/bookmarks-manager"
license=('MIT')
depends=('electron')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Bookmark-Manager-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/Hunlongyu/bookmarks-manager/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('05cc0f7a8c0664d47a5cb90af113729a27b63419b8dd9649caa81a46967a241f'
            'c796c92731a81fb917e300438a8e5565ac96507ca0f4052fb3d8e2459e7b0f3b'
            'e49ae23c345ed04e7b75f7aa120974d8c9763226da80cbd721b48a20fb3852eb')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/squashfs-root/${_appname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_appname}.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}