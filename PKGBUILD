# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Bruce Zhang
pkgname=sqlark-bin
_pkgname=SQLark
pkgver=3.10
_electronversion=32
pkgrel=1
pkgdesc="SQLark is a powerful SQL query tool that provides a user-friendly interface for database management and analysis."
arch=(
	'aarch64'
	'x86_64'
)
url="https://www.sqlark.com/"
license=('LicenseRef-scancode-commercial-license')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
	'python'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::https://download.sqlark.com/fullPackage/Linux/408830/${_pkgname}_V${pkgver}_linux_arm64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::https://download.sqlark.com/fullPackage/Linux/408830/${_pkgname}_V${pkgver}_linux_x86_64.rpm")
sha256sums_aarch64=('380c94126d46d35e2f3b520937a1400bfad83ba9b04df2dc3d2687977ba9ad72')
sha256sums_x86_64=('c16a28044fd56e2d0576ae31a37e16499c93217d5f15969de59961891ba45b84')
_check_electron_version() {
    echo "Verifying Electron version..."
    local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1)
    local _main_exe=""
    if [[ -n "${_app_dir}" ]]; then
        _main_exe=$(find "${_app_dir}" -maxdepth 1 -type f -executable -printf '%s %p\n' | sort -nr | head -n 1 | cut -d' ' -f2-)
    fi
    if [[ -n "${_main_exe}" ]]; then
        local _elec_ver=$(strings "${_main_exe}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1 | head -n 1)
        if [[ -n "${_elec_ver}" ]]; then
            if [[ "${_elec_ver}" != "${_electronversion}" ]]; then
                echo -e "\033[1;31mWarning: Electron version mismatch! Detected: ${_elec_ver}, Expected: ${_electronversion}\033[0m"
            else
                echo -e "Electron version verified: \033[1;31m${_elec_ver}\033[0m"
            fi
        fi
    else
        echo -e "\033[1;33mNote: Could not find Electron binary for version verification.\033[0m"
    fi
}
prepare() {
	_check_electron_version
	sed -i "s/Exec=\/opt\/${pkgname%-bin}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
	_file_list=(chrome_100_percent.pak chrome_200_percent.pak chrome-sandbox icudtl.dat libEGL.so libffmpeg.so \
		libGLESv2.so libvk_swiftshader.so libvulkan.so.1 resources.pak vk_swiftshader_icd.json)
	for _files in "${_file_list[@]}";do
		ln -sf "/usr/lib/electron${_electronversion}/${_files}" "${srcdir}/opt/${pkgname%-bin}/${_files}"
	done
}
package() {
	install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname%-bin}"}
	cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}"/* "${pkgdir}/usr/lib/${pkgname%-bin}"
	ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
	find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
}
