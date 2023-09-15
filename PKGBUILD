# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=modv-bin
_pkgname=modV
pkgver=3.29.1
pkgrel=2
pkgdesc="modular audio visualisation powered by JavaScript"
arch=("x86_64")
url="https://modv.vcync.gl/"
_githuburl="https://github.com/vcync/modV"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/vcync/modv/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('987b13cbd076f0113a4a11df8cd132e1580dec7abe5ea69fa12a6e5e5a5f7992'
            '4ff9462e56a52889b0005f007e0a66930c6b19687751f551bf7316b6ee35119e'
            'f060459f5bd7762f0fe6dd0e8a9464a2e52e80ff7de825a8c8af5fb3b6ee75f6')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${srcdir}"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}