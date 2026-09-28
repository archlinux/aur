# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lexicanter-bin
_pkgname=Lexicanter
pkgver=2.3.2
_electronversion=44
pkgrel=1
pkgdesc="A lexicon management tool for constructed languages.It was developed and will occasionally be updated by Ethan Ray (known online as Cthethan or Saturnine)."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/Saturnine-Softworks/Lexicanter"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'python'
    'nodejs'
)
makedepends=(
    'asar'
)
options=(
    '!emptydirs'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-arm64.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.AppImage")
sha256sums=('bd5358d8f323d3c2c2f0733364ee4ea55f551dd86ba0be2a76846210b60897fc')
sha256sums_aarch64=('908b5b8032405d64e1662e5e2bff03c2989b3177e0360f3e2cd833cecb9b0201')
sha256sums_x86_64=('09b8cb72bcef9cd8a92fc63223e9ff4f24e30b7d4275040eb87a170fbf001a27')
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
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    _check_electron_version
    local _app_dir=$(_get_app_dir)
    sed -i -e "
        s/AppRun --no-sandbox/${pkgname%-bin}/g
        s/Video;/Video;AudioVideo;/g
    " "${_app_dir}/${pkgname%-bin}.desktop"
    case "${CARCH}" in
        aarch64)
            _arch_rem=x64
        ;;
        x86_64)
            _arch_rem=arm
            find "${_app_dir}/resources" -name "*aarch64*" -exec rm -rf {} +
        ;;
    esac
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked/src" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    find "${srcdir}" \
        \( -name "*darwin*" -o -name "*win32*" -o -name "*ia32*" -o -name "*freebsd*" -o -name "*apple*" \
            -o -name "*${_arch_rem}*" -o -name "*loong64*" -o -name "*risc*" -o -name "*windows*" \) \
        -exec rm -rf {} +
    asar p "${srcdir}/app.asar.unpacked" "${_app_dir}/resources/app.asar"
    find "${_app_dir}/resources" -type d -exec chmod 755 {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${_app_dir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${_app_dir}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}