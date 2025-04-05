# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=bitshares_astro_ui
pkgname="${_appname//_/-}-bin"
_pkgname=BTSAstroUI
_orginame='Bitshares Astro UI'
pkgver=0.4.1
_electronversion=35
pkgrel=1
pkgdesc="A Bitshares UI built using Astro, React and Electron!.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/BTS-CM/astro-ui"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'libvips'
)
makedepends=(
    'asar'
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/BTS-CM/astro-ui/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('210ec7ce014d93c91d64ea6a716299c09964f21fbf623134fc2a938e48870fef'
            '8436084a3b95dce1c186bc57a5ab4832a03df731cfb652befe8764a5018eea35'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\"\/opt\/${_orginame}\/${_pkgname} %U\"/${pkgname%-bin}/g
        s/Icon=${_pkgname} %U/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname} %U.desktop"
    asar e "${srcdir}/opt/${_orginame}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked/app" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_orginame}/resources/"{app.asar.unpacked,astroDist} "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname} %U.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname} %U.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
