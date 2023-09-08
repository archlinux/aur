# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sofie-chef-bin
_appname=SofieChef
pkgver=0.2.0
pkgrel=1
pkgdesc="Disrupting the industry & stirring pots"
arch=('x86_64')
url="https://github.com/nrkno/sofie-chef"
license=("MIT")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=('bash' 'electron20' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_appname}-${pkgver}-Linux-Executable.AppImage"
    "LICENSE::https://raw.githubusercontent.com/nrkno/sofie-chef/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('fc389317da836ff7193fcd3c964ceda9de4c5e0ebca603d1d2e3a27d5df80f1e'
            '1885e72fa406407f4135fc914d88aa7b07a74c2a0ce891f74b0224919d6ee57d'
            'fc6910c08449aca5ede1de788e2b0cf010d2e66797787ad0bf5cfe5a6f26640b')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}