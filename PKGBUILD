# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=zxinfo-file-browser-bin
pkgver=1.2.5
_subver=final
_electronversion=27
pkgrel=5
pkgdesc="Organize and manage your emulator files for ZX Spectrum & ZX 81 - powered by the web(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/thomasheckmann/zxinfo-file-browser"
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
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}-${_subver}/${pkgname%-bin}-${pkgver}-${_subver}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/thomasheckmann/zxinfo-file-browser/v${pkgver}-${_subver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('3bdb2b699ba17bab7ed4179ca2eee9d88e2796f527d88d0f3cd30ac8d858016a'
            '2042c6124204156b44ed7676a90f1e0bb9ddfee1f76d20f7b6f220a90398f74e'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i -e "
        s/AppRun --no-sandbox/${pkgname%-bin}/g
        s/\/usr\/share\/icons\/hicolor\/256x256\/apps\///g
    " "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}