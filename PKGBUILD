# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=zyfun-bin
pkgver=3.4.7
_electronversion=41
pkgrel=1
pkgdesc="Cross-platform desktop video resource player, free high value.(Prebuilt version.Use system-wide electron)跨平台桌面端视频资源播放器,免费高颜值"
arch=(
    'aarch'
    'x86_64'
)
url="https://github.com/Hiram-Wong/zyfun"
license=("AGPL-3.0-only")
provides=("${pkgname%-bin}-${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "zy-player"
    "zyplayer"
)
depends=(
    "electron${_electronversion}"
    'python'
    'python-requests'
    'python-lxml'
    'python-pycryptodome'
)
source_aarch=("${pkgname%-bin}-${pkgver}-aarch.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-x86_64.rpm")
source=("${pkgname%-bin}.sh")
sha256sums=('a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
sha256sums_aarch=('d287503ca5edfffac7b6206c3cf1ce75c1ffedbcdc8e232a032204b2c99711de')
sha256sums_x86_64=('9d171a0f7b65c2006c1a536b2fe2ef441c19284287cb0934ed2ce19c7f98065c')
_get_app_dir() {
    find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1
}
_check_electron_version() {
    echo "Verifying Electron version..."
    local _app_dir=$(_get_app_dir)
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
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _check_electron_version
    sed -i -e "
        s/\/opt\/${pkgname%-bin}\///g
        s/Audio;Video/AudioVideo/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    local _app_dir=$(_get_app_dir)
    rm -rf \
        "${_app_dir}/resources/app.asar.unpacked/node_modules/7zip-bin-full/"{mac,win,linux/{arm,ia32}} \
        "${_app_dir}/resources/app.asar.unpacked/node_modules/zeromq/build/"{darwin,win32}
    case "${CARCH}" in
        aarch64)
            rm -rf \
                "${_app_dir}/resources/app.asar.unpacked/node_modules/7zip-bin-full/linux/x64" \
                "${_app_dir}/resources/app.asar.unpacked/node_modules/zeromq/build/linux/x64"
                ;;
        x86_64)
            rm -rf \
                "${_app_dir}/resources/app.asar.unpacked/node_modules/7zip-bin-full/linux/arm64" \
                "${_app_dir}/resources/app.asar.unpacked/node_modules/zeromq/build/linux/arm64"
                ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
}
