# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=issie-bin
pkgver=6.3.12
_electronversion=43
pkgrel=1
pkgdesc="An intuitive cross-platform hardware design application."
arch=(
    'aarch64'
    'x86_64'
)
url="https://tomcl.github.io/issie"
_ghurl="https://github.com/tomcl/issie"
license=('GPL-3.0-only')
conflits=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'asar'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-arm64.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.zip")
sha256sums=('dfcd6603d29c7b8d88e019b517a2e5c1a7b5ab905a0961a8b81adfa508b258b8')
sha256sums_aarch64=('581de4a06463e1efb29c2f191a2e82240bf8572918349471ac9e41b17115c55f')
sha256sums_x86_64=('f7a497068037f464877c7924ff2e03d9162b91ee5eab20b568495a105c37de53')
_get_app_dir() {
	find "${srcdir}" -type f -name "resources.pak" ! -path "*/node_modules/*" -printf '%h\n' 2>/dev/null \
		| while read -r d; do [[ -d "${d}/resources" ]] && { echo "$d"; return 0; }; done
}
_check_electron_version() {
	local _v=$(strings "$(find "$(_get_app_dir)" -maxdepth 1 -type f \
		-executable -printf '%s %p\n' | sort -nr | head -1 | cut -d' ' -f2-)" \
		| grep -oP 'Electron/\K[0-9]+' | head -1)
	[[ -z "$_v" ]] && { echo -e "\033[1;33mNote: Could not check version.\033[0m"; return; }
	(( _v == _electronversion )) && c=32 || c=31
	echo -e "Electron version: \033[1;${c}m$_v$([[ $c -eq 31 ]] && echo " (expected $_electronversion)")\033[0m"
}
prepare() {
    _check_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${pkgname%-bin}" \
        --exec="${pkgname%-bin} --no-sandbox %U"
    asar e "$(_get_app_dir)/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed -i '1s/^/const path = require("path");\n/' "${srcdir}/app.asar.unpacked/build/index.js"
    sed -i 's/process\.defaultApp === true/process.env.ELECTRON_IS_DEV !== "0"/' "${srcdir}/app.asar.unpacked/build/index.js"
    find "${srcdir}/app.asar.unpacked/build" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    local _archrem=$([[ "${CARCH}" == "aarch64" ]] && echo x64 || echo arm)
	find "$(_get_app_dir)" -type d \
		\( -name 'darwin*' -o -name '*android*' -o -name 'win32*' -o -name "*ia32*" -o -name "*${_archrem}*" \) \
		-prune -exec rm -rf {} +
    asar p "${srcdir}/app.asar.unpacked" "$(_get_app_dir)/resources/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "$(_get_app_dir)/resources/static/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}
