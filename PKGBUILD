# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=jsonbox-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="A cross platform JSON formatting tool跨平台的json格式化工具"
arch=('x86_64')
url="https://docs.r-xnoro.com/jsonbox"
_githuburl="https://github.com/rexlevin/jsonbox"
license=('Apache')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=('bash' 'electron19' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/dist/${pkgname%-bin}-${pkgver}-linux-${CARCH}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('3cb8426fe2793d1d715ec2d4ee11b590d0128b43f983bc4a3586e95795ea52a8'
            'aed643ae7ae93725af747720de3084228ece8e75dec5aabb6b880eeb63be1f52')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/opt/${pkgname%-bin}/usr/lib"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}