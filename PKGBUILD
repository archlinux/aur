# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="bdash-bin"
pkgver=1.16.2
pkgrel=1
pkgdesc="Simple SQL Client for lightweight data analysis."
arch=('x86_64')
url="https://github.com/bdash-app/bdash"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=('electron' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Bdash-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/bdash-app/bdash/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('386255544582fd8416e7be3e074ce5f58cbac0f76b252aa5b2cb4d133843d814'
            '44e997a14d296ed01f24a68d2071280936534e98f4613fa8b875c9922e6b22d8'
            '5da5b0cdcd11494607748483aeb575d8b50ca67a986222d97fee47add09c39bd')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    sed "s|AppRun --no-sandbox %U|/opt/appimages/bdash.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    chmod 755 "${pkgdir}/opt/${pkgname%-bin}/build"
}