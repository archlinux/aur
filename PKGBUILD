# Maintainer: VBen <devel@velmeden.info>
pkgname=loxone-config-bin
pkgver=17.1.6.30
pkgrel=1
pkgdesc="Loxone Config - home automation configuration software (Wine)"
arch=('x86_64')
url="https://www.loxone.com"
license=('LicenseRef-Loxone-Proprietary')
depends=('wine' 'wine-mono')
makedepends=('xorg-server-xvfb' 'icoutils')
options=('!strip' 'emptydirs')

# Version format in download URL: 17.1.6.30 -> 17000331 (each part zero-padded to 2 digits)
_urlver=17010630

source=(
    "LoxoneConfigSetup_${_urlver}.zip::https://updatefiles.loxone.com/LoxConfig/LoxoneConfigSetup_${_urlver}.zip"
    "loxone-config.sh"
    "loxone-config.desktop"
    "loxone-monitor.sh"
    "loxone-monitor.desktop"
)
sha256sums=('a8d8a32ddc11ccae2988a62333beaf5997d9ba518967a69a2d659cc7f02f3498'
            '9005ac2866496b9d1dbc85887e81e59a14e4b4a9a3e0530ab2049eedb492f1c4'
            '3ff9c4f99a924d74e3240dba49fbdce737113e1072f9f7aadf6d9fe6c76260b1'
            '0deb0cee30573b7f4492329946eeb0159c9c48a5808546789af4b8123986ac63'
            'f9524c4977cbb05e3144c7c4c5d8f4914778a6998bdde5f243ddbe298980786c')

build() {
    export WINEPREFIX="${srcdir}/wine-prefix"
    export WINEDEBUG=-all

    Xvfb :99 -screen 0 1024x768x24 &>/dev/null &
    local _xvfb_pid=$!
    export DISPLAY=:99

    wineboot --init 2>/dev/null
    wine "${srcdir}/LoxoneConfigSetup.exe" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-
    wineserver -w

    kill "${_xvfb_pid}" 2>/dev/null || true
    wait "${_xvfb_pid}" 2>/dev/null || true
}

package() {
    local _prefix="${srcdir}/wine-prefix/drive_c"

    # Installer uses "Program Files" on win32 prefix
    local _appdir
    _appdir=$(find "${_prefix}" -maxdepth 4 -name "LoxoneConfig.exe" -printf '%h\n' | head -1)
    if [[ -z "${_appdir}" ]]; then
        error "LoxoneConfig.exe not found after installation. Installation may have failed."
        return 1
    fi

    # Install application files
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -r "${_appdir}/." "${pkgdir}/opt/${pkgname}/"

    # Copy Visual C++ runtime DLLs installed by the installer into the app directory
    # so they are available at runtime without winetricks
    local _sys32="${srcdir}/wine-prefix/drive_c/windows/system32"
    while IFS= read -r -d '' _dll; do
        install -Dm644 "${_dll}" "${pkgdir}/opt/${pkgname}/$(basename "${_dll}")"
    done < <(find "${_sys32}" \( \
        -name "mfc140*.dll" \
        -o -name "mfcm140*.dll" \
        -o -name "vcruntime140*.dll" \
        -o -name "concrt140.dll" \
        -o -name "vcomp140.dll" \
    \) -print0)

    # Install ProgramData files (read-only app data installed by the installer)
    local _progdata="${_prefix}/ProgramData/Loxone/Loxone Config ${pkgver}"
    if [[ -d "${_progdata}" ]]; then
        install -dm755 "${pkgdir}/opt/${pkgname}/programdata"
        cp -r "${_progdata}/." "${pkgdir}/opt/${pkgname}/programdata/"
    fi

    # Extract and install icon
    wrestool -x --type=14 -o "${srcdir}/icon.ico" "${_appdir}/LoxoneConfig.exe" 2>/dev/null || true
    if [[ -f "${srcdir}/icon.ico" ]]; then
        icotool -x -o "${srcdir}" "${srcdir}/icon.ico" 2>/dev/null || true
        local _png
        _png=$(find "${srcdir}" -name "*.png" | sort -t_ -k3 -rn | head -1)
        if [[ -n "${_png}" ]]; then
            install -Dm644 "${_png}" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
        fi
    fi

    # Wrapper scripts
    install -Dm755 "${srcdir}/loxone-config.sh" "${pkgdir}/usr/bin/loxone-config"
    install -Dm755 "${srcdir}/loxone-monitor.sh" "${pkgdir}/usr/bin/loxone-monitor"

    # Desktop entries
    install -Dm644 "${srcdir}/loxone-config.desktop" "${pkgdir}/usr/share/applications/loxone-config.desktop"
    install -Dm644 "${srcdir}/loxone-monitor.desktop" "${pkgdir}/usr/share/applications/loxone-monitor.desktop"
}
