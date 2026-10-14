# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=godot-launcher-bin
_pkgname='Godot Launcher'
_debname=org.godotlauncher.launcher
pkgver=1.13.0
_electronversion=43
pkgrel=1
pkgdesc="A streamlined, open-source tool designed to simplify and accelerate your Godot game development workflow."
arch=(
    'aarch64'
    'x86_64'
)
url="https://godotlauncher.org/"
_ghurl="https://github.com/godotlauncher/launcher"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
)
source=(
    "LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/godotlauncher/launcher/v${pkgver}/LICENSE.txt"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname// /_}-${pkgver}-linux_aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname// /_}-${pkgver}-linux_x86_64.rpm")
sha256sums=('982e513d86e81b53d35a4c757a54ce36c7b77752feeaac2dfaab3ddd0c86d7b1'
            'dfcd6603d29c7b8d88e019b517a2e5c1a7b5ab905a0961a8b81adfa508b258b8')
sha256sums_aarch64=('823318309995cf9b61757bf5e19332d3252e95edce7396de4e6d6f98ec8dd17d')
sha256sums_x86_64=('80fc9baaf1aba56dadad0ed749bcf15bba9f47c533e8ff1a3e7ec12ee4e0b276')
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
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _check_electron_version
    sed -i -e "
        s/\"\/opt\/${_pkgname}\/${_pkgname}\"/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_debname}.desktop"
    sed -i "s/${_debname}/${pkgname%-bin}/g" "${srcdir}/usr/share/metainfo/${_debname}.metainfo.xml"
    asar e "$(_get_app_dir)/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked/dist-electron" -type f -exec sed -i "s/${_debname}.desktop/${pkgname%-bin}.desktop/g" {} +
    local _archrem=$([[ "${CARCH}" == "aarch64" ]] && echo x64 || echo arm)
    find "${srcdir}" -type d \
        \( -name '*darwin*' -o -name "*ia32*" -o -name '*android*' -o -name '*win32*' -o -name "*${_archrem}*" \) \
        -prune -exec rm -rf {} +
    find "${srcdir}" -type f \
        \( -name '*darwin*.*' -o -name "*ia32*.*" -o -name '*android*.*' -o -name '*win32*.*' -o -name "*${_archrem}*.*" \) \
        -delete
    asar p "${srcdir}/app.asar.unpacked" "$(_get_app_dir)/resources/app.asar"
    find "$(_get_app_dir)/resources" -type d -exec chmod 755 {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/metainfo/${_debname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
