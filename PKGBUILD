# Maintainer: FBis251 <aur at fbis251 dot com>
# Contributor: zxp19821005
# Current implementation below provided by zxp19821005

pkgname=heynote-bin
_pkgname=Heynote
pkgver=2.6.1
_electronversion=35
pkgrel=1
pkgdesc="A dedicated scratchpad for developers"
arch=('x86_64')
url="https://github.com/heyman/heynote"
license=('LicenseRef-Commons-Clause-1.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_${CARCH}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/heyman/heynote/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('340ee82aeb63c63d4286fec427457b2f4b85d6831266a87decbcba5186f386e4'
            'd78b14a03247374515264208d64b975e100af8a2fd0464afa07f76ca199700a7'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
