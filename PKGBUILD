# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="neanes-bin"
pkgver=0.4.0
pkgrel=1
pkgdesc="A free and open source scorewriter for notating Byzantine chant in Byzantine notation."
arch=('x86_64')
url="https://danielgarthur.github.io/neanes/"
_githuburl="https://github.com/danielgarthur/neanes"
license=('GPL3')
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron24' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Neanes-${pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('5d5e91b1f5cb33608753bcb2578472501c1503c5236a2a01f32358f2fba4aa81'
            '7376ab13765de791a03acb83b5bb8d8d8c2d8971a1f3af6db84633a2921bd76e')
prepare() {
    chmod a+x "${pkgname%-bin}-${pkgver}.AppImage"
    "./${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}