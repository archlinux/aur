# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electronim-bin
pkgver=0.0.93
pkgrel=1
pkgdesc="A Self Contained Desktop Version Of electronim Made With Electron"
arch=('x86_64')
url="https://github.com/manusa/electronim"
license=('Apache')
conflicts=("${pkgname%-bin}")
depends=('electron25' 'gcc-libs' 'glibc')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${CARCH}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('f934e20cab3054c6600e6001f4e128874271e04aa6b6a9a8bd3d5f56a0274d68'
            '2d3af84a7c93ddaf4670e27a43f981a1871188f4a2e80e29832236f9d3437da4')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} \;
}