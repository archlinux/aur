# Maintainer: Iswad <iswad@archlinux.org>
# Contributor: Iswad

pkgname=touchdesigner-linux
pkgver=1.4
pkgrel=1
pkgdesc="TouchDesigner on Linux - Soda Wine, Vulkan-accelerated, ready to run"
arch=('x86_64')
url="https://github.com/iswad-lab/TouchDesigner-Linux"
license=('custom:custom')
_td_ver=2025.32820

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
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

build() {
    cd "${srcdir}"
    msg2 "Extracting TouchDesigner..."
    mkdir -p td-inno && innoextract -d td-inno "TouchDesigner.${_td_ver}.exe"
    mkdir -p td && cp -r "td-inno/\$/app/" td/ >/dev/null 2>&1
    [ -d "td-inno/commonappdata" ] && { mkdir -p td-commonappdata; cp -r "td-inno/commonappdata/" td-commonappdata/ >/dev/null 2>&1; }
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

    # Patch NewProject.toe during build (user can't write to /opt/touchdesigner/td at runtime)
    msg2 "Patching NewProject.toe templates..."
    TOE_EXP="$(find "${srcdir}/td" -type f -iname 'toeexpand.exe' -print -quit 2>/dev/null)"
    TOE_COL="$(find "${srcdir}/td" -type f -iname 'toecollapse.exe' -print -quit 2>/dev/null)"
    if [ -n "$TOE_EXP" ] && [ -n "$TOE_COL" ]; then
        # Copy fix file
        [ -f "TouchDesigner-Linux-${pkgver}/Assets/wine_ui_fixes.tox" ] && cp "TouchDesigner-Linux-${pkgver}/Assets/wine_ui_fixes.tox" wine_ui_fixes.tox
        if [ -f wine_ui_fixes.tox ]; then
            FIX_TMP=$(mktemp -d /tmp/td_build_fix.XXXXXX)
            cp wine_ui_fixes.tox "$FIX_TMP/fix.tox"
            WINEPREFIX="$WINEPREFIX" wine64 "$TOE_EXP" "z:${FIX_TMP}/fix.tox" >/dev/null 2>&1 || true
            if [ -f "$FIX_TMP/fix.tox.toc" ]; then
                FIX_ENTS=()
                while IFS= read -r entry; do
                    [ -z "$entry" ] && continue; [[ "$entry" == \#* ]] && continue; [ "$entry" = ".build" ] && continue
                    FIX_ENTS+=("$entry")
                done < "$FIX_TMP/fix.tox.toc"
                find "${srcdir}/td" -type f -iname 'NewProject.toe' -print0 2>/dev/null | while IFS= read -r -d '' toe; do
                    msg2 "  Patching: ${toe#${srcdir}/td/}"
                    local B=$(basename "$toe") D=$(dirname "$toe")
                    local DIR="$D/${B}.dir" TOC="$D/${B}.toc" W="z:${toe}"
                    rm -rf "$DIR" "$TOC"
                    WINEPREFIX="$WINEPREFIX" wine64 "$TOE_EXP" "$W" >/dev/null 2>&1 || true
                    local NEEDS=false; [ ! -d "$DIR/wine_ui_fixes" ] && NEEDS=true
                    rm -rf "$DIR" "$TOC"
                    if $NEEDS; then
                        cp "$toe" "${toe}.bak"
                        WINEPREFIX="$WINEPREFIX" wine64 "$TOE_EXP" "$W" >/dev/null 2>&1 || true
                        if [ -d "$DIR" ]; then
                            MTMP=$(mktemp -d /tmp/td_build_merge.XXXXXX)
                            cp wine_ui_fixes.tox "$MTMP/fix.tox"
                            WINEPREFIX="$WINEPREFIX" wine64 "$TOE_EXP" "z:${MTMP}/fix.tox" >/dev/null 2>&1 || true
                            [ -d "$MTMP/fix.tox.dir" ] && cp -rf "$MTMP/fix.tox.dir/"* "$DIR/"
                            rm -rf "$MTMP"
                            for entry in "${FIX_ENTS[@]}"; do echo "$entry" >> "$TOC"; done
                            WINEPREFIX="$WINEPREFIX" wine64 "$TOE_COL" "$W" >/dev/null 2>&1 || true
                        fi
                        rm -rf "$DIR" "$TOC" "${toe}.bak"
                        msg2 "    OK"
                    else
                        msg2 "    Already patched"
                    fi
                done
            fi
            rm -rf "$FIX_TMP"
        fi
    fi
}

package() {
    cd "${srcdir}"
    local RD="${srcdir}/TouchDesigner-Linux-${pkgver}" P="/opt/touchdesigner"
    msg2 "Installing Soda Wine..."
    mkdir -p "${pkgdir}${P}/wine" && cp -r soda-wine/* "${pkgdir}${P}/wine/" >/dev/null 2>&1
    msg2 "Installing TouchDesigner..."
    mkdir -p "${pkgdir}${P}/td"
    if [ -d td/app ]; then cp -r td/app/* "${pkgdir}${P}/td/" >/dev/null 2>&1
    else cp -r td/* "${pkgdir}${P}/td/" >/dev/null 2>&1; fi
    [ -d td-commonappdata ] && { mkdir -p "${pkgdir}${P}/data/ProgramData"; cp -r td-commonappdata/* "${pkgdir}${P}/data/ProgramData/" >/dev/null 2>&1; }
    msg2 "Installing DXVK..."
    mkdir -p "${pkgdir}${P}/dxvk" && cp -r dxvk/* "${pkgdir}${P}/dxvk/" >/dev/null 2>&1
    install -Dm755 winetricks "${pkgdir}${P}/winetricks"
    [ -d prefix-template ] && { msg2 "Packaging pre-made Wine prefix..."; mkdir -p "${pkgdir}${P}/default-prefix"; cp -r prefix-template/* "${pkgdir}${P}/default-prefix/" >/dev/null 2>&1; }
    { echo "TouchDesigner ${_td_ver}"; echo "Soda Wine ${_soda_version}"; echo "DXVK ${_dxvk_version}"; } > "${pkgdir}${P}/VERSION"

    msg2 "Creating wrapper..."
    mkdir -p "${pkgdir}${P}/app"
    cat > "${pkgdir}${P}/app/touchdesigner-wrapper.sh" << WRAPPER
#!/bin/bash
P="/opt/touchdesigner"
WINE="\${P}/wine/bin/wine64"
TD_DIR="\${P}/td"
WINE_PREFIX="\${HOME}/.local/share/touchdesigner-linux/prefix"
BACKUP_DIR="\${P}/backups"
FIX_FILE="\${P}/wine_ui_fixes.tox"
export WINEDLLOVERRIDES="mscoree=" WINEDEBUG="-all"
export PATH="\${P}/wine/bin:\${PATH}"
export LD_LIBRARY_PATH="\${P}/wine/lib:\${P}/wine/lib64:\${LD_LIBRARY_PATH:-}"

mkdir -p "\$(dirname "\${WINE_PREFIX}")"

# Pre-made prefix
if [ ! -f "\${WINE_PREFIX}/drive_c/windows/system.reg" ] && [ -d "\${P}/default-prefix" ]; then
    echo "TouchDesigner - Placing pre-made Wine prefix..."
    mkdir -p "\${WINE_PREFIX}" && cp -r "\${P}/default-prefix/"* "\${WINE_PREFIX}/" 2>/dev/null
fi
if [ -d "\${P}/data/ProgramData" ]; then
    mkdir -p "\${WINE_PREFIX}/drive_c/ProgramData"
    cp -r "\${P}/data/ProgramData/"* "\${WINE_PREFIX}/drive_c/ProgramData/" 2>/dev/null
fi

# Find toeexpand
TOE_EXPAND="\$(find "\$WINE_PREFIX/drive_c" -type f -iname 'toeexpand.exe' 2>/dev/null | head -n1 || true)"
TOE_COLLAPSE="\$(find "\$WINE_PREFIX/drive_c" -type f -iname 'toecollapse.exe' 2>/dev/null | head -n1 || true)"
if [ -z "\$TOE_EXPAND" ] && [ -f "\${TD_DIR}/bin/toeexpand.exe" ]; then
    TOE_EXPAND="\${TD_DIR}/bin/toeexpand.exe"
    TOE_COLLAPSE="\${TD_DIR}/bin/toecollapse.exe"
fi

# Handle .toe argument
EXTRA_ARGS=(); INPUT_PATH=""
if [ -n "\$1" ]; then
    INPUT_PATH="\$1"
    [[ "\$INPUT_PATH" == file://* ]] && INPUT_PATH="\$(python3 -c "import sys,urllib.parse; print(urllib.parse.unquote(sys.argv[1]))" "\${INPUT_PATH#file://}" 2>/dev/null)"
    EXTRA_ARGS+=("z:\${INPUT_PATH//\\\\//}")
fi

# Patch function
patch_toe() {
    local F="\$1" B="\$(basename "\$F")" D="\$(dirname "\$F")"
    local DIR="\$D/\${B}.dir" TOC="\$D/\${B}.toc" W="z:\${F//\\\\//}"
    rm -rf "\$DIR" "\$TOC"
    WINEPREFIX="\$WINE_PREFIX" wine64 "\$TOE_EXPAND" "\$W" >/dev/null 2>&1 || true
    local NEEDS=false; [ ! -d "\$DIR/wine_ui_fixes" ] && NEEDS=true
    rm -rf "\$DIR" "\$TOC"
    if \$NEEDS; then
        mkdir -p "\$BACKUP_DIR"
        cp -f "\$F" "\$BACKUP_DIR/\${F////_}.bak"
        WINEPREFIX="\$WINE_PREFIX" wine64 "\$TOE_EXPAND" "\$W" >/dev/null 2>&1 || true
        [ -d "\$DIR" ] && { local TMP="\$(mktemp -d /tmp/td_patch.XXXXXX)"
            cp -f "\$FIX_FILE" "\$TMP/fix.tox"
            WINEPREFIX="\$WINE_PREFIX" wine64 "\$TOE_EXPAND" "z:\${TMP}/fix.tox" >/dev/null 2>&1 || true
            [ -d "\$TMP/fix.tox.dir" ] && cp -rf "\$TMP/fix.tox.dir/"* "\$DIR/"
            rm -rf "\$TMP"
            for e in "\${FIX_ENTS[@]}"; do echo "\$e" >> "\$TOC"; done
            WINEPREFIX="\$WINE_PREFIX" wine64 "\$TOE_COLLAPSE" "\$W" >/dev/null 2>&1 || true
        }
        rm -rf "\$DIR" "\$TOC"
    fi
}

# Auto-patch on launch
[ -n "\$TOE_EXPAND" ] && [ -n "\$TOE_COLLAPSE" ] && [ -f "\$FIX_FILE" ] && {
    TMP="\$(mktemp -d /tmp/td_fix.XXXXXX)"
    cp -f "\$FIX_FILE" "\$TMP/fix.tox"
    WINEPREFIX="\$WINE_PREFIX" wine64 "\$TOE_EXPAND" "z:\${TMP}/fix.tox" >/dev/null 2>&1 || true
    [ -d "\$TMP/fix.tox.dir" ] && { FIX_ENTS=()
        while IFS= read -r e; do [ -n "\$e" ] && [[ "\$e" != \\#* ]] && [ "\$e" != ".build" ] && FIX_ENTS+=("\$e"); done < "\$TMP/fix.tox.toc"
        while IFS= read -r -d '' f; do patch_toe "\$f"; done < <(find "\$WINE_PREFIX/drive_c" -type f -iname 'NewProject.toe' -print0 2>/dev/null || true)
        # TD_DIR files already patched during build (not writable by user at runtime)
        [ -n "\$INPUT_PATH" ] && [[ "\$INPUT_PATH" == *.toe ]] && patch_toe "\$INPUT_PATH"
    }
    rm -rf "\$TMP"
}

find "\$BACKUP_DIR" -name '*.bak' -type f -mtime +30 -delete 2>/dev/null || true

# Find and launch TD
TD_EXE=""
for f in "\${TD_DIR}/bin/TouchDesigner.exe" "\${TD_DIR}/TouchDesigner.exe"; do [ -f "\$f" ] && { TD_EXE="\$f"; break; }; done
[ -z "\$TD_EXE" ] && TD_EXE=\$(find "\${TD_DIR}" -name 'TouchDesigner*.exe' -type f 2>/dev/null | head -1)
[ -z "\$TD_EXE" ] && { echo "Error: TouchDesigner not found"; exit 1; }
WINEPREFIX="\${WINE_PREFIX}" "\${WINE}" "\${TD_EXE}" "\${EXTRA_ARGS[@]}"
WRAPPER
    chmod 755 "${pkgdir}${P}/app/touchdesigner-wrapper.sh"
    mkdir -p "${pkgdir}/usr/bin" && ln -s "${P}/app/touchdesigner-wrapper.sh" "${pkgdir}/usr/bin/touchdesigner"
    msg2 "Creating desktop entry..."
    mkdir -p "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/touchdesigner.desktop" << DESKTOP
[Desktop Entry]
Version=1.0
Type=Application
Name=TouchDesigner ${_td_ver}
Comment=Visual development platform
Exec=${P}/app/touchdesigner-wrapper.sh %F
Icon=/usr/share/icons/hicolor/scalable/apps/touchdesigner.svg
Terminal=false
Categories=Development;Graphics;
MimeType=application/x-touchdesigner-toe;application/x-touchdesigner-tox;
StartupNotify=true
DESKTOP
    mkdir -p "${pkgdir}/usr/share/mime/packages"
    cat > "${pkgdir}/usr/share/mime/packages/touchdesigner.xml" << MIME
<?xml version="1.0"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
    <mime-type type="application/x-touchdesigner-toe"><comment>TouchDesigner Project File</comment><glob pattern="*.toe"/><icon name="touchdesigner-toe"/></mime-type>
    <mime-type type="application/x-touchdesigner-tox"><comment>TouchDesigner Component File</comment><glob pattern="*.tox"/><icon name="touchdesigner-tox"/></mime-type>
</mime-info>
MIME
    msg2 "Installing icons..."
    if [ -d "${RD}/Assets/Icons" ]; then
        install -Dm644 "${RD}/Assets/Icons/TouchDesigner.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/touchdesigner.svg"
        install -Dm644 "${RD}/Assets/Icons/TouchDesigner-toe.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/touchdesigner-toe.svg"
        install -Dm644 "${RD}/Assets/Icons/TouchDesigner-tox.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/touchdesigner-tox.svg"
    fi
    msg2 "Installing td-install..."
    if [ -f "${RD}/td-install" ]; then
        install -Dm755 "${RD}/td-install" "${pkgdir}/usr/bin/td-install"
        mkdir -p "${pkgdir}/usr/share/touchdesigner-linux"
        cp -r "${RD}/td_lib" "${pkgdir}/usr/share/touchdesigner-linux/" >/dev/null 2>&1
        if [ -f "${RD}/Assets/wine_ui_fixes.tox" ]; then
            install -Dm644 "${RD}/Assets/wine_ui_fixes.tox" "${pkgdir}${P}/wine_ui_fixes.tox"
            install -Dm644 "${RD}/Assets/wine_ui_fixes.tox" "${pkgdir}/usr/share/touchdesigner-linux/wine_ui_fixes.tox"
        fi
    fi
}
