# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=apifox-bin
_pkgname=Apifox
# 从以下网址确定版本 https://docs.apifox.com/changelog
pkgver=2.8.55
_electronversion=37
pkgrel=1
pkgdesc="Apifox=Postman+Swagger+Mock+JMeter.API 文档、API 调试、API Mock、API 自动化测试"
arch=(
    'aarch64'
    'x86_64'
)
url="https://apifox.com/"
_ghurl="https://github.com/apifox/apifox"
license=('LicenseRef-custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'java-runtime'
    'nodejs'
    'dbus-glib'
)
options=(
    '!strip'
)
source=("LICENSE.html")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::https://file-assets.apifox.com/download/${_pkgname}-linux-arm64-latest.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::https://file-assets.apifox.com/download/${_pkgname}-linux-latest.zip")
sha256sums=('3884df6451dd5aaadc867c2b6882a7feabccb10c7e1df98e48e9fe2414c9fe19')
sha256sums_aarch64=('SKIP')
sha256sums_x86_64=('SKIP')
pkgver() {
	cat "${srcdir}/.pkgver" 2>/dev/null || echo "${pkgver}"
}
pkgver() {
    cd "${srcdir}/squashfs-root"
    grep "X-AppImage-Version" "${pkgname%-bin}.desktop" | sed "s/X-AppImage-Version=//g"
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
prepare() {
    chmod +x "${srcdir}/${_pkgname}"*.AppImage
    rm -rf "${srcdir}/squashfs-root"
    "${srcdir}/${_pkgname}"*.AppImage --appimage-extract > /dev/null
    grep "X-AppImage-Version" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" | sed "s/X-AppImage-Version=//g" > "${srcdir}/.pkgver"
    _check_electron_version
    sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    local _archrem=$([[ "${CARCH}" == "aarch64" ]] && echo x64 || echo arm)
	find "$(_get_app_dir)" -type d \
		\( -name '*darwin*' -o -name '*android*' -o -name 'win32*' -o -name "*ia32*" -o -name "*${_archrem}*" \) \
		-prune -exec rm -rf {} +
    find "${srcdir}/squashfs-root" -type d -perm 700 -exec chmod 755 {} +
    _file_list=(chrome_100_percent.pak chrome_200_percent.pak chrome-sandbox icudtl.dat libEGL.so libffmpeg.so \
        libGLESv2.so libvk_swiftshader.so libvulkan.so.1 resources.pak vk_swiftshader_icd.json)
    for _files in "${_file_list[@]}";do
        ln -sf "/usr/lib/electron${_electronversion}/${_files}" "${srcdir}/squashfs-root/${_files}"
    done
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname%-bin}"}
    cp -a "${srcdir}/squashfs-root/." "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    _install_icons
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
