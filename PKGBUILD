# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lyricistant-bin
pkgver=3.3.0
pkgrel=3
pkgdesc="A helpful writing assistant for lyricists!"
arch=('aarch64' 'x86_64')
url="https://github.com/wardellbagby/lyricistant"
license=('GPL3')
depends=('bash' 'electron25' 'hicolor-icon-theme')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux_arm64.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux_x86_64.AppImage")
source=("${pkgname%-bin}.sh")
sha256sums=('c6acde5c6292a33c72ee35a0871aa91499363ebb586d2d95e9c83fde823b533f')
sha256sums_aarch64=('42b1f2479db56cf61355840a5ccd7cdac43d87e4d67be386b20e911f1df4aa3e')
sha256sums_x86_64=('8cd2acea45922ce45dbc9809b746ddefd6d5f3eab80471968f949bf2dd26be4a')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
} 
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}