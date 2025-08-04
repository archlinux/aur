# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=tomato
pkgname="${_appname}-radio-automation-bin"
_pkgname="Tomato Radio Automation"
pkgver=0.12.21
_electronversion=37
pkgrel=1
pkgdesc="Tomato Radio Automation desktop client. Dead simple radio ads.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://dtcooper.github.io/tomato/"
_ghurl="https://github.com/dtcooper/tomato"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_appname}-client-v${pkgver}-linux_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_appname}-client-v${pkgver}-linux_amd64.deb")
sha256sums=('31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('b6e0ee38809bee0a25f429630facc72ee8a0bf9d76febe5e8d87a3e5ffd329f1')
sha256sums_x86_64=('0832e6f40b7c4dce07dcc51aefbfe1fee9ac60144f85d23344684407a0d5fb8c')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/usr/lib/${_appname}/${_appname}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_electronversion}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _get_electron_version
    sed -i "s/${_appname}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib/${_appname}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/doc/${_appname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
