# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="graphiql-desktop-bin"
pkgver=0.0.1
pkgrel=1
pkgdesc="Electron-based desktop application for GraphiQL 2"
arch=('x86_64')
url="https://github.com/nathanchapman/graphiql-desktop"
license=("MIT")
depends=('electron21' 'hicolor-icon-theme')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/GraphiQL-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/nathanchapman/graphiql-desktop/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('ac3e4bb000eb0bed0670329db28d3617c8c86f8100a6af619289d87e3f0d033f'
            'bd3a1e3d2fbd88a32174e4a111d32b4c02d526642392e06ac9b2a77b89781492'
            '6620759cfdb9e7fff0813ecd51cc0eecc50f13e2d9bcec0105483a3bd15f8785')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32x32 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} \;
}