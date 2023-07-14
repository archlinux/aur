# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=helioslauncher-bin
pkgver=2.0.4
pkgrel=1
pkgdesc="Custom launcher for modded minecraft written in Electron and Node.js"
arch=('x86_64')
url="https://github.com/dscalzi/HeliosLauncher"
license=('MIT')
depends=('bash' 'electron24' 'java-runtime')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Helios-Launcher-setup-${pkgver}.AppImage"
    "LICENSE.txt::https://raw.githubusercontent.com/dscalzi/HeliosLauncher/master/LICENSE.txt"
    "${pkgname%-bin}.sh")
sha256sums=('6fd6a2d100e4ff8cd89fb491ca973ed2d751cb51217050ad432223ccb0dc000c'
            '4ffd6e4c132ebc4ecde76d809f9f88e151ee0eb2175e7ea0f0b0b51a9d48539e'
            '52c056b7d2a433cdcd134278a7b9e0941a4c34cacb9b445c94a11750bfa6f8a9')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} \;
}