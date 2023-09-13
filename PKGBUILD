# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=imagine-bin
_appname=Imagine
pkgver=0.7.5
pkgrel=3
pkgdesc="PNG/JPEG optimization app"
arch=("x86_64")
url="https://github.com/meowtec/Imagine"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron12' 'libjpeg6-turbo' 'zlib' 'glibc' 'libpng')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/meowtec/Imagine/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('a032f096cc4d09f866d9e575706cb3174875900a234ed0dca0e9a2dfc2cea838'
            'aebee0e853c4db64ce36bd0b235613a9b948036a7f62af387f2e0b406cd657b7'
            'f796e1723ff55ebdf070251963f83c5ce7dab4c69035e551bb7c1d6abaec4bf3')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}