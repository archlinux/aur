# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=frame-cast-bin
_pkgname=FrameCast
pkgver=1.1.0
_electronversion=24
pkgrel=3
pkgdesc="An application that allows you to stream a particular region of your screen to a window. This window can then be shared on video conferencing applications such as Google Meet.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/nathan-fiscaletti/framecast"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}.Setup.linux_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/nathan-fiscaletti/framecast/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('3f1bf61f18582971141a81a81210bb8ee1ade7fb70dfad5ef27348dc91c461d7'
            '7c7be32e763aaac6bdc8702c430ecd9cf84bbdee8e53071979c5ed2fad37dbf8'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}