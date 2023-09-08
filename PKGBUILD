# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=vigad-bin
_pkgname=Vigad
pkgver=1.0.0
pkgrel=2
pkgdesc="Extract live-data from your screen."
arch=("x86_64")
url="https://vigad.wordpress.com/"
_githuburl="https://github.com/VisualGameData/VIGAD"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron24')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/VisualGameData/VIGAD/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('bd5a3dd6607f23236e376ab32b4ee01957e9816690808b078c707a865eb56b88'
            'a987d5add58c58a7d976130c1fa78f6ddace5f5cdb2c1bac8cc6dbdb8e54376d'
            '100b2869da9719d6e50fa499e7cf0b72e869d8f8770f834f9a78d081514c9cbf')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${srcdir}"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/${pkgname%-bin}.asar"
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}