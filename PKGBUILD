# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=echo-music-bin
_pkgname=EchoMusic
pkgver=2.2.3
_electronversion=42
pkgrel=1
pkgdesc="A minimalist third-party Kugou concept music player. (Prebuilt version. Use system-wide electron)🎉 一个简约的第三方酷狗概念版音乐播放器"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/hoowhoami/EchoMusic"
license=('MIT')
conflicts=(
    "${pkgname%-bin}"
    'echomusic'
    'echomusic-appimage'
)
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
)
options=(
    '!emptydirs'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/hoowhoami/EchoMusic/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
source_aarch64=( "${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-aarch64.rpm")
source_x86_64=( "${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x86_64.rpm")
sha256sums=('8b9f721a54a564c55de17c8082a2a6466568309b5a026a989f12a711bb78edbf'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
sha256sums_aarch64=('537693e69f2cc1ddc749b5a83f550dc5725baa4b94e3edbd6418a488affa2277')
sha256sums_x86_64=('caa0396ef4531d3a0635fa5eda6b5c54a864c021e75a746b7da707139f2fc2fd')
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
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _check_electron_version
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked/dist-electron" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/opt/${_pkgname}/resources/app.asar"
    find "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" -type d \( -name "*darwin*" -o -name "*win32*" \) -exec rm -rf {} +
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1)
	cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
