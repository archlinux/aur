# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=echo-music-bin
_pkgname=EchoMusic
pkgver=2.2.8
_electronversion=43
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
    'nodejs'
    'libcdio'
    'libcaca'
    'libxss'
    'libcdio-paranoia'
    'ffmpeg4.4'
    'zimg'
    'libvdpau'
    'libass'
    'pipewire-jack'
    'python'
    'libdvdnav'
    'libarchive'
    'uchardet'
    'vulkan-icd-loader'
    'libsixel'
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
sha256sums_aarch64=('347ca8b405adc18536a6db1d7a368f19f6f242c25552f3a87afd1a4637b8122c')
sha256sums_x86_64=('d4b51d52d6ffa19e3d89358e8c9d2636f56f95159c064cfa5398eea070e93e1c')
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
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _check_electron_version
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    local _app_dir=$(_get_app_dir)
    asar e "${_app_dir}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked/dist-electron" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    rm -rf "${_app_dir}/resources/app.asar"
    asar p "${srcdir}/app.asar.unpacked" "${_app_dir}/resources/app.asar"
    find "${_app_dir}/resources/app.asar.unpacked" -type d \( -name "*darwin*" -o -name "*win32*" \) -exec rm -rf {} +
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/"* "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
