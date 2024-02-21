# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=firefly-shimmer-desktop-bin
pkgver=2.1.13
_electronversion=27
pkgrel=1
pkgdesc="Try out new features introduced with Shimmer, such as minting native tokens, setting transaction expiry times, and sending microtransactions."
arch=('x86_64')
url="https://firefly.iota.org/"
_ghurl="https://github.com/iotaledger/firefly"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "shimmer-firefly-wallet")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/desktop-shimmer-${pkgver}/${pkgname%-bin}-${pkgver}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('1101223f7197ef51d45a6d5f8f3b76eaf96d624a81c2c620c44426a3acc6cbd9'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox|${pkgname%-bin}|g;s|=desktop|=${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/desktop.desktop"
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed "s|(qe.main),Ee.isPackaged|(qe.main),!Ee.isPackaged|g" -i "${srcdir}/app.asar.unpacked/public/build/main.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/desktop.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/squashfs-root/desktop.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}