# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=loomy-bin
_pkgname=Loomy
_debname="cn.xunfei.${pkgname%-bin}.otohime"
pkgver=0.9.39
_electronversion=42
pkgrel=1
pkgdesc="Third-party Linux client for Loomy.第三方Loomy Linux 客户端.Loomy，你的AI工作搭子。不只是听指令的助手，更会主动理解你、帮助你，将你的想法实现并交付。"
arch=(
    'aarch64'
    'x86_64'
)
url="https://loomy.xunfei.cn"
_dlurl="https://github.com/kota-rina3/hokeshi"
license=('LicenseRef-loomy')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
source=(
    "LICENSE.html::${url}/docs/Safe/Loomy-user"
    "${pkgname%-bin}.js"
    "${pkgname%-bin}.sh"
)
options=('!strip')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_dlurl}/releases/download/${_pkgname}${pkgver}/${_debname}_${pkgver}.0_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_dlurl}/releases/download/${_pkgname}${pkgver}/${_debname}_${pkgver}.0_amd64.deb")
sha256sums=('681ca4f4ed3c44337a1fe49f5fa012e83b0dea0d39908de0c82eb37e582a7feb'
            '562897be8a17076176f8d985c0d7bc1c685f2e7c9b3a932339ce015963243627'
            '62b13196a0e502ce4aa21ce710dfcfe83440bfaf87cb998ae4449780d4a9c9e6')
sha256sums_aarch64=('a596546aaa9a41a700d5d78d14984cda46e042cb0a00e556a1e91b517ea33ae5')
sha256sums_x86_64=('437632c79b16bad0c7126e96e7729005eae4396ab211593340539627476c098d')
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
    bsdtar -xf "${srcdir}/data."*
    _check_electron_version
    sed -i -e "
        s/Exec=\/opt\/apps\/${_debname}\/files\/${pkgname%-bin}/Exec=${pkgname%-bin} %U/g
        s/Icon=\/opt\/apps\/${_debname}\/files\/resources\/${_pkgname}.png/Icon=${pkgname%-bin}/g
    " "${srcdir}/opt/apps/${_debname}/entries/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/opt/apps/${_debname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _install_icons
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}