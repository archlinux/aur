# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="imagine-bin"
pkgver=0.7.4
pkgrel=1
pkgdesc="PNG/JPEG optimization app"
arch=("x86_64")
url="https://github.com/meowtec/Imagine"
license=('MIT')
depends=('bash' 'electron12' 'libjpeg6-turbo' 'zlib' 'glibc' 'libpng')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Imagine-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/meowtec/Imagine/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('9f4cce8ac273c215a77af1762103f2a316e08b0c7d9cbe1e94f6c57249a7a983'
            'eea4c8424852f64c83336ab2b8b1243defb012422216a20b5d8848328fdd9f6d'
            'f796e1723ff55ebdf070251963f83c5ce7dab4c69035e551bb7c1d6abaec4bf3')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} \;
}