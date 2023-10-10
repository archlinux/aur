# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=querym-bin
pkgver=0.5.5
pkgrel=1
pkgdesc="A free, open-source, and cross-platform GUI tool designed to make database management accessible and efficient."
arch=('x86_64')
url="https://querymaster.io"
_githuburl="https://github.com/querymx/querym"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron23' 'hicolor-icon-theme')
makedepends=('squashfuse')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux_${CARCH}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('1ead091c86fbebaa5c6e5e4d02187f7f14cff6b8bd567342f8e2158a1fe48e02'
            '920075186b082e134ae5ade5f38835abd5c2ed7e626363c05550c3d857983860')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    cp -r "${srcdir}/squashfs-root/resources/assets" "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/opt/${pkgname%-bin}/usr/lib"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}