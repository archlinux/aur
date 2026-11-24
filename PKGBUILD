# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=qwen-work-cn-bin
_pkgname=QwenWorkCN
pkgver=1.3.1
_electronversion=37
pkgrel=1
pkgdesc="千问办公 (QwenWork) - Alibaba AI office desktop client"
arch=(
    'aarch64'
    'x86_64'
)
url="https://qwenwork.cn/"
license=('LicenseRef-custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
	"electron${_electronversion}"
    'python'
    'python-numpy'
    'python-reportlab'
    'python-beautifulsoup4'
    'python-defusedxml'
    'python-lxml'
    'python-pygments'
    'python-pillow'
    'python-keyring'
    'libsecret'
    'libxt'
    'nodejs'
)
source=(
    "LICENSE.html::https://terms.alicdn.com/legal-agreement/terms/privacy_policy_full/20260709092132640/20260709092132640.html"
	"${pkgname%-bin}.js"
	"${pkgname%-bin}.sh"
)
options=(
    '!strip'
    '!debug'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::https://assets.qwenwork.cn/release/latest/qwenworkcn-linux-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::https://assets.qwenwork.cn/release/latest/qwenworkcn-linux-amd64.deb")
sha256sums=('7fcf55b68e954bd779f5f0907e5d3820da72a8aa751616eb49e00bca43371971'
            'f6d64b3c1271114e0036c34f4b774949b8bda5d6afa1e2b82784eeafea8d6a7a'
            'b728201bc9b6edc7627aa801bd875d802cffd85035406afe8eae44cca001611e')
sha256sums_aarch64=('175356487839ff5727f02301a992a9e19bad87161ccc996ecf1b522f2a2e8cf3')
sha256sums_x86_64=('74351965032763946e5d8995b48ff9a360014406f8ba5786e7247fde9987fce5')
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
	bsdtar -xf "${srcdir}/control."*
	sed -nE 's/^Version:[[:space:]]*([0-9]+(\.[0-9]+)*).*/\1/p' "${srcdir}/control" | head -n1 > "${srcdir}/.pkgver"
	bsdtar -xf "${srcdir}/data."*
	_check_electron_version
	sed -i "s/\/opt\/apps\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _delete_other_arch_files
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 "${srcdir}/${pkgname%-bin}.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
	cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
	_install_icons
	install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}