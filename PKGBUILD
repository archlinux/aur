# Contributor: taotieren <admin@taotieren.com>

pkgname=jlc-assistant-bin
_pkgname=${pkgname%-bin}
pkgver=5.0.69
pkgrel=27
pkgdesc="嘉立创下单助手:该应用为您下单提供便利，快速获取优惠及下单信息，无需在网站等待审核审单！在下单助手下单立享打折优惠！ "
arch=('x86_64')
url="https://www.jlc.com/portal/appDownloadsWithConfig.html"
license=('LicenseRef-custom')
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
replaces=(${pkgname%-bin})
_electronversion=19
_electronpkg=electron${_electronversion}
depends=(
    ${_electronpkg}
    nodejs
)
makedepends=(
    'asar'
    'npm'
)
backup=()
options=('!emptydirs')
install=
source=(
    "${pkgname%-bin}-${pkgver}.zip::https://download.jlc.com/pcAssit/${pkgver}/JLCPcAssit-linux-x64-${pkgver}.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('d943ebf9ee328a657cd608bdf301f637ea48988b57adeae1ae770fae944caacd'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
noextract=()

_get_app_dir() {
    find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1
}
_check_electron_version() {
    echo "Verifying Electron version..."
    local _main_exe=$(find "$(_get_app_dir)" -maxdepth 1 -type f -printf '%s %p\n' | sort -nr | head -1 | cut -d' ' -f2-)
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

    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi

    _check_electron_version
    local _app_dir=$(_get_app_dir)
    sed -i -e "s|^Exec=.*|Exec=${_pkgname} %f|" \
           -e "s|^Icon=.*|Icon=${_pkgname}|" \
        "${_app_dir}/${_pkgname}.dkt"
    asar e "${_app_dir}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    rm -rf "${_app_dir}/resources/app.asar"
    cd "${srcdir}/app.asar.unpacked"
    sed -i '/"packageManager"/d' package.json
    npm config set allow-remote all
    npm install aria2-lib @motrix/nat-api --save
    cd - > /dev/null
    asar p "${srcdir}/app.asar.unpacked" "${_app_dir}/resources/app.asar"
    find "${_app_dir}/resources" -type d -perm 700 -exec chmod 755 {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/"* "${pkgdir}/usr/lib/${pkgname%-bin}/"
    for _i in "${_app_dir}"/icon/png/*.png; do
        [[ -f "${_i}" ]] || continue
        _size="${_i##*/}"
        _size="${_size%.png}"
        install -Dm644 "${_i}" \
            "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${_app_dir}/${pkgname%-bin}.dkt" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
