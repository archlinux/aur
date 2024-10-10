# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# `vscodium-electron.js` from Richardn <rniu at umich dot edu>
_appname=codium
_pkgname="vs${_appname}"
pkgname="${_pkgname}-electron-bin"
pkgver=1.94.2.24284
_electronversion=30
pkgrel=1
pkgdesc="VS Code without MS branding/telemetry/licensing.Prebuilt and System-wide Electron edition."
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://vscodium.com/"
_ghurl="https://github.com/VSCodium/vscodium"
license=("MIT")
provides=(
    "${_pkgname}=${pkgver}"
    "${_appname}=${pkgver}"
)
conflicts=(
    "${pkgname%-bin}"
    "${_pkgname}"
    "${_appname}"
    "${_pkgname}-insiders"
    "${_pkgname}-marketplace"
)
depends=(
    "electron${_electronversion}"
    'libx11'
    'libxkbfile'
    'nodejs'
)
optdepends=(
	'gvfs: For move to trash functionality'
	'libdbusmenu-glib: For KDE global menu'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/VSCodium/vscodium/${pkgver}/LICENSE"
    "${pkgname%-bin}.js"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/${pkgver}/codium_${pkgver}_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_ghurl}/releases/download/${pkgver}/codium_${pkgver}_armhf.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/${pkgver}/codium_${pkgver}_amd64.deb")
sha256sums=('ed289092386002771285e3423f66f49af65ff918e1b667b517d977fa4fe1f057'
            '3ed94f3752e2695f64b6c5e9c40120837f463bfe55f330fd59a285c7d21f4bf2'
            '164bbaffe22f4ad43607f44a114528317c4d63592b88e911abadfa962443ac26')
sha256sums_aarch64=('260ca05e89ebf19844602d38ce204d006826928471aeb44692845f301d6f245d')
sha256sums_armv7h=('2d643d1fd59773588298dd5dd28a03ca5d2a62f56e162d023e616eb4814e0044')
sha256sums_x86_64=('8ad865b90e1543fe615f8c03bf60c04130b2fb7a0599990f48f5743dde84d0aa')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/${_appname}.desktop/${pkgname%-bin}.desktop/g" "${srcdir}/usr/share/appdata/${_appname}.appdata.xml"
    sed -e "
        s/\/usr\/share\/${_appname}\/${_appname}/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " -i "${srcdir}/usr/share/applications/"{"${_appname}-url-handler.desktop","${_appname}.desktop"}
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/share/${_appname}/resources/app/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/appdata/${_appname}.appdata.xml" "${pkgdir}/usr/share/appdata/${pkgname%-bin}.appdata.xml"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}-url-handler.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}-url-handler.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/bash-completion/completions/${_appname}" -t "${pkgdir}/usr/share/bash-completion/completions"
    install -Dm644 "${srcdir}/usr/share/zsh/vendor-completions/_${_appname}" -t "${pkgdir}/usr/share/zsh/vendor-completions/"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}