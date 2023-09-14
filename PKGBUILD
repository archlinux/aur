# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=liground-bin
pkgver=0.4.0
pkgrel=3
pkgdesc="A free, open-source and modern Chess Variant Analysis GUI for the 21st century"
arch=('x86_64')
url="https://ml-research.github.io/liground.github.io/"
_githuburl="https://github.com/ml-research/liground"
license=('AGPL3')
depends=('bash' 'electron11' 'glibc' 'gcc-libs')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-linux.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('7d0c4994cb489689183b3768952d9199971060dd873037a988c25f8d86cc1ad4'
            'e8c4962d37d37d9e5c43e4a886af0646df8c0bf296103ed4dd3e3f807ca050d4')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/resources/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/squashfs-root/resources/engines/"*stockfish -t "${pkgdir}/opt/${pkgname%-bin}/resources/engines"
    cp -r "${srcdir}/squashfs-root/static" "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}