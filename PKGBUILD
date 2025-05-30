# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=coinstac-desktop-app-bin
_pkgname=COINSTAC
pkgver=6.9.8
_electronversion=18
pkgrel=1
pkgdesc="Collaborative Informatics and Neuroimaging Suite Toolkit for Anonymous Computation.(Prebuilt version.Use system-wide electron)"
arch=(
    #'aarch64'
    'x86_64'
)
url="https://github.com/trendscenter/coinstac"
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
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/trendscenter/coinstac/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
#source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux.AppImage")
sha256sums=('fcf8a012e25e06508e76c87a9607116d8cf2a195c8e12f960ff01e64b493f882'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_x86_64=('084ed9fcfb39631747dff3075c0bdd68cf76d721cf8c74b8bbc952c393a7b8db')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/resources/resources/fonts/Roboto-Regular.ttf" -t "${pkgdir}/usr/lib/${pkgname%-bin}/resources/fonts"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}