# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="vigad-bin"
pkgver=1.0.0
pkgrel=1
pkgdesc="Extract live-data from your screen."
arch=("x86_64")
url="https://vigad.wordpress.com/"
_githuburl="https://github.com/VisualGameData/VIGAD"
license=("MIT")
depends=('bash' 'electron24' 'libx11' 'glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Vigad-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/VisualGameData/VIGAD/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('bd5a3dd6607f23236e376ab32b4ee01957e9816690808b078c707a865eb56b88'
            'a987d5add58c58a7d976130c1fa78f6ddace5f5cdb2c1bac8cc6dbdb8e54376d'
            'd861f4198f6edda691f2e2a8bd1e019ac4817530498fca249aef996e6e17fca7')
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