# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=typora
pkgname="${_appname}-free-with-plugin"
_pkgname=Typora
pkgver=1.18.7
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
)
source_aarch64=("${pkgname}-${_typoraver}-aarch64.deb::${_dlurl}/releases/download/v${_typoraver}/${_appname}_${_typoraver}_arm64.deb")
source_x86_64=("${pkgname}-${_typoraver}-x86_64.deb::${_dlurl}/releases/download/v${_typoraver}/${_appname}_${_typoraver}_amd64.deb")
sha256sums=('052a739fa32feccedb0bbd14c255d8af9daf75ea660b142483f1ee86c2cc7026')
sha256sums_aarch64=('12ad46732c4da7d9414701c584fee942baf83b89165563f18ba03d859eb59ad8')
sha256sums_x86_64=('a202935a754c4b7344cc947db143e12885e4a716ca5f70f607f0318c346bb6c6')
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
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/usr/share/doc/${_appname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    chmod 777 "${pkgdir}/usr/lib/${pkgname}/resources/plugin"
    chmod 0777 "${pkgdir}/usr/lib/${pkgname}/resources/plugin/global/settings/"{settings.user.toml,custom_plugin.user.toml}
}
