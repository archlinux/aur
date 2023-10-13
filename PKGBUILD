# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=subtitle-translator-electron-bin
_pkgname=Subtitle.Translator
pkgver=1.1.0
pkgrel=1
pkgdesc="Translate subtitle using ChatGPT"
arch=('x86_64')
url="https://github.com/gnehs/subtitle-translator-electron"
license=("custom")
depends=('bash' 'electron24')
makedepends=('squashfuse')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('ecd0b2c0971f1c31030f8706203665267149d7d3d198a393e5037c1929742191'
            '26d911bba2617e163baab03075c62713c7b30fd297186ed2ceb13f037e71e05a')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}