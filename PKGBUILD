# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=typora
pkgname="${_appname}-free-with-plugin"
_pkgname=Typora
pkgver=1.19.14
_typoraver=0.11.18
_electronversion=13
pkgrel=1
pkgdesc="A minimal markdown editor and reader(free version).With obgnail/typora_plugin plugins."
arch=(
    'aarch64'
    'x86_64'
)
url="https://typora.io/"
_dlurl="https://github.com/wyf9661/typora-free"
_pluginurl="https://github.com/obgnail/typora_plugin"
license=('LicenseRef-custom')
provides=("${_appname}=${pkgver}")
conflicts=(
    "${_appname}"
    "${_appname}-free"
    "${_appname}-cn"
    "${_appname}-free-cn"
    "${_appname}-electron"
)
depends=(
    "electron${_electronversion}"
    'alsa-lib'
)
source=(
    "${_appname}-plugin-${pkgver}.zip::${_pluginurl}/releases/download/${pkgver}/${_appname}-plugin@v${pkgver}.zip"
    "${pkgname}.install"
)
install="${pkgname}.install"
source_aarch64=("${pkgname}-${_typoraver}-aarch64.deb::${_dlurl}/releases/download/v${_typoraver}/${_appname}_${_typoraver}_arm64.deb")
source_x86_64=("${pkgname}-${_typoraver}-x86_64.deb::${_dlurl}/releases/download/v${_typoraver}/${_appname}_${_typoraver}_amd64.deb")
sha256sums=('63054889f4880d041c82e6535a4f7a8fe160134f2aa3c9c043a050376344032a'
            '9915d11804104e76bc74d76b2aaf3a24e41737527acaee7c7f7df03580439d9d')
sha256sums_aarch64=('12ad46732c4da7d9414701c584fee942baf83b89165563f18ba03d859eb59ad8')
sha256sums_x86_64=('a202935a754c4b7344cc947db143e12885e4a716ca5f70f607f0318c346bb6c6')
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
    bsdtar -xf "${srcdir}/data."*
    _check_electron_version
    sed -i -e "
        s/${_appname} %U/${pkgname} --no-sandbox %U/g
        s/Icon=${_appname}/Icon=${pkgname}/g
    " "${srcdir}/usr/share/applications/${_appname}.desktop"
    local _app_dir=$(_get_app_dir)
    sed -i "s/<script src=\".\/appsrc\/window\/frame.js\" defer=\"defer\"><\/script>/<script src=\".\/appsrc\/window\/frame.js\" defer=\"defer\"><\/script><script src=\".\/plugin\/index.js\" defer=\"defer\"><\/script>/g" \
        "${_app_dir}/resources/window.html"
    cp -a "${srcdir}/plugin" "${_app_dir}/resources"
    _file_list=(chrome_100_percent.pak chrome_200_percent.pak chrome-sandbox icudtl.dat libEGL.so libffmpeg.so \
        libGLESv2.so libvk_swiftshader.so libvulkan.so.1 resources.pak vk_swiftshader_icd.json)
    for _files in "${_file_list[@]}";do
        ln -sf "/usr/lib/electron${_electronversion}/${_files}" "${_app_dir}/${_files}"
    done
}
package() {
    install -Dm755 -d "${pkgdir}/"{/usr/lib/"${pkgname}",usr/bin}
	cp -a "${srcdir}/usr/share/${_appname}/"* "${pkgdir}/usr/lib/${pkgname}"
    ln -sf "/usr/lib/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    _install_icons
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/usr/share/doc/${_appname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
