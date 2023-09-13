# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=graphiql-desktop-bin
_appname=GraphiQL
pkgver=0.0.1
pkgrel=4
pkgdesc="Electron-based desktop application for GraphiQL 2"
arch=('x86_64')
url="https://github.com/nathanchapman/graphiql-desktop"
license=("MIT")
depends=('bash' 'electron21' 'hicolor-icon-theme')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/nathanchapman/graphiql-desktop/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('ac3e4bb000eb0bed0670329db28d3617c8c86f8100a6af619289d87e3f0d033f'
            'bd3a1e3d2fbd88a32174e4a111d32b4c02d526642392e06ac9b2a77b89781492'
            '11a0cba1b767c1f3fed2dd1a6700b4b222f1aad463c7fb13d6baefe46a8720da')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    cp -r "${srcdir}/squashfs-root/resources/assets" "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32x32 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}