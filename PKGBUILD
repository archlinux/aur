# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: qlrd <qlrddev at gmail dot com>

pkgname=krux-installer-bin
_appname="org.selfcustody.${pkgname%-bin}"
pkgver=0.0.1_beta
revision=2f0ee130
pkgrel=1
pkgdesc="A GUI based application to flash Krux firmware on K210 based devices"
arch=('x86_64')
url="https://github.com/selfcustody/krux-installer"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}.${revision}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron26-bin'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver//_/-}.${revision}/${pkgname%-bin}-${pkgver//_/-}.AppImage"    
    "${pkgname%-bin}-${pkgver}.AppImage.sig::${url}/releases/download/v${pkgver//_/-}.${revision}/${pkgname%-bin}-${pkgver//_/-}.AppImage.sig"
    "LICENSE::https://raw.githubusercontent.com/selfcustody/krux-installer/v${pkgver//_/-}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=(
    '1d9ca2a004a94438b6c36c9768b5b1ac6d4404a896a021649474be3064f83ade'
    'be12eeccfe246df9d28584e0dd1999007c332578bd6bce8cc7a2e8d627893dbe'
    '29eee3e9d9c5dd67213ec3ab4a7eef57a1224750e2e9aab3a278177a9444a355'
    '968f5626b4fe52657da41f9da35e6034785dfbda496fd9692058e5526bbb5180'    
)

validpgpkeys=(
    'B4281DDDFBBD207BFA4113138974C90299326322'
)

build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g;s|${_appname}|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}