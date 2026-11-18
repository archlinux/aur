# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=claude-loom-bin
_pkgname=Claude-Loom
pkgver=0.6.2
_electronversion=45
pkgrel=1
pkgdesc="Graphical shell for Claude Code CLI, Electron."
arch=('x86_64')
url="https://github.com/HyotmakFin/claude-loom"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
	"electron${_electronversion}"
    'claude-code'
)
options=(
	'!emptydirs'
)
source=(
	#"${pkgname%-bin}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.pacman"
	"${pkgname%-bin}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
	"LICENSE-${pkgver}::https://raw.githubusercontent.com/HyotmakFin/claude-loom/v${pkgver}/LICENSE"
	"${pkgname%-bin}.js"
	"${pkgname%-bin}.sh"
)
sha256sums=('2e7fddfcc92007ddfe0265a3e1717b489be30f8a56254245caec175b23c67b0e'
            '411acb0f56828c35f9993467a27bd069a7b62607a1fb9edfdd4ab1d2a4396819'
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
prepare() {
	sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
	" "${srcdir}/${pkgname%-bin}.sh" "${srcdir}/${pkgname%-bin}.js"
	chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
	rm -rf "${srcdir}/squashfs-root"
	"${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
	_check_electron_version
	sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g" "$(_get_app_dir)/${pkgname%-bin}.desktop"
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	install -Dm644 "${srcdir}/${pkgname%-bin}.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
	cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
	_install_icons
	install -Dm644 "$(_get_app_dir)/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
