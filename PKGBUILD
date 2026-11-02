# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=calmly-writer-bin
_pkgname=CalmlyWriter
pkgver=3.0.8
_electronversion=41
pkgrel=1
pkgdesc="An editor designed to focus on what you want to tell, with a simple, unobtrusive and ease-to-use user interface."
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.calmlywriter.com"
license=('LicenseRef-custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
options=('!strip')
depends=(
    "electron${_electronversion}"
)
source_aarch64=("${pkgname%-bin}_${pkgver}-aarch64.rpm::${url}/pro/releases/${pkgname%-bin}-3-${pkgver}.aarch64.rpm")
source_x86_64=("${pkgname%-bin}_${pkgver}-x86_64.rpm::${url}/pro/releases/${pkgname%-bin}-3-${pkgver}.x86_64.rpm")
source=(
    "LICENSE.html::${url}/eula.htm"
    "${pkgname%-bin}.js"
    "${pkgname%-bin}.sh"
)
sha256sums=('eae42c5c4e04399d0a95a177b4a0e4652da78b80ac2e56d32b6777445a8a8d51'
            '562897be8a17076176f8d985c0d7bc1c685f2e7c9b3a932339ce015963243627'
            'ace275e253744ca62d2572776df26b947f3c89616239985003126db635fc300e')
sha256sums_aarch64=('07584463e3b5feb493edbc9412ce36e0ac664c87cad491de2e494923673f1b28')
sha256sums_x86_64=('24f2bbae58d48faa8b0adab3cdfdfcd35a20a012b396be35a537e854259b51b1')
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
    _check_electron_version
    sed -i -e "
        s/\/opt\/${_pkgname}Pro\/${pkgname%-bin}-3/${pkgname%-bin}/g
        s/Icon=${pkgname%-bin}-3/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}-3.desktop"
    local _archrem=$([[ "${CARCH}" == "aarch64" ]] && echo x64 || echo arm)
	find "$(_get_app_dir)" -type d \
		\( -name '*darwin*' -o -name '*android*' -o -name 'win32*' -o -name "*ia32*" -o -name "*${_archrem}*" \) \
		-prune -exec rm -rf {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
	cp -a "$(_get_app_dir)/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    _install_icons
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}-3.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
