# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: qaz <fkxxyz@163.com>
pkgname=tenvideo
_pkgname=Tenvideo
_appname=TencentVideo
_zhsname='腾讯视频'
pkgver=11.164.9775.0
_electronversion=41
pkgrel=1
pkgdesc="China's leading online video media platform.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://v.qq.com"
_dlurl="https://github.com/kota-rina3/hokeshi"
license=('LicenseRef-custom')
conflicts=("${pkgname}")
provides=("${pkgname}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'libappindicator'
    'libayatana-appindicator'
    'xdg-utils'
)
source=(
    "LICENSE.htm::https://www.qq.com/contract20180827.htm"
    "${pkgname}.sh"
)
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::${_dlurl}/releases/download/${pkgname}-v11/${pkgname}-universal_${pkgver}_arm64.deb")
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::${_dlurl}/releases/download/${pkgname}-v11/${pkgname}-universal_${pkgver}_amd64.deb")
sha256sums=('7827da1d244c3f678ea95bf0f315311ebd3f0509c4efe306b2a3c523ab47a175'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
sha256sums_aarch64=('da18b9f439a2e6b8b323d6bcaba979f807b1d502fa8e7c6c625a207b12245325')
sha256sums_x86_64=('5238faba9e2387f9827f9f466900fb764088e5ef85ba8ce85f4c876320885a14')
_get_app_dir() {
    find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1
}
_check_electron_version() {
    echo "Verifying Electron version..."
    local _main_exe=$(find "$(_get_app_dir)" -maxdepth 1 -type f -executable -printf '%s %p\n' | sort -nr | head -1 | cut -d' ' -f2-)
    [[ -z "${_main_exe}" ]] && echo -e "\033[1;33mNote: Could not find Electron binary.\033[0m" && return
    local _elec_ver=$(strings "${_main_exe}" | grep -oP 'Electron/\K[0-9]+' | head -1)
    [[ -z "${_elec_ver}" ]] && echo -e "\033[1;33mNote: Could not determine Electron version.\033[0m" && return
    [[ "${_elec_ver}" != "${_electronversion}" ]] &&
        echo -e "\033[1;31mWarning: Electron version mismatch! Detected: ${_elec_ver}, Expected: ${_electronversion}\033[0m" ||
        echo -e "Electron version verified: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app/g
        s/@cfgdirname@/${pkgname}_universal/g
    " "${srcdir}/${pkgname}.sh"
    bsdtar -xf "${srcdir}/data."*
    _check_electron_version
    sed -i -e "
        s/Categories=Video;/Categories=AudioVideo;/g
        s/Exec=\/opt\/apps\/${pkgname}-universal\/files\/${pkgname}/Exec=${pkgname}/g
        s/Icon=\/opt\/apps\/${pkgname}-universal\/files\/resources\/app\/${pkgname}.png/Icon=${pkgname}/g
        s/StartupWMClass=${pkgname}-universal/StartupWMClass=${pkgname}/g
    " "${srcdir}/opt/apps/${pkgname}-universal/entries/applications/${pkgname}-universal.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/"* "${pkgdir}/usr/lib/${pkgname%-bin}/"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*icons/hicolor/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/opt/apps/${pkgname}-universal/entries/applications/${pkgname}-universal.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/LICENSE.htm" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
