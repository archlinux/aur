# Maintainer: VBen <devel@velmeden.info>
pkgname=loxone-config-bin
pkgver=17.1.7.27
pkgrel=2
pkgdesc="Loxone Config - home automation configuration software (Wine)"
arch=('x86_64')
url="https://www.loxone.com"
license=('LicenseRef-Loxone-Proprietary')
depends=('wine' 'wine-mono' 'zenity')
makedepends=('xorg-server-xvfb' 'icoutils')
options=('!strip' 'emptydirs')

# Version format in download URL: 17.1.6.30 -> 17010630 (each part zero-padded to 2 digits)
_urlver=$(awk -F. '{printf "%02d%02d%02d%02d", $1, $2, $3, $4}' <<< "${pkgver}")

source=(
    "LoxoneConfigSetup_${_urlver}.zip::https://updatefiles.loxone.com/LoxConfig/LoxoneConfigSetup_${_urlver}.zip"
    "loxone-config.sh"
    "loxone-config.desktop"
    "loxone-monitor.sh"
    "loxone-monitor.desktop"
    "loxone-config-dpi.sh"
    "loxone-config-dpi.desktop"
)
sha256sums=('478b163c6883514d9faf83e4ce2fc1d4637bd0c5b3b8d05600b4eeade475949a'
            '3def05431934b75dbda853eef3ec62659249c0194f7337751946d08de8d5954b'
            '3ff9c4f99a924d74e3240dba49fbdce737113e1072f9f7aadf6d9fe6c76260b1'
            'bd0052ac963c24524d2ebe4c3e0955713a4b0faa08439f497f2bb536825d8217'
            '243f3787f9f42a5136aacad473f7a805cd7e0a8b96016ba73124748328bd45e8'
            '6102feecaea9ac6bb7a005b3cec6bb5372f2693e84672cf4bb96c67c730198b3'
            '80898cd754644840a821552eef63a6a55f1235c41523b216744c0f4da67a140d')

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

    # Version file read by the wrapper scripts: the pkgver part keeps the
    # ProgramData folder name in sync with pkgver, and the full pkgver-pkgrel
    # string is used to detect packaging updates and force a re-copy of
    # ProgramData even when only pkgrel changes
    echo -n "${pkgver}-${pkgrel}" > "${pkgdir}/opt/${pkgname}/VERSION"

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

    # Extract and install config icon (group_icon 128 is LoxoneConfig's own app icon;
    # 130 is a document/file-type icon, not the app icon)
    wrestool -x --type=14 --name=128 -o "${srcdir}/icon.ico" "${_appdir}/LoxoneConfig.exe" 2>/dev/null || true
    if [[ -f "${srcdir}/icon.ico" ]]; then
        icotool -x -o "${srcdir}" "${srcdir}/icon.ico" 2>/dev/null || true
        local _png
        _png=$(find "${srcdir}" -name "*.png" | sort -t_ -k3 -rn | head -1)
        if [[ -n "${_png}" ]]; then
            install -Dm644 "${_png}" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
        fi
    fi

    # Extract and install monitor icon (group_icon 128 is LoxoneMonitor's own app icon;
    # 130 is a document/file-type icon, not the app icon)
    wrestool -x --type=14 --name=128 -o "${srcdir}/icon-monitor.ico" "${_appdir}/LoxoneMonitor.exe" 2>/dev/null || true
    if [[ -f "${srcdir}/icon-monitor.ico" ]]; then
        install -dm755 "${srcdir}/monitor-icon"
        icotool -x -o "${srcdir}/monitor-icon" "${srcdir}/icon-monitor.ico" 2>/dev/null || true
        local _monitor_png
        _monitor_png=$(find "${srcdir}/monitor-icon" -name "*.png" | sort -t_ -k3 -rn | head -1)
        if [[ -n "${_monitor_png}" ]]; then
            install -Dm644 "${_monitor_png}" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}-monitor.png"
        fi
    fi

    # Wrapper scripts
    install -Dm755 "${srcdir}/loxone-config.sh" "${pkgdir}/usr/bin/loxone-config"
    install -Dm755 "${srcdir}/loxone-monitor.sh" "${pkgdir}/usr/bin/loxone-monitor"
    install -Dm755 "${srcdir}/loxone-config-dpi.sh" "${pkgdir}/usr/bin/loxone-config-dpi"

    # Desktop entries
    install -Dm644 "${srcdir}/loxone-config.desktop" "${pkgdir}/usr/share/applications/loxone-config.desktop"
    install -Dm644 "${srcdir}/loxone-monitor.desktop" "${pkgdir}/usr/share/applications/loxone-monitor.desktop"
    install -Dm644 "${srcdir}/loxone-config-dpi.desktop" "${pkgdir}/usr/share/applications/loxone-config-dpi.desktop"
}
