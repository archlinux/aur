# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=runjs
pkgname="${_appname}-electron-bin"
_pkgname=RunJS
pkgver=3.0.3
_electronversion=31
pkgrel=1
pkgdesc="A JavaScript playground. Write code with instant feedback and access to Node.js and browser APIs.(Prebuild version.Use system-wide electron)"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://runjs.app/"
_ghurl="https://github.com/lukehaas/RunJS"
license=('LicenseRef-custom')
conflicts=(
    "${_appname}"
    "${pkgname%-bin}"
)
prodives=("${_appname}=${pkgver}")
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
    "LICENSE.html::${url}/eula"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_appname}_${pkgver}_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_ghurl}/releases/download/v${pkgver}/${_appname}_${pkgver}_armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_appname}_${pkgver}_amd64.deb")
sha256sums=('8dfaed257fe47209cd0faf41996f5ee193b961d1461f4e9d116cf6b0fb54a041'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('f022e1a63a63cc8b4cce8bd420247fb75e948f897623d2350208b6fef93c447a')
sha256sums_armv7h=('908e0d96286b1738321f8fe4af4570c921a36e3e64ee4cf16a5701b9c89ccc10')
sha256sums_x86_64=('9bf8083dbda0279a1c779c10c28ebfcfa7278e7479ffba316a5986ab97311a1e')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_appname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/opt\/${_pkgname}\/${_appname}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${_appname}.desktop"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked" -not -path "${srcdir}/app.asar.unpacked/node_modules" \
        -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/"{app.asar.unpacked,locales,packages} "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
