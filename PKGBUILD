# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=flare
pkgname="${_appname}-player-bin"
_pkgname="Flare Player"
pkgver=1.15.0
_electronversion=35
pkgrel=1
pkgdesc='An "unofficial" emulator based on Ruffle Flash Emulator. Created to provide a friendly interface and enhanced playing experience. It is a complete alternative to Adobe Flash Player. Run Flash Safely Anywhere.(Prebuilt version.Use system-wide electron)'
arch=('x86_64')
url="https://github.com/jooy2/flaru"
license=("LicenseRef-custom")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/${pkgver}/${_pkgname// /.}.${pkgver}_${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/jooy2/flaru/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('97e88b1e1f048e8d98ea8a3968d575b8f90eb6689ff735a21bedf0d15a368c85'
            '73e127f0f0a4e9035191cd3a5036a3d9e360523c66892449830ee0bf44ea511b'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/\"\/opt\/${_pkgname}\/${_appname}\"/${pkgname%-bin}/g
        s/=${_pkgname}/=${pkgname%-bin}/g
        s/Game/Utility/g
    " "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}