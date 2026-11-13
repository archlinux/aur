# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ytdownloader-gui-bin
_pkgname=YTDownloader
pkgver=4.1.0
_electronversion=44
pkgrel=1
pkgdesc="A modern GUI App for downloading Videos and Audios from hundreds of sites.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://ytdn.netlify.app/"
_ghurl="https://github.com/aandrew-me/ytDownloader"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
    'ffmpeg'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_Linux.deb"
    "${pkgname%-bin}.js"
    "${pkgname%-bin}.sh"
)
sha256sums=('b8e6dafa4745adfd3919e2451142e02842d5e907aae7d815b6a57470a894534f'
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
    bsdtar -xf "${srcdir}/data."*
    _check_electron_version
    sed -i -e "
        s/\/opt\/${_pkgname}\/${pkgname%-gui-bin}/${pkgname%-bin}/g
        s/Icon=${pkgname%-gui-bin}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${pkgname%-gui-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
	cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    ln -sf "/usr/bin/ffmpeg" "${pkgdir}/usr/lib/${pkgname%-bin}/app/ffmpeg/bin/ffmpeg"
    ln -sf "/usr/bin/ffprobe" "${pkgdir}/usr/lib/${pkgname%-bin}/app/ffmpeg/bin/ffprobe"
    _install_icons
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-gui-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
