# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="liground-bin"
pkgver=0.4.0
pkgrel=1
pkgdesc="A free, open-source and modern Chess Variant Analysis GUI for the 21st century"
arch=('x86_64')
url="https://ml-research.github.io/liground.github.io/"
_githuburl="https://github.com/ml-research/liground"
license=('AGPL3')
depends=('bash' 'electron11' 'glibc' 'gcc-libs')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-linux.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('7d0c4994cb489689183b3768952d9199971060dd873037a988c25f8d86cc1ad4'
            'b3dc7b16d4987e336d06de8c8de6ebf1f68a3297a3dd826cab295a6fceb84a31')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|AppRun %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    chmod 755 "${pkgdir}/opt/liground/engines"
}