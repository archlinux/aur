# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=codium
_pkgname="vs${_appname}"
pkgname="${_pkgname}-electron-bin"
pkgver=1.93.0.24253
_electronversion=30
pkgrel=1
pkgdesc="VS Code without MS branding/telemetry/licensing.Prebuild and System-wide Electron edition"
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
)
conflicts=(
    "${pkgname%-bin}"
    "${_pkgname}"
    "${_appname}"
)
depends=(
    "electron${_electronversion}"
    'libsecret'
    'libx11'
    'libxkbfile'
    'ripgrep'
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
            '71463726de1e6b3d8e2daf8d6816f2dc616ebac36c7097c5829074ca38a95309'
            '164bbaffe22f4ad43607f44a114528317c4d63592b88e911abadfa962443ac26')
sha256sums_aarch64=('541a91012fd120602401def109aa5a6ad2bb9d2d5211ae76ff4a65be5658737a')
sha256sums_armv7h=('0e1825e5351c72c0ad71563a4d683e45d7d106b606e61c6bfc91be43da11dab0')
sha256sums_x86_64=('ef4c6db9635b172982934a057ca5751560dc9f48f7bfb010690569407f7ddc08')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/
        s/@appname@/${pkgname%-bin}/
        s/@runname@/app.asar/
        s/@cfgdirname@/${_pkgname}/
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s/${_appname}.desktop/${pkgname%-bin}.desktop/" -i "${srcdir}/usr/share/appdata/${_appname}.appdata.xml"
    sed "s/\/usr\/share\/${_appname}\/${_appname}/${pkgname%-bin}/;s/Icon=${_pkgname}/Icon=${pkgname%-bin}/" \
        -i "${srcdir}/usr/share/applications/"{"${_appname}-url-handler.desktop","${_appname}.desktop"}
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