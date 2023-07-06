# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=next-library-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Book library manager, for book enthusiast."
arch=('x86_64')
url="https://github.com/CMOISDEAD/next-library"
license=('GPL3')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=('electron' 'hicolor-icon-theme')
optdepends=('bash')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/next.library-${pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('26099e9d084a65b7ff92b5c7e99939dc60362fd8769669a6784e640976e51430'
            'aa59cd7255571ef6381b749b3f308a6acafb43e101dfebac49595a70b6bfb7ba')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
}