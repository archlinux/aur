# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=thoughts-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="一个还算强大的Web思维导图。A relatively powerful web mind map."
arch=("x86_64")
url="https://wanglin2.github.io/mind-map/#/index"
_githuburl="https://github.com/wanglin2/mind-map"
license=("MIT")
depends=('bash' 'electron' 'hicolor-icon-theme')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/electron_${pkgver}/linux${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/wanglin2/mind-map/electron_${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('856b46f6008d8c2d109be866ed49cf4e10a16b0091cbb251b237df86b6db0913'
            '8a19b651678a6a644640524d984ed89d0b9a78c662545715218a05130c7329c7'
            '07dbb44e73197dfcb97193689058141b84aa6a562a5f21ae782b918bec049eca')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g;s|Utilities|Utility|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/opt/${pkgname%-bin}/usr/lib"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32x32 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
