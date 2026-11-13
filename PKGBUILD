# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=atrust-bin
_pkgname=aTrust
_vendor=sangfor
_debname="cn.com.${_vendor}.${pkgname%-bin}"
pkgver=2.5.16.41
_electronversion=9
pkgrel=1
pkgdesc="Sangfor ssl sdp client."
arch=('x86_64')
url="https://www.sangfor.com/"
license=('LicenseRef-unknown')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
	'libxss'
	'qt5-base'
	'java-runtime'
	'gtk3'
	'libxrandr'
	'cairo'
	'libxcomposite'
	'at-spi2-core'
	'alsa-lib'
	'libxtst'
	'nodejs'
)
options=(
	'!strip'
	'!emptydirs'
)
source=(
	"${pkgname%-bin}-${pkgver}.deb::https://atrustcdn.sangfor.com/standard/linux/${pkgver}/uos/amd64/${_pkgname}Installer_amd64.deb"
	"bsod_checker.js"
	"${pkgname%-bin}.sh"
)
sha256sums=('360c78dd8be33fc9030a039ad3bf735d0812132071c05b280115642d4be146f5'
            'ac3ce1d29ee40bec9b5c1814a1972cd81373b1c2cce4cf3d3c66a0544186bd5d'
            '973355123ef18bd13920f67914737ec99890869a9d49862041e514908f03ae02')
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
	sed -i \
		-e "s/@appname@/${_vendor}/g" \
		-e "s/@runpath@/${_pkgname}/g" \
		-e "s/@runname@/${_pkgname}Tray/g" \
		"${srcdir}/${pkgname%-bin}.sh"
	bsdtar -xf "${srcdir}/data."*
	_check_electron_version
	sed -i \
		-e "s|/usr/share/${_vendor}/${_pkgname}/${_pkgname}Tray|${pkgname%-bin}|g" \
		-e 's/ --no-sandbox --disable-gpu//g' \
		-e "s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g" \
		-e "s/GenericName=sdp client/GenericName=${_pkgname}/g" \
		-e '/packagename/d' \
		"${srcdir}/usr/share/applications/${_debname}.desktop"
	rm -rf \
		"$(_get_app_dir)/resources/lib/"{libstdc++.so.6,libqxcb.so,libxcb.so.1,libxcb-xinerama.so.0} \
		"$(_get_app_dir)/uem/lib/libstdc++.so.6"
	install -Dm644 "${srcdir}/bsod_checker.js" -t "$(_get_app_dir)/resources/app/src/service"
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm755 -d "${pkgdir}/usr/share"
	cp -a "${srcdir}/usr/share/${_vendor}" "${pkgdir}/usr/share"
	install -Dm644 "${srcdir}/usr/lib/systemd/system/"* -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm644 "${srcdir}/usr/lib/systemd/user/"* -t "${pkgdir}/usr/lib/systemd/user"
	_install_icons
	install -Dm644 "${srcdir}/usr/share/applications/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
	install -Dm644 "$(_get_app_dir)/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf" <<-EOF
		d /usr/share/${_vendor}/.${_pkgname} 0777 root root -
		d /usr/share/${_vendor}/.${_pkgname}/bin 0777 root root -
		d /usr/share/${_vendor}/.${_pkgname}/tmp 0777 root root -
		d /usr/share/${_vendor}/.${_pkgname}/Crash 0777 root root -
		d /usr/share/${_vendor}/.${_pkgname}/database 0777 root root -
		d /usr/share/${_vendor}/.${_pkgname}/iddbase 0777 root root -
		d /usr/share/${_vendor}/.${_pkgname}/var 0777 root root -
		d /usr/share/${_vendor}/.${_pkgname}/var/run 0777 root root -
		d /usr/share/${_vendor}/.${_pkgname}/var/conf 0777 root root -
		d /usr/share/${_vendor}/.${_pkgname}/var/database 0777 root root -
		d /usr/share/${_vendor}/.${_pkgname}/var/run/plugin-daemon 0777 root root -
		d /usr/share/${_vendor}/.${_pkgname}/var/run/plugins/${_pkgname}Core 0777 root root -
		d /usr/share/${_vendor}/.${_pkgname}/var/run/plugins/${_pkgname}Tunnel 0777 root root -
	EOF
	install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/system/${_pkgname}Daemon.service.d/10-arch.conf" <<-'EOF'
		[Service]
		KillMode=control-group
		TimeoutStopSec=30s
	EOF
}