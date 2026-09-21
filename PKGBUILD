# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=ting_en
pkgname="eusoft-${_appname//_/-}-bin"
_zhname='每日英语听力'
pkgver=26.9.1
_electronversion=22
pkgrel=1
pkgdesc="Listening statistics, note synchronization, and voice highlighting follow-up make learning English easy and enjoyable for you.听力统计、笔记同步、语音高亮跟随，让您轻松愉快学英语"
arch=('x86_64')
url="http://dict.eudic.net/ting"
license=('LicenseRef-custom')
conflicts=(
    "${pkgname%-bin}"
    "eudic-${_appname}"
)
depends=(
    "electron${_electronversion}"
    'ffmpeg'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://static.frdic.com/pkg/${_appname}/${_appname}.deb?v=${pkgver}"
    "LICENSE.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('bf24f5f66d2976a720b4db7a5471a3c330449f694ab1f8e6eb3060da9edac76c'
            '17651cf7ae49b0372b6b6812d8b3b066203892c9fbe0b04b25efec0ab038c12b'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
_get_app_dir() {
	find "${srcdir}" -type d -name "node_modules" -prune -o -type f -name "resources.pak" -print0 | xargs -0 dirname | head -n 1
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
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_appname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _check_electron_version
    sed -i -e"
        s/\"\/opt\/${_zhname}\/${_appname}\"/${pkgname%-bin}/g
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
    " -i "${srcdir}/usr/share/applications/${_appname}.desktop"
    ln -sf "/usr/bin/ffmpeg" "${srcdir}/opt/${_zhname}/resources/app.asar.unpacked/ffmpeg-linux-x64"
    ln -sf "/usr/bin/ffmpeg" "${srcdir}/opt/${_zhname}/resources/ffmpeg-linux-x64"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
