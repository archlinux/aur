# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="interastral-peace-chat-bin"
_appname="ipc"
pkgver=1.0.0
pkgrel=1
pkgdesc="Interastral Peace Chat (HSR messaging app)"
arch=('x86_64')
url="https://github.com/niizam/ipc"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=('bash' 'electron24')
_install_path="/opt/appimages"
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Interastral.Peace.Chat-linux-x64-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/niizam/ipc/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('4e190977093c308f8122a716e005814d72b28a832dce341c1026f52c6ec370f5'
            '4a0102513b658872c91f6e2a2d8244aaaab86c8686bc572c169b386d511c6975'
            'b463a4e480e502921d68cecbad4324b0e2fcc4500f40b87743e713e3a2025d2c')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}//${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm755 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|${_appname}|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${_appname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}