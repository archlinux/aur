# Maintainer: Wrxn <arch at rnny dot xyz>
pkgname=exiled-exchange-2-bin
_pkgname=Exiled-Exchange-2
pkgver=0.13.6
_electronversion=31
pkgrel=1
pkgdesc="Path of Exile 2 trading app for price checking"
arch=('x86_64')
url="https://kvan7.github.io/Exiled-Exchange-2/download"
_ghurl="https://github.com/Kvan7/Exiled-Exchange-2"
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
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Kvan7/Exiled-Exchange-2/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('b41469882dc7cd7bd76cec8368f01d608f9ca9f09b7877c78d5b724b0d8a77a8'
            '5c8de7f881b34dc31f872531a1eee1eabc79e10acd8fc91c026e10c5a8258c3f'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${pkgname%-bin}|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --sandbox|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"

    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app-update.yml" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/app.asar.unpacked/" "${pkgdir}/usr/lib/${pkgname%-bin}/"
    chmod 755 $(find "${pkgdir}/usr/lib/${pkgname%-bin}/" -type d)
    chmod 644 $(find "${pkgdir}/usr/lib/${pkgname%-bin}/" -type f)

    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"

    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done

    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
