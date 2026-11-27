# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# `vscodium-electron.js` from Richardn <rniu at umich dot edu>
_appname=code
_pkgname="visual-studio-${_appname}"
pkgname="${_pkgname}-electron-bin"
_debname=com.microsoft.VSCode
pkgver=1.148.0
_electronversion=43
pkgrel=2
pkgdesc="Visual Studio Code (vscode): Editor for building and debugging modern web and cloud applications."
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://code.visualstudio.com/"
_ghurl="https://github.com/microsoft/vscode"
#_dlurl="https://packages.microsoft.com/yumrepos/vscode/Packages/c"
#_dlurl="https://packages.microsoft.com/repos/code/pool/main/c/code/"
license=('LicenseRef-scancode-commercial-license')
provides=(
    "${_pkgname}"
    "vs${_appname}"
    "${_appname}"
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
    'webkit2gtk-4.1'
    'libsecret'
    'glibc>=2.28'
    'gcc-libs>=8.1.0'
    'openssl-3'
    'ripgrep'
    'nodejs'
)
optdepends=(
    'gvfs: For move to trash functionality'
    'libdbusmenu-glib: For KDE global menu'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}.js"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::https://update.code.visualstudio.com/${pkgver}/linux-rpm-arm64/stable")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.rpm::https://update.code.visualstudio.com/${pkgver}/linux-rpm-armhf/stable")
source_x86_64=("${pkgname%-bin}-${pkgver}-${CARCH}.rpm::https://update.code.visualstudio.com/${pkgver}/linux-rpm-x64/stable")
sha256sums=('4e629b50633624a4092c6d105aa2300bb0b1c7d979599a843b4468d903886f3b'
            '3211b90722e2c34c51d41c31726eb6f7c3cecbb6d215c4a281e47b264ba6239e')
sha256sums_aarch64=('8180ffb2166f197b7bd2d3610abae439a2d0608d4a36fe15f31fd851b0f360bb')
sha256sums_armv7h=('f75166dee05f859a05e2cfb811e25b7fbe38d3dba9621f8081de56af944f900d')
sha256sums_x86_64=('ec85173fcf8fd244badb045995ba260bea224831145d317188b2aa165363995f')
pkgver() {
	cat "${srcdir}/.pkgver" 2>/dev/null || echo "${pkgver}"
}
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
_generate_icons() {
	local _sizes=(16 24 32 48 64 96 128 256 512 1024) _src="$(_get_app_dir)/resources/app/resources/linux/code.png" _s
	for _s in "${_sizes[@]}"; do
		install -d "${pkgdir}/usr/share/icons/hicolor/${_s}x${_s}/apps"
		magick "${_src}" -background none -filter Lanczos -resize "${_s}x${_s}" \
			-strip -define png:compression-level=9 \
			"${pkgdir}/usr/share/icons/hicolor/${_s}x${_s}/apps/${pkgname%-bin}.png"
	done
}
prepare() {
    _check_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh" "${srcdir}/${pkgname%-bin}.js"
    grep '"version": ' "$(_get_app_dir)/resources/app/package.json" | awk '{print $2}' | tr -d '"' | tr -d ',' > "${srcdir}/.pkgver"
    sed -i "s/${_debname}.desktop/${pkgname%-bin}.desktop/g" "${srcdir}/usr/share/appdata/${_debname}.appdata.xml"
    sed -i -e "
        s/\/usr\/share\/${_appname}\/${_appname}/${pkgname%-bin}/g
        s/Icon=vs${_appname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_debname}"*.desktop
    rm -rf "$(_get_app_dir)/resources/app/node-compile-cache"
    case "${CARCH}" in
		x86_64)  _rgdir=linux-x64   ;;
		aarch64) _rgdir=linux-arm64 ;;
		armv7h)  _rgdir=linux-arm   ;;
		*) echo "Unsupported CARCH: ${CARCH}" >&2; return 1 ;;
	esac
    ln -sf "/usr/bin/rg" "$(_get_app_dir)/resources/app/node_modules.asar.unpacked/@vscode/ripgrep-universal/bin/${_rgdir}/rg"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    ln -s "${pkgname%-bin}" "${pkgdir}/usr/bin/${_appname}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "$(_get_app_dir)/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/usr/share/appdata/${_debname}.appdata.xml" "${pkgdir}/usr/share/appdata/${pkgname%-bin}.appdata.xml"
    install -Dm644 "${srcdir}/usr/share/applications/${_debname}.UrlHandler.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}-UrlHandler.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/mime/packages/${_appname}-workspace.xml" "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}-workspace.xml"
    _generate_icons
    install -Dm644 "${srcdir}/usr/share/bash-completion/completions/${_appname}" -t "${pkgdir}/usr/share/bash-completion/completions"
    install -Dm644 "${srcdir}/usr/share/zsh/site-functions/_${_appname}" -t "${pkgdir}/usr/share/zsh/vendor-completions/"
    install -Dm644 "${srcdir}/usr/share/${_appname}/resources/app/licenses/"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}