# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=tabby
pkgname="${_appname}-electron-bin"
_pkgname=Tabby
pkgver=1.0.235
_electronversion=38
pkgrel=1
pkgdesc="A terminal for a more modern age.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://tabby.sh/"
_ghurl="https://github.com/Eugeny/tabby"
license=('MIT')
conflicts=("${_appname}")
provides=("${_appname}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'python'
    'libsecret'
    'nodejs'
)
makedepends=(
    'asar'
)
options=(
    '!emptydirs'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Eugeny/tabby/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux-arm64.rpm")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.rpm::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux-armv7l.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux-x64.rpm")
sha256sums=('ac295694b9f56e90dce3cf58313ed891d0bd9178adec02d8503a0c07d9d34c68'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
sha256sums_aarch64=('9445c09100205e1207918cbf5ca108b05e931dd21deaba87bdeca99d453fbbd7')
sha256sums_armv7h=('5786102109d3fd5e33ba623cbe0a1d6cd9db29fc73b07eb10ed2b799f4cdf785')
sha256sums_x86_64=('0dd56a3c2a43547e5ae23cd87a8a205b3b91d3bf6685cd8e380c79cf1154a0c9')
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
        s/@cfgdirname@/${_appname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _check_electron_version
    sed -i -e "
        s/\/opt\/${_pkgname}\/${_appname} --no-sandbox/${pkgname%-bin}/g
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_appname}.desktop"
    local _app_dir=$(_get_app_dir)
    asar e "${_app_dir}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    rm -rf "${_app_dir}/resources/app.asar"
    find "${srcdir}/app.asar.unpacked/dist" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${_app_dir}/resources/app.asar"
    find "${_app_dir}/resources/app.asar.unpacked/node_modules" \
    \( -type d -a \( -name "android-*" -o -name "darwin-*" -o -name "win32-*" \) -o \
        -type f -a \( -name "*darwin*" -o -name "*win32*" \) \) -exec rm -rf {} +
    case "${CARCH}" in
        aarch64)
            find "${_app_dir}/resources/app.asar.unpacked/node_modules" \
                \( -type d -a \( -name "linux-arm" -o -name "linux-x64" \) -o \
                -type f -a \( -name "*linux-arm-*" -o -name "*linux-x64*" \) \) -exec rm -rf {} +
            ;;
        armv7h)
            find "${_app_dir}/resources/app.asar.unpacked/node_modules" \
                \( -type d -a \( -name "linux-arm64" -o -name "linux-x64" \) -o \
                -type f -a \( -name "*linux-arm64-*" -o -name "*linux-x64*" \) \) -exec rm -rf {} +
            ;;
        x86_64)
            find "${_app_dir}/resources/app.asar.unpacked/node_modules" \
                \( -type d -a -name "linux-arm*" -o \
                -type f -a -name "*linux-arm*" \) -exec rm -rf {} +
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/"* "${pkgdir}/usr/lib/${pkgname%-bin}/"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
