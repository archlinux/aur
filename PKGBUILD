# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ptah-bin
_pkgname=Ptah
pkgver=0.1.70
_electronversion=40
pkgrel=1
pkgdesc="An Electron desktop for Claude, Codex, and the coding CLIs already on your machine."
arch=('x86_64')
url="https://ptah.live"
_ghurl="https://github.com/Hive-Academy/PtahCode"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
	"electron${_electronversion}"
    'claude-code'
    'ripgrep'
    'openai-codex'
    'zsh'
    'ffmpeg'
)
source=(
	"${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/electron-v${pkgver}/${pkgname%-bin}-desktop_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/Hive-Academy/PtahCode/electron-v${pkgver}/LICENSE.md"
	"${pkgname%-bin}.js"
	"${pkgname%-bin}.sh"
)
options=(
    '!strip'
    '!emptydirs'
)
sha256sums=('ce14fb1eef47292ce0b1b9de7872ebd145cee8de14c1c34f5635f2559fce3c5b'
            '5ab364f1934f7d5fb85fc140fa353f2b319cc70a5d2a4732287e5bcd0501d636'
            '562897be8a17076176f8d985c0d7bc1c685f2e7c9b3a932339ce015963243627'
            'd1e4e7e73d690e97039739dd1bf8f1eb046c2fd7e44305b15008ad842a503904')
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
_install_icons() {
	local _src="${1:-${srcdir}}" _name="${pkgname%-bin}" _icon _ext _size _dest
	while IFS= read -r -d '' _icon; do
		_ext="${_icon##*.}"
		_size=$(echo "${_icon%/*}" | grep -oE '[0-9]+x[0-9]+|scalable' | head -1)
		[[ -z "${_size}" ]] && _size=$([[ "${_ext}" == svg ]] && echo scalable || od -An -tu1 -j16 -N8 "${_icon}" 2>/dev/null | awk '{printf "%dx%d",$1*16777216+$2*65536+$3*256+$4,$5*16777216+$6*65536+$7*256+$8}')
		[[ "${_size}" =~ ^[0-9]+x[0-9]+$ ]] || _size=scalable
		_dest=$([[ "${_icon}" == */share/pixmaps/* ]] && echo pixmaps || echo "icons/hicolor/${_size}/apps")
		install -Dm644 "${_icon}" "${pkgdir}/usr/share/${_dest}/${_name}.${_ext}"
	done < <(find "${_src}" \( -path '*/share/icons/*' -o -path '*/share/pixmaps/*' -o -path '*entries/icons/*' \) -type f \( -name '*.png' -o -name '*.svg' \) -print0 2>/dev/null)
}
_delete_other_arch_files() {
	local _archrem=$([[ "${CARCH}" == "aarch64" ]] && echo x64 || echo arm)
	find "$(_get_app_dir)" -mindepth 1 -type d \
		\( -name '*darwin*' -o -name '*android*' -o -name "*bsd*" -o -name "*musl*" -o -name "*loong*" -o -name "*riscv*" -o -name 'win32*' -o -name "*ia32*" -o -name "*${_archrem}*" \) \
		-prune -exec rm -rf {} +
	find "$(_get_app_dir)" -mindepth 1 -type f \
		\( -name '*darwin*.node' -o -name '*android*.node' -o -name 'win32*.node' -o -name "*ia32*.node" -o -name "*${_archrem}*.node" \) \
		-prune -exec rm -rf {} +
	rm -rf "$(_get_app_dir)/resources/default_app.asar"
}
prepare() {
	sed -i -e "
		s/@electronversion@/${_electronversion}/g
		s/@appname@/${pkgname%-bin}/g
	" "${srcdir}/${pkgname%-bin}.sh" "${srcdir}/${pkgname%-bin}.js"
	bsdtar -xf "${srcdir}/data."*
	_check_electron_version
	sed -i "s/\/opt\/${_pkgname}\/${pkgname%-bin}-desktop/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}-desktop.desktop"
    _delete_other_arch_files
    ln -sf "/usr/bin/claude" "$(_get_app_dir)/resources/app.asar.unpacked/node_modules/@anthropic-ai/claude-agent-sdk-linux-x64/claude"
    ln -sf "/usr/bin/rg" "$(_get_app_dir)/resources/app.asar.unpacked/node_modules/@cursor/sdk-linux-x64/bin/rg"
    ln -sf "/usr/bin/ffmpeg" "$(_get_app_dir)/resources/app.asar.unpacked/node_modules/ffmpeg-static/ffmpeg"
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 "${srcdir}/${pkgname%-bin}.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
	cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
	_install_icons
	install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}-desktop.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}