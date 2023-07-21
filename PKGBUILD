# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="toughcookies-bin"
pkgver=0.45.0
pkgrel=5
pkgdesc="A modern flash cards study and management app that runs cross-platform on Windows, Mac, and Linux."
arch=("x86_64")
url="https://www.toughcookies.net/"
license=('freeware')
depends=('electron10' 'bash' 'hicolor-icon-theme')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.AppImage::https://downloads.toughcookies.net/v0.45.0/Tough-Cookies-0.45.0.AppImage"
    "LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('767dcd1fafa142e9178c7fe55f77a6d7f3f995d167bf4a2e0df978af377b59cf'
            'eae0e67aeeb7c2d5b136f3b5d4aa1fcc1354d2b72a95fd6f8b609ccba5d2d822'
            '8ea2b0c732a2e590b7907b40b4b588503e4ddd20bc6724111e8af015b4e85513')
prepare() {
    chmod a+x "${pkgname%-bin}-${pkgver}.AppImage"
    "./${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}  
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|AppRun|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}