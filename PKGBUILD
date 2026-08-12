# Maintainer: Iswad <iswad@archlinux.org>
# Contributor: Iswad

pkgname=touchdesigner-linux
pkgver=1.6.2
pkgrel=1
pkgdesc="TouchDesigner on Linux - Soda Wine, Vulkan-accelerated, ready to run"
arch=('x86_64')
url="https://github.com/iswad-lab/TouchDesigner-Linux"
license=('custom:custom')
_td_ver=2025.33070

depends=(
    'python' 'git' 'curl' 'wget' 'tar' 'xz'
    'cabextract' 'unzip' 'p7zip' 'innoextract'
    'mesa-utils' 'vulkan-tools' 'vulkan-icd-loader'
    'lib32-vulkan-icd-loader' 'lib32-glib2' 'lib32-gcc-libs'
    'lib32-libx11' 'lib32-libxext' 'lib32-libxrender'
    'lib32-libxrandr' 'lib32-libxi' 'lib32-libxcursor'
    'lib32-libxfixes' 'lib32-libxinerama' 'lib32-libxxf86vm'
    'lib32-libxcomposite' 'lib32-gnutls' 'lib32-freetype2'
    'lib32-fontconfig' 'lib32-alsa-lib' 'xorg-xwayland'
)
makedepends=()
optdepends=('nvidia-utils: NVIDIA GPU acceleration')
install="${pkgname}.install"
options=('!strip')
provides=("${pkgname}-${pkgver}")
conflicts=()
replaces=()

_repo_url="https://github.com/iswad-lab/TouchDesigner-Linux/archive/refs/tags/v${pkgver}.tar.gz"
_soda_version="9.0-1"
_soda_url="https://github.com/bottlesdevs/wine/releases/download/soda-${_soda_version}/soda-${_soda_version}-x86_64.tar.xz"
_td_url="https://download.derivative.ca/TouchDesigner.${_td_ver}.exe"
_dxvk_version="2.4"
_dxvk_url="https://github.com/doitsujin/dxvk/releases/download/v${_dxvk_version}/dxvk-${_dxvk_version}.tar.gz"
_winetricks_url="https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks"

source=(
    "${pkgname}-${pkgver}.tar.gz::${_repo_url}"
    "soda-${_soda_version}.tar.xz::${_soda_url}"
    "TouchDesigner.${_td_ver}.exe::${_td_url}"
    "dxvk-${_dxvk_version}.tar.gz::${_dxvk_url}"
    "winetricks::${_winetricks_url}"
    "touchdesigner-launcher.py"
    "touchdesigner-linux.install"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

build() {
    msg2 "Extracting TouchDesigner..."
    mkdir -p td-inno && innoextract -d td-inno "TouchDesigner.${_td_ver}.exe"
    mkdir -p td && cp -r "td-inno/\$/app/" td/ >/dev/null 2>&1
    [ -d "td-inno/commonappdata" ] && {
        mkdir -p td-commonappdata
        cp -r "td-inno/commonappdata/" td-commonappdata/ >/dev/null 2>&1
    }
    msg2 "Extracting Soda Wine..."
    mkdir -p soda-wine && tar -xJf "soda-${_soda_version}.tar.xz" -C soda-wine --strip-components=1 >/dev/null 2>&1
    msg2 "Extracting DXVK..."
    mkdir -p dxvk && tar -xzf "dxvk-${_dxvk_version}.tar.gz" -C dxvk --strip-components=1 >/dev/null 2>&1
    chmod +x winetricks

    msg2 "Setting up Wine prefix..."
    export WINEPREFIX="${srcdir}/prefix-template" WINEDLLOVERRIDES="mscoree="
    export PATH="${srcdir}/soda-wine/bin:${PATH}"
    mkdir -p "${WINEPREFIX}"
    wine64 wineboot -u >/dev/null 2>&1 || true
    "${srcdir}/dxvk/setup_dxvk.sh" install >/dev/null 2>&1 || true
    "${srcdir}/winetricks" -q corefonts >/dev/null 2>&1 || true
    msg2 "Wine prefix ready."

    msg2 "Copying ProgramData into prefix template..."
    if [ -d "td-commonappdata" ]; then
        mkdir -p "${WINEPREFIX}/drive_c/ProgramData"
        cp -r td-commonappdata/* "${WINEPREFIX}/drive_c/ProgramData/" >/dev/null 2>&1
    fi

    msg2 "Patching all .toe files in prefix template + TD samples..."
    TOE_EXP="$(find "${srcdir}/td" -type f -iname 'toeexpand.exe' -print -quit 2>/dev/null)"
    TOE_COL="$(find "${srcdir}/td" -type f -iname 'toecollapse.exe' -print -quit 2>/dev/null)"
    FIX_FILE="TouchDesigner-Linux-${pkgver}/Assets/wine_ui_fixes.tox"
    if [ -n "$TOE_EXP" ] && [ -n "$TOE_COL" ] && [ -f "$FIX_FILE" ]; then
        # Extract fix entries first
        FIX_TMP=$(mktemp -d /tmp/td_build_fix.XXXXXX)
        cp "$FIX_FILE" "$FIX_TMP/fix.tox"
        WINEPREFIX="$WINEPREFIX" wine64 "$TOE_EXP" "z:${FIX_TMP}/fix.tox" >/dev/null 2>&1 || true
        FIX_ENTS=()
        if [ -f "$FIX_TMP/fix.tox.toc" ]; then
            while IFS= read -r entry; do
                [ -z "$entry" ] && continue
                [[ "$entry" == \#* ]] && continue
                [ "$entry" = ".build" ] && continue
                FIX_ENTS+=("$entry")
            done < "$FIX_TMP/fix.tox.toc"
        fi

        # Patch all .toe files in TD samples and prefix template
        for toe_root in "${WINEPREFIX}/drive_c/ProgramData" "${srcdir}/td"; do
            [ ! -d "$toe_root" ] && continue
            find "$toe_root" -type f -iname '*.toe' -print0 2>/dev/null | while IFS= read -r -d '' toe; do
                B=$(basename "$toe") D=$(dirname "$toe")
                DIR="$D/${B}.dir" TOC="$D/${B}.toc" W="z:${toe}"
                rm -rf "$DIR" "$TOC"
                WINEPREFIX="$WINEPREFIX" wine64 "$TOE_EXP" "$W" >/dev/null 2>&1 || true
                NEEDS=false; [ ! -d "$DIR/wine_ui_fixes" ] && NEEDS=true
                rm -rf "$DIR" "$TOC"
                $NEEDS || continue
                WINEPREFIX="$WINEPREFIX" wine64 "$TOE_EXP" "$W" >/dev/null 2>&1 || true
                [ -d "$DIR" ] || continue
                MTMP=$(mktemp -d /tmp/td_build_merge.XXXXXX)
                cp "$FIX_FILE" "$MTMP/fix.tox"
                WINEPREFIX="$WINEPREFIX" wine64 "$TOE_EXP" "z:${MTMP}/fix.tox" >/dev/null 2>&1 || true
                [ -d "$MTMP/fix.tox.dir" ] && cp -rf "$MTMP/fix.tox.dir/"* "$DIR/" 2>/dev/null
                rm -rf "$MTMP"
                for entry in "${FIX_ENTS[@]}"; do echo "$entry" >> "$TOC"; done 2>/dev/null
                WINEPREFIX="$WINEPREFIX" wine64 "$TOE_COL" "$W" >/dev/null 2>&1 || true
                rm -rf "$DIR" "$TOC"
            done
        done
        rm -rf "$FIX_TMP"
    fi
}

package() {
    local RD="${srcdir}/TouchDesigner-Linux-${pkgver}" P="/opt/touchdesigner"

    # ── Install Wine runner ──
    msg2 "Installing Soda Wine..."
    mkdir -p "${pkgdir}${P}/wine"
    cp -r "${srcdir}/soda-wine/"* "${pkgdir}${P}/wine/" >/dev/null 2>&1

    # ── Install TouchDesigner ──
    msg2 "Installing TouchDesigner..."
    mkdir -p "${pkgdir}${P}/td"
    if [ -d "${srcdir}/td/app" ]; then
        cp -r "${srcdir}/td/app/"* "${pkgdir}${P}/td/" >/dev/null 2>&1
    else
        cp -r "${srcdir}/td/"* "${pkgdir}${P}/td/" >/dev/null 2>&1
    fi
    if [ -d "${srcdir}/td-commonappdata" ]; then
        mkdir -p "${pkgdir}${P}/data/ProgramData"
        cp -r "${srcdir}/td-commonappdata/"* "${pkgdir}${P}/data/ProgramData/" >/dev/null 2>&1
    fi

    # ── Install DXVK ──
    msg2 "Installing DXVK..."
    mkdir -p "${pkgdir}${P}/dxvk"
    cp -r "${srcdir}/dxvk/"* "${pkgdir}${P}/dxvk/" >/dev/null 2>&1

    # ── Install winetricks ──
    install -Dm755 "${srcdir}/winetricks" "${pkgdir}${P}/winetricks"

    # ── Pre-made Wine prefix ──
    msg2 "Packaging pre-made Wine prefix..."
    mkdir -p "${pkgdir}${P}/default-prefix"
    cp -r "${srcdir}/prefix-template/"* "${pkgdir}${P}/default-prefix/" >/dev/null 2>&1

    # ── Font fix ──
    if [ -f "${RD}/Assets/wine_ui_fixes.tox" ]; then
        install -Dm644 "${RD}/Assets/wine_ui_fixes.tox" "${pkgdir}${P}/wine_ui_fixes.tox"
    fi

    # ── Backups dir ──
    mkdir -p "${pkgdir}${P}/backups" && chmod 777 "${pkgdir}${P}/backups"

    # ── Version file ──
    {
        echo "TouchDesigner ${_td_ver}"
        echo "Soda Wine ${_soda_version}"
        echo "DXVK ${_dxvk_version}"
    } > "${pkgdir}${P}/VERSION"

    # ── Launcher Python script ──
    msg2 "Installing launcher..."
    install -Dm755 "${srcdir}/touchdesigner-launcher.py" "${pkgdir}${P}/app/touchdesigner-launcher.py"
    mkdir -p "${pkgdir}/usr/bin"
    ln -sf "${P}/app/touchdesigner-launcher.py" "${pkgdir}/usr/bin/touchdesigner"

    # ── td-install ──
    if [ -f "${RD}/td-install" ]; then
        install -Dm755 "${RD}/td-install" "${pkgdir}/usr/bin/td-install"
        mkdir -p "${pkgdir}/usr/share/touchdesigner-linux"
        cp -r "${RD}/td_lib" "${pkgdir}/usr/share/touchdesigner-linux/" >/dev/null 2>&1
        cp -f "${P}/wine_ui_fixes.tox" "${pkgdir}/usr/share/touchdesigner-linux/wine_ui_fixes.tox" 2>/dev/null || true
    fi

    # ── Desktop entry ──
    msg2 "Creating desktop entry..."
    mkdir -p "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/touchdesigner.desktop" << DESKTOP
[Desktop Entry]
Version=1.0
Type=Application
Name=TouchDesigner ${_td_ver}
Comment=Real-time visual development platform
Exec=${P}/app/touchdesigner-launcher.py
Icon=touchdesigner
Terminal=false
Categories=Development;Graphics;
StartupNotify=true
DESKTOP

    # ── File handler desktop entry (for double-click on .toe) ──
    cat > "${pkgdir}/usr/share/applications/touchdesigner-file.desktop" << HANDLER
[Desktop Entry]
Version=1.0
Type=Application
Name=TouchDesigner
Comment=Open .toe project
Exec=${P}/app/touchdesigner-launcher.py %u
Icon=touchdesigner
NoDisplay=true
MimeType=application/x-touchdesigner-toe;application/x-touchdesigner-tox;
StartupNotify=true
Categories=Graphics;
HANDLER

    # ── MIME types ──
    msg2 "Installing MIME types..."
    mkdir -p "${pkgdir}/usr/share/mime/packages"
    cat > "${pkgdir}/usr/share/mime/packages/touchdesigner.xml" << MIME
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
    <mime-type type="application/x-touchdesigner-toe">
        <comment>TouchDesigner project file</comment>
        <glob pattern="*.toe" priority="100"/>
        <icon name="touchdesigner-toe"/>
    </mime-type>
    <mime-type type="application/x-touchdesigner-tox">
        <comment>TouchDesigner component file</comment>
        <glob pattern="*.tox" priority="100"/>
        <icon name="touchdesigner-tox"/>
    </mime-type>
</mime-info>
MIME

    # ── Icons ──
    msg2 "Installing icons..."
    if [ -d "${RD}/Assets/Icons" ]; then
        # App icon in apps/ (used by .desktop files)
        install -Dm644 "${RD}/Assets/Icons/TouchDesigner.svg" \
            "${pkgdir}/usr/share/icons/hicolor/scalable/apps/touchdesigner.svg"

        # MIME icons in mimetypes/ (freedesktop spec)
        install -Dm644 "${RD}/Assets/Icons/TouchDesigner-toe.svg" \
            "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/touchdesigner-toe.svg"
        install -Dm644 "${RD}/Assets/Icons/TouchDesigner-tox.svg" \
            "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/touchdesigner-tox.svg"

        # Also copy to apps/ as fallback
        install -Dm644 "${RD}/Assets/Icons/TouchDesigner-toe.svg" \
            "${pkgdir}/usr/share/icons/hicolor/scalable/apps/touchdesigner-toe.svg"
        install -Dm644 "${RD}/Assets/Icons/TouchDesigner-tox.svg" \
            "${pkgdir}/usr/share/icons/hicolor/scalable/apps/touchdesigner-tox.svg"
    fi

    # ── Default file associations via post-install hook (.install) ──
    msg2 "File associations will be set on install via xdg-mime"
}
