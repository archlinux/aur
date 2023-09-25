# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=graphiql-desktop-bin
_appname=GraphiQL
pkgver=0.1.0
pkgrel=1
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
sha256sums=('ca8f455113f5d6e571fb35e30cd4b5747f6325e44203b37a309c180cebca3e2c'
            'bd3a1e3d2fbd88a32174e4a111d32b4c02d526642392e06ac9b2a77b89781492'
            'd4d5fb3797c009bf9a5fcb657b282d1bf106be12b1b4bff130d8276a81e5375f')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    cp -r "${srcdir}/squashfs-root/resources/assets" "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32x32 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}