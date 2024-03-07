# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=frame-cast-bin
_pkgname=FrameCast
pkgver=1.0.9
_electronversion=24
pkgrel=6
pkgdesc="An application that allows you to stream a particular region of your screen to a window. This window can then be shared on video conferencing applications such as Google Meet."
arch=("x86_64")
url="https://github.com/nathan-fiscaletti/framecast"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/nathan-fiscaletti/framecast/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('b0d1ba8fc74fa57caee9ed67abcb5bff97c73af41371920af3a29d1defb3b958'
            '7c7be32e763aaac6bdc8702c430ecd9cf84bbdee8e53071979c5ed2fad37dbf8'
            '50b10386d13e5bec806aeb78f819c4edd0208a4d184332e53866c802731217fe')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}