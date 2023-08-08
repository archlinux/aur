# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=polyglot-bin
pkgver=0.3.4
pkgrel=2
pkgdesc="基于ChatGPT和Azure人工智能语言模型作为底层服务，旨在提供一个易于使用的语言练习平台，方便进行多语种的口语练习"
arch=("x86_64")
url="https://polyglotai.xyz/"
_githuburl="https://github.com/liou666/polyglot"
license=('GPL3')
depends=('bash' 'electron23')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
_install_path="/opt/appimages"
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Polyglot_${pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('2784eb9b68a941f37023a01d891e86594a0f308223ddba2895a44e01ef883ac6'
            'e42c0e1b11e1a41135eb84c932c250395c86146d89818d273ebba506f766836a')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|Exec=AppRun --no-sandbox %U|Exec=/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}