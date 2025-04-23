# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# `vscodium-electron.js` from Richardn <rniu at umich dot edu>
_appname=codium
_pkgname="vs${_appname}"
pkgname="${_pkgname}-electron-bin"
pkgver=1.99.32704
_electronversion=34
pkgrel=1
pkgdesc="VS Code without MS branding/telemetry/licensing.(Prebuilt and System-wide Electron edition)"
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
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/${pkgver}/codium-${pkgver}-el9.aarch64.rpm")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.rpm::${_ghurl}/releases/download/${pkgver}/codium-${pkgver}-el9.armv7hl.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/${pkgver}/codium-${pkgver}-el9.x86_64.rpm")
sha256sums=('ed289092386002771285e3423f66f49af65ff918e1b667b517d977fa4fe1f057'
            '7222e3026ab0eda7d60698a036354a2bae4d0878b1d75fc893c91e30b60804bf'
            '164bbaffe22f4ad43607f44a114528317c4d63592b88e911abadfa962443ac26')
sha256sums_aarch64=('8a7241bc65191af4e650adff329adced9c388660c52f26951f85ad10edddf0da')
sha256sums_armv7h=('599c5f2d3ce0fcfecea6fa898fab0a0ad70fa9202a083fd2c2d2ac5756bbbd59')
sha256sums_x86_64=('5ec86c259fe75afd33df05170f9f3ca504cf0df0be4d8f7dec2954f9e38ebb55')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/@ELECTRON@/electron${_electronversion}/g" "${srcdir}/${pkgname%-bin}.js"
    sed -i "s/${_appname}.desktop/${pkgname%-bin}.desktop/g" "${srcdir}/usr/share/appdata/${_appname}.appdata.xml"
    sed -i -e "
        s/\/usr\/share\/${_appname}\/${_appname}/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/"{"${_appname}-url-handler.desktop","${_appname}.desktop"}
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${_appname}/resources/app/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/appdata/${_appname}.appdata.xml" "${pkgdir}/usr/share/appdata/${pkgname%-bin}.appdata.xml"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}-url-handler.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}-url-handler.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/bash-completion/completions/${_appname}" -t "${pkgdir}/usr/share/bash-completion/completions"
    install -Dm644 "${srcdir}/usr/share/zsh/site-functions/_${_appname}" -t "${pkgdir}/usr/share/zsh/vendor-completions/"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}