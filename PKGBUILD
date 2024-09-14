# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=tomato
pkgname="${_appname}-radio-automation-bin"
_pkgname="Tomato Radio Automation"
pkgver=0.11.8
_electronversion=32
pkgrel=1
pkgdesc="Tomato Radio Automation desktop client. Dead simple radio ads.Prebuilt version.Use system-wide electron."
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
sha256sums=('291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('43a4b15b057fbf875ced7e8ce80f70fc8f33430cf463af495faf781d403f14ac')
sha256sums_x86_64=('2fb14d7fbb1fe2caf298608fa7330fa8ecc2e5a149cb645d75d7a47582ba9b98')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/
        s/@appname@/${pkgname%-bin}/
        s/@runname@/app.asar/
        s/@cfgdirname@/${_pkgname}/
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s/${_appname}/${pkgname%-bin}/" -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${_appname}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/doc/${_appname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}