# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=firefly-shimmer-desktop-bin
_pkgname="Firefly Shimmer"
pkgver=2.1.16
_electronversion=27
pkgrel=1
pkgdesc="Try out new features introduced with Shimmer, such as minting native tokens, setting transaction expiry times, and sending microtransactions."
arch=('x86_64')
url="https://firefly.iota.org/"
_ghurl="https://github.com/iotaledger/firefly"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "shimmer-firefly-wallet"
)
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/desktop-shimmer-${pkgver}/${pkgname%-bin}-${pkgver}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('ffbd9fe3f648bd972e156c5b6b8baf9c3facefc4e10c156d293100a6dea3e775'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox|${pkgname%-bin}|g;s|=desktop|=${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/desktop.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/desktop.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/squashfs-root/desktop.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}