# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=runjs
pkgname="${_appname}-electron-bin"
_pkgname=RunJS
pkgver=3.1.2
_electronversion=32
pkgrel=1
pkgdesc="A JavaScript playground. Write code with instant feedback and access to Node.js and browser APIs.(Prebuild version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://runjs.app"
_ghurl="https://github.com/lukehaas/RunJS"
license=('LicenseRef-custom')
conflicts=(
    "${_appname}"
    "${pkgname%-bin}"
)
provides=("${_appname}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'python'
    'python-setuptools'
    'python-typing_extensions'
    'python-packaging'
    'nodejs'
)
makedepends=(
    'asar'
)
options=(
    '!strip'
)
source=(
    "LICENSE.html"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}.x86_64.rpm")
sha256sums=('f8d6f02b4a2fc7cc6ab547a72eb48fbe2cdcc4a70e99d48e554be3acda074d5d'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('0958588f9920f2d6f1b8a5551447e5a7c7eb6f7323e16d63cf0c0fdfad7da136')
sha256sums_x86_64=('462cfcbf9cdd4490f4d3bc1230d06af581b2848a96940a37555ff3946e69f97f')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_appname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/\/opt\/${_pkgname}\/${_appname}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${_appname}.desktop"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked" -not -path "${srcdir}/app.asar.unpacked/node_modules" \
        -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    case "${CARCH}" in
        aarch64)
            rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/@esbuild/linux-x64"
            ;;
        x86_64)
            rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/@esbuild/linux-arm64"
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/"{app.asar.unpacked,locales,packages} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}