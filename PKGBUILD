# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=karbonized-bin
pkgver=1.10.1
pkgrel=1
pkgdesc="Awesome Image Generator for Code Snippets & Screenshots"
arch=('x86_64')
url="https://github.com/yossTheDev/karbonized"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('ab9aaaaf7d31cd03b76381b376218fb4ddde081fb792e4356af5e527ab10649b'
            'ca7a68ebd5f1e434030bf030e1bd942272901d2c9060ffb8f499bb1476f3fc14')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g;s|Utility|Utility;Graphics|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}