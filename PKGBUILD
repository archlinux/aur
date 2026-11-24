# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=teleagent-bin
_pkgname=TeleAgent
pkgver=3.1.1
_electronversion=43
pkgrel=1
pkgdesc="Star super intelligence TeleAgent, an agent product installed on a personal computer with one click, a capable and reliable AI office partner.星辰超级智能体TeleAgent，一键安装在个人电脑上的Agent产品，能干可靠的AI办公搭子。"
arch=(
    'aarch64'
    'x86_64'
)
url="https://ta.teleai.com.cn"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
	"electron${_electronversion}"
    'nodejs'
    'python'
    'python-cryptography'
    'python-keyring'
    'python-reportlab'
    'python-lxml'
    'python-requests'
    'python-httpx'
    'python-matplotlib'
    'python-pillow'
    'python-numpy'
    'python-six'
    'python-defusedxml'
    'python-yaml'
    'python-beautifulsoup4'
    'libxt'
    'ripgrep'
)
source=("LICENSE.html::https://www.teleai.com.cn/doc/xewi3C5y15p87wcRIKfH/GJet9K8NKJrIKnz1hYuK")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::https://agent.teleai.com.cn/superCowork/sapi/api/download/redirect/linux-arm64")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::https://agent.teleai.com.cn/superCowork/sapi/api/download/redirect/linux-x64")
sha256sums=('2308bad99fb7284f11da18d39a9b6183706833022e85df246a67e8d6b7c100ee')
sha256sums_aarch64=('80b13bf2299e346ed460f773c52252bcdcee46961b6cec15c15bde9b19932895')
sha256sums_x86_64=('ee43cd0b803c46b0e749025791452097354612e28c1cd314798b8c99b193498c')
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
    bsdtar -xf "${srcdir}/control."*
    sed -nE 's/^Version:[[:space:]]*([0-9]+(\.[0-9]+)*).*/\1/p' "${srcdir}/control" | head -n1 > "${srcdir}/.pkgver"
	bsdtar -xf "${srcdir}/data."*
	_check_electron_version
	sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _delete_other_arch_files
    local _arch=$([[ "${CARCH}" == "aarch64" ]] && echo linux-arm64 || echo linux-x64)
    ln -sf "/usr/bin/rg" "$(_get_app_dir)/resources/ripgrep/${_arch}/rg"
}
package() {
	install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname%-bin}"}
	cp -a "$(_get_app_dir)/"* "${pkgdir}/usr/lib/${pkgname%-bin}/"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
	_install_icons
	install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    _file_list=(chrome_100_percent.pak chrome_200_percent.pak chrome-sandbox icudtl.dat libEGL.so libffmpeg.so \
        libGLESv2.so libvk_swiftshader.so libvulkan.so.1 resources.pak)
    for _files in "${_file_list[@]}";do
        ln -sf "/usr/lib/electron${_electronversion}/${_files}" "${pkgdir}/usr/lib/${pkgname%-bin}/${_files}"
    done
}