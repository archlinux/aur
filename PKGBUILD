# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=grinplusplus-bin
_pkgname=GrinPlusPlus
_appname="Grin++"
pkgver=1.2.9
_electronversion=11
pkgrel=2
pkgdesc="A C++ Grin Node & Wallet For Linux.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://grinplusplus.github.io"
_ghurl="https://github.com/GrinPlusPlus/GrinPlusPlus"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
    'openssl-1.1'
)
makedepends=(
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}.${pkgver}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/GrinPlusPlus/GrinPlusPlus/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
options=(
    '!strip'
)
sha256sums=('300440ca4965175a35c30899cac7e105c93957c7d19fe608c24fb99c48e910f9'
            'a5e9383c3cb97aa3034e5e4bf1c94a71db0c59b3a7ec1fbf198232fb9dcc5e53'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_appname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\"\/opt\/${_appname}\/${pkgname%-bin}\"/${pkgname%-bin}/g
        s/Finance/Utility/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "${srcdir}/opt/${_appname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed "s/if (isDevMode)/if (!isDevMode)/g" -i "${srcdir}/app.asar.unpacked/build/electron-starter.js"
    find "${srcdir}/app.asar.unpacked/build" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_appname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}