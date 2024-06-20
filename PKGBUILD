# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=codium
_pkgname="vs${_appname}"
pkgname="${_pkgname}-electron-bin"
pkgver=1.90.2.24171
_electronversion=29
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
            'a9c673c3ae09a9a0dbb68e1c9f5e7f4dbedda3bc3642777f881d64261f8d0f00'
            'b7b6327d20247b5b03607696d83869222b2ca9dd20eafcac95d5307c03ae3a70')
sha256sums_aarch64=('62fb5074b628572447f86b14a1d5f03a3198212694a9fa181e8f68ad7805a55e')
sha256sums_armv7h=('42222d4f0d01bf20058618b31d2d0d4c1b7b6c16de5ee78d16b225ed6bb14fbc')
sha256sums_x86_64=('69c57d841e1e0132e7fcda0a92148836f4c58f1f1f8bd3228e999ba9ffd475fc')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|${_appname}.desktop|${pkgname%-bin}.desktop|g" -i "${srcdir}/usr/share/appdata/${_appname}.appdata.xml"
    sed "s|\/usr\/share\/${_appname}\/${_appname}|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" -i \
        "${srcdir}/usr/share/applications/${_appname}-url-handler.desktop"
    sed "s|\/usr\/share\/${_appname}\/${_appname}|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" -i \
        "${srcdir}/usr/share/applications/${_appname}.desktop"
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