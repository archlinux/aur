# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=blanc-bin
_pkgname=Blanc
pkgver=1.51.0
_electronversion=45
pkgrel=1
pkgdesc="Open-source desktop browser with a minimal Island interface, built-in ad and tracker blocking, private tabs."
arch=('x86_64')
url="https://blanc.day"
_ghurl="https://github.com/bnfy/blanc"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
	"electron${_electronversion}"
)
source=(
	"${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
	"LICENSE-${pkgver}::https://raw.githubusercontent.com/bnfy/blanc/v${pkgver}/LICENSE"
	"${pkgname%-bin}.js"
	"${pkgname%-bin}.sh"
)
sha256sums=('d3f3816365d7cc53d11e6d84300d4b89d377e37e63f6582483081e784f442892'
            '2ed3f1dce1cdce4260ece8e13f7bb6e367be1b9766b479624c0f4c4cf6701369'
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
	chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
	rm -rf "${srcdir}/squashfs-root"
	"${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
	_check_electron_version
	sed -i "s/AppRun/${pkgname%-bin}/g" "$(_get_app_dir)/${pkgname%-bin}.desktop"
	find "$(_get_app_dir)/resources" -type d -exec chmod 755 {} +
	_delete_other_arch_files
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 "${srcdir}/${pkgname%-bin}.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
	cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
	_install_icons
	install -Dm644 "$(_get_app_dir)/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
