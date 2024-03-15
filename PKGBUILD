# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=toughcookies-bin
_pkgname=Tough-Cookies
pkgver=0.45.0
_electronversion=10
pkgrel=11
pkgdesc="A modern flash cards study and management app that runs cross-platform on Windows, Mac, and Linux."
arch=("x86_64")
url="https://www.toughcookies.net/"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}-bin"
    'hicolor-icon-theme'
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
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${pkgname%-bin} %U|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}  
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}