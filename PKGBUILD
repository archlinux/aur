# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=krux-installer-bin
_appname="org.selfcustody.${pkgname%-bin}"
pkgver=0.0.1_alpha_6
pkgrel=2
pkgdesc="A GUI based application to flash Krux firmware on K210 based devices"
arch=('x86_64')
url="https://github.com/selfcustody/krux-installer"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron26-bin'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-${pkgver//_/-}.AppImage"    
    "${pkgname%-bin}-${pkgver}.AppImage.sig::${url}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-${pkgver//_/-}.AppImage.sig"
    "LICENSE::https://raw.githubusercontent.com/selfcustody/krux-installer/v${pkgver//_/-}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=(
    'e51673df396aaf2d3035a848ce9b7b7365efa7a4ec34c408f5044430aa3ec073'
    '84a56a728d061b3b16f5e42430be3085bf84528d16a592acfdc7e0efb539590b'
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