# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yakuza-bin
pkgver=0.2.2
_electronversion=28
pkgrel=2
pkgdesc="An extensible linux application launcher"
arch=('x86_64')
url="https://github.com/fzdwx/yakuza"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/${pkgname%-bin}-0.1.0.AppImage"
    "yactrl-${pkgver}::${url}/releases/download/${pkgver}/yactrl"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/fzdwx/yakuza/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('6f4ee338308cd8a018add29bcb2fa3f6ab53f2b3967e3d82a0eecb82bf8bc4a0'
            '53af07ff1586a021dd891e2fe3f1fe2f3b93ed92f1977a6325c3c0dbe1afe9b7'
            '9e05d771f47c0447e9147319523e1a2de79538b9e85f7ad1f4d657ac56648b38'
            '50b10386d13e5bec806aeb78f819c4edd0208a4d184332e53866c802731217fe')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/yactrl-${pkgver}" "${pkgdir}/usr/bin/yactrl"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"{app.asar.unpacked,bin} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}