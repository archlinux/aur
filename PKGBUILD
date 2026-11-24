# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=qoder-cn
pkgname="${_appname}-ide-bin"
_pkgname='Qoder IDE'
pkgver=1.41.1
_electronversion=42
pkgrel=1
pkgdesc="面向真实软件开发的 AI 原生 Qoder CN IDE。"
arch=(
    'aarch64'
    'x86_64'
)
url="https://qoder.cn"
license=("LicenseRef-${_appname}")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'libxkbfile'
    'nodejs'
    'python'
)
optdepends=(
    'bash'
    'zsh'
)
options=(
    '!emptydirs'
    '!strip'
)
source=(
    "LICENSE.html"
    "${pkgname%-bin}.js"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::https://qoder-ide-cn.oss-cn-hangzhou.aliyuncs.com/qoder/release/lastest/${pkgname%-bin}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::https://qoder-ide-cn.oss-cn-hangzhou.aliyuncs.com/qoder/release/lastest/${pkgname%-bin}_amd64.deb")
sha256sums=('d93359b3ca57aec94960975eec23b6412dc8fc0c5b5fcbce57bee0931e01ec61'
            'd0f201d4e9b0690ccfbe9034779bf95a7a92996cef63a957bf15ea11c7d83236'
            '6295de105284c8d173a862217d76eee1610dad92dd5543f3f9e6a08a6a77929a')
sha256sums_aarch64=('709c11b7ae42287893405e680c0810d3ab6df372d5458b66eaacc55bf5ea33f6')
sha256sums_x86_64=('46db09f3daa123a1205e4d9f933f68c6cb9ef044101f226d2307665db9dc54db')
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
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/control."*
	sed -nE 's/^Version:[[:space:]]*([0-9]+:)?([0-9]+(\.[0-9]+)*).*/\2/p' "${srcdir}/control" | head -n1 > "${srcdir}/.pkgver"
    bsdtar -xf "${srcdir}/data."*
    _check_electron_version
    sed -i "s/\/usr\/share\/${pkgname%-bin}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}"*.desktop
    find "$(_get_app_dir)/resources/app" -type d \( -name "*win32*" -o -name "*darwin*" -o -name "*arm*" \) -exec rm -rf {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    _install_icons
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}"* -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/appdata/${pkgname%-bin}.appdata.xml" -t "${pkgdir}/usr/share/appdata"
    install -Dm644 "${srcdir}/usr/share/mime/packages/${pkgname%-bin}-workspace.xml" -t "${pkgdir}/usr/share/mime/packages"
    [[ -x /usr/bin/bash ]] && install -Dm644 "${srcdir}/usr/share/bash-completion/completions/${_appname}" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
    [[ -x /usr/bin/zsh ]] && install -Dm644 "${srcdir}/usr/share/zsh/vendor-completions/_${_appname}" "${pkgdir}/usr/share/zsh/vendor-completions/_${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}