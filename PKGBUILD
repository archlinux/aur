# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=flaru
pkgname="${_appname}-player-bin"
_pkgname="Flaru Player"
pkgver=1.14.0
_electronversion=33
pkgrel=1
pkgdesc='An "unofficial" emulator based on Ruffle Flash Emulator. Created to provide a friendly interface and enhanced playing experience. It is a complete alternative to Adobe Flash Player. Run Flash Safely Anywhere'
arch=('x86_64')
url="https://github.com/jooy2/flaru"
license=("LicenseRef-custom")
conflicts=(
    "${pkgname%-bin}"
    "${_appname}"
)
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/${pkgver}/${_pkgname// /.}.${pkgver}_${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/jooy2/flaru/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('2e3d57f9d58b284c2a8f7e0ff7ac350d9346d3fd518bf8408fa05273795c111f'
            '6adf14e3da771a7568e2dbac391b5f018a8f771829adeb4f077888b7102dbd2b'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    sed -e "
        s/\"\/opt\/${_pkgname}\/${_appname}\"/${pkgname%-bin}/g
        s/=${_pkgname}/=${pkgname%-bin}/g
        s/Game/Utility/g
    " -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
