# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bar-lobby-bin
_pkgname=BeyondAllReason
pkgver=0.16.0
_electronversion=37
pkgrel=1
pkgdesc="a new WIP lobby for the RTS game Beyond All Reason.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://beyond-all-reason.github.io/bar-lobby/"
_ghurl="https://github.com/beyond-all-reason/bar-lobby"
license=(
    'MIT'
    'CC-BY-NC-ND-4.0'
    'CC-BY-3.0'
    'CC-BY-SA-3.0'
    'CC0-1.0'
    'ISC'
    'OFL-1.0'
    'Unlicense'
    'LicenseRef-custom'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    '7zip'
)
source=(
    "${pkgname%-bin}-${pkgver}-${CARCH}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "LICENSE-CC-BY-3.0-${pkgver}.txt::https://raw.githubusercontent.com/beyond-all-reason/bar-lobby/v${pkgver}/LICENSES/CC-BY-3.0.txt"
    "LICENSE-CC-BY-NC-ND-4.0-${pkgver}.txt::https://raw.githubusercontent.com/beyond-all-reason/bar-lobby/v${pkgver}/LICENSES/CC-BY-NC-ND-4.0.txt"
    "LICENSE-CC-BY-SA-3.0-${pkgver}.txt::https://raw.githubusercontent.com/beyond-all-reason/bar-lobby/v${pkgver}/LICENSES/CC-BY-SA-3.0.txt"
    "LICENSE-CC0-1.0-${pkgver}.txt::https://raw.githubusercontent.com/beyond-all-reason/bar-lobby/v${pkgver}/LICENSES/CC0-1.0.txt"
    "LICENSE-ISC-${pkgver}.txt::https://raw.githubusercontent.com/beyond-all-reason/bar-lobby/v${pkgver}/LICENSES/ISC.txt"
    "LicenseRef-IFOPE-${pkgver}.txt::https://raw.githubusercontent.com/beyond-all-reason/bar-lobby/v${pkgver}/LICENSES/LicenseRef-IFOPE.txt"
    "LicenseRef-UNKNOWN-${pkgver}.txt::https://raw.githubusercontent.com/beyond-all-reason/bar-lobby/v${pkgver}/LICENSES/LicenseRef-UNKNOWN.txt"
    "LICENSE-MIT-${pkgver}.txt::https://raw.githubusercontent.com/beyond-all-reason/bar-lobby/v${pkgver}/LICENSES/MIT.txt"
    "LICENSE-OFL-1.1-${pkgver}.txt::https://raw.githubusercontent.com/beyond-all-reason/bar-lobby/v${pkgver}/LICENSES/OFL-1.1.txt"
    "Unlicense-${pkgver}.txt::https://raw.githubusercontent.com/beyond-all-reason/bar-lobby/v${pkgver}/LICENSES/Unlicense.txt"
    "${pkgname%-bin}.sh"
)
sha256sums=('cfb3e244d06af0d66995e65c848b0816180aa64bf91ca1bf5c60a0fcde27597d'
            'aacbf85b939d752b122a6d2eb50650796b7ccf4d38d72bd9ef8b5c47022cdbe8'
            '4f3c4a321eb0c73182eee7afa3fe0111e24dec193f2d6febcf4207f26af26839'
            'ea55e798a1b601516093201441b474c7499b37db0e8920d7b96a21c2d67465b6'
            'a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499'
            'f2ec607f67bb0dd3053b49835b02110d5cd0f8eb6da3aac4dc0b142a6b299be9'
            '259e4782bab664d1842d36f2bd642748357a53187617664bb01dcda9ee500b91'
            '5c9198cbb9b1a1579acdf3742284e65db9ab5abcff83b802d5da6923d0f4c3d5'
            'b05785f9f18e6716bab63424b11454513b9943a222595b70411009202fc592b5'
            '8eea8287e5876b539670cadb82e99f9a7afddec6f6730811be1daf25d2e9bcfd'
            '0bdebfeda07d45dada625ae1317c6f833186e798b171d0db640bcf32e92a8240'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
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
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    _check_electron_version
    local _app_dir=$(_get_app_dir)
    sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g" "${_app_dir}/${pkgname%-bin}.desktop"
    find "${_app_dir}/resources" -type d -perm 700 -exec chmod 755 {} +
    rm -rf "${_app_dir}/resources/app.asar.unpacked/node_modules/7zip-bin/"{mac,linux/{arm*,ia32}}
    ln -sf "/usr/bin/7za" "${_app_dir}/resources/app.asar.unpacked/node_modules/7zip-bin/linux/x64/7za"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/"* "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/LICENSE-CC-BY-3.0-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-CC-BY-3.0.txt"
    install -Dm644 "${srcdir}/LICENSE-CC-BY-NC-ND-4.0-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-CC-BY-NC-ND-4.0.txt"
    install -Dm644 "${srcdir}/LICENSE-CC-BY-SA-3.0-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-CC-BY-SA-3.0.txt"
    install -Dm644 "${srcdir}/LICENSE-CC0-1.0-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-CC0-1.0.txt"
    install -Dm644 "${srcdir}/LICENSE-ISC-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-ISC.txt"
    install -Dm644 "${srcdir}/LicenseRef-IFOPE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LicenseRef-IFOPE.txt"
    install -Dm644 "${srcdir}/LicenseRef-UNKNOWN-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LicenseRef-UNKNOWN.txt"
    install -Dm644 "${srcdir}/LICENSE-MIT-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT.txt"
    install -Dm644 "${srcdir}/LICENSE-OFL-1.1-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-OFL-1.1.txt"
    install -Dm644 "${srcdir}/Unlicense-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/Unlicense.txt"
}
