# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="desktop-notifier-bin"
pkgver=0.0.8
pkgrel=2
pkgdesc="Application which sent a notifier when data change about a link"
arch=('x86_64')
url="https://github.com/maxgfr/desktop-notifier"
license=('custom')
conflicts=("${pkgname%-bin}")
depends=('electron' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/Desktop.Notifier-0.0.7.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('bcde59d6d7501d990adfe88f08c9794153df98177da073b80442fab2c8d13abe'
            'e23b4955d7b040a9d1965e87bbc26b4acfc8c998b0afe7fd70b895f978d0652c')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} \;
}