# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="data-works-bin"
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple data management system intended to be flexible and expandable"
arch=('x86_64')
url="https://github.com/alexaib2002/project-dataworks_base"
license=('GPL3')
conflicts=("${pkgname%-bin}")
depends=('hicolor-icon-theme' 'electron')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/DataWorks-${pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('90ca960db8eedcf706a490998f12111885a17d408b5016fe40d5628fe85697b0'
            '2700886a0d7d2dbaa8c36226182c837ea6d14d050559cfb1d4f20266d8573e9b')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}