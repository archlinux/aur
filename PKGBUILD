# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="laradumps-bin"
pkgver=2.1.1
pkgrel=1
pkgdesc="A friendly app designed to boost your Laravel PHP coding and debugging experience."
arch=('x86_64')
url="https://laradumps.dev/"
_githuburl="https://github.com/laradumps/app"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=('hicolor-icon-theme' 'electron')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/LaraDumps-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/laradumps/app/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('82f8682f382cc1187c83b4ef0734c1509876326bd16efa34c0fa6daf7d645474'
            '9893d51d32c0a06c98d8d1b8c22a022ae4af24d9cc61468a9f38e6ecc9553102'
            '7d09736a96ccf482aaed9899dacddf429213c51c69115a16290c14a400459acf')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|icon|#icon|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    chmod 755 "${pkgdir}/opt/laradumps/build"
}