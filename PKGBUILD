# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=toughcookies-bin
_pkgname=Tough-Cookies
pkgver=0.45.0
_electronversion=10
pkgrel=13
pkgdesc="A modern flash cards study and management app.(Prebuilt version.Use system-wide electron)"
arch=("x86_64")
url="https://www.toughcookies.net/"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::https://downloads.toughcookies.net/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('767dcd1fafa142e9178c7fe55f77a6d7f3f995d167bf4a2e0df978af377b59cf'
            'eae0e67aeeb7c2d5b136f3b5d4aa1fcc1354d2b72a95fd6f8b609ccba5d2d822'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i "s/AppRun/${pkgname%-bin} %U/g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}  
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}