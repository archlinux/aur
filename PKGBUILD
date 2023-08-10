# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=astrofox-bin
pkgver=1.4.0
pkgrel=2
pkgdesc="A motion graphics program that lets you turn audio into amazing videos."
arch=('x86_64')
url="https://astrofox.io"
_githuburl="https://github.com/astrofox-io/astrofox"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron16')
source=("${pkgname%-bin}-${pkgver}.AppImage::https://files.astrofox.io/download/Astrofox-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/astrofox-io/astrofox/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('05327ea2944741d8bab8ef5f8bfd33530fbbb72ad85b6e4c411714c6fd295b65'
            '2366e943e400fbf8d55651d8f29257f7a680ce6fcb428d0215e75362f8728e43'
            '1c6bc1d527fb1ea7a3300fae7f30410c56bd3585dd791357eea8f4a6084ceb50')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    chmod 755 "${pkgdir}/opt/${pkgname%-bin}/bin"
}