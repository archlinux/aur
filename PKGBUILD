# Maintainer: Iswad <iswad@archlinux.org>
# Contributor: Iswad

pkgname=touchdesigner-linux
pkgver=1.4
pkgrel=1
pkgdesc="TouchDesigner on Linux — Soda Wine, Vulkan-accelerated, ready to run"
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

    msg2 "Extracting TouchDesigner (innoextract)..."
    mkdir -p td-inno
    innoextract -d td-inno -q "TouchDesigner.${_td_ver}.exe"

    mkdir -p td
    cp -r "td-inno/\$/app/" td/
    if [ -d "td-inno/commonappdata" ]; then
        cp -r "td-inno/commonappdata/" td-commonappdata/
    fi

    msg2 "Extracting Soda Wine..."
    mkdir -p soda-wine
    tar -xJf "soda-${_soda_version}.tar.xz" -C soda-wine --strip-components=1 2>/dev/null

    msg2 "Extracting DXVK..."
    mkdir -p dxvk
    tar -xzf "dxvk-${_dxvk_version}.tar.gz" -C dxvk --strip-components=1 2>/dev/null

    chmod +x winetricks

    # Pre-setup Wine prefix so first launch is instant
    msg2 "Setting up Wine prefix (this will take a minute)..."
    export WINEPREFIX="${srcdir}/prefix-template"
    export WINEDLLOVERRIDES="mscoree="
    export PATH="${srcdir}/soda-wine/bin:${PATH}"
    mkdir -p "${WINEPREFIX}"
    wine64 wineboot -u 2>/dev/null || true
    msg2 "  Installing DXVK..."
    "${srcdir}/dxvk/setup_dxvk.sh" install 2>/dev/null || true
    msg2 "  Installing core fonts..."
    "${srcdir}/winetricks" -q corefonts 2>/dev/null || true
    msg2 "Wine prefix ready."
}

package() {
    cd "${srcdir}"
    local repo_dir="${srcdir}/TouchDesigner-Linux-${pkgver}"
    local prefix="/opt/touchdesigner"

    msg2 "Installing Soda Wine..."
    mkdir -p "${pkgdir}${prefix}/wine"
    cp -r soda-wine/* "${pkgdir}${prefix}/wine/" 2>/dev/null

    msg2 "Installing TouchDesigner ${_td_ver}..."
    mkdir -p "${pkgdir}${prefix}/td"
    if [ -d td/app ]; then
        cp -r td/app/* "${pkgdir}${prefix}/td/" 2>/dev/null
    else
        cp -r td/* "${pkgdir}${prefix}/td/" 2>/dev/null
    fi

    if [ -d td-commonappdata ]; then
        mkdir -p "${pkgdir}${prefix}/data/ProgramData"
        cp -r td-commonappdata/* "${pkgdir}${prefix}/data/ProgramData/" 2>/dev/null
    fi

    msg2 "Installing DXVK..."
    mkdir -p "${pkgdir}${prefix}/dxvk"
    cp -r dxvk/* "${pkgdir}${prefix}/dxvk/" 2>/dev/null

    install -Dm755 winetricks "${pkgdir}${prefix}/winetricks"

    # Pre-made Wine prefix (copy on first launch)
    if [ -d prefix-template ]; then
        msg2 "Packaging pre-made Wine prefix..."
        mkdir -p "${pkgdir}${prefix}/default-prefix"
        cp -r prefix-template/* "${pkgdir}${prefix}/default-prefix/" 2>/dev/null
    fi

    {
        echo "TouchDesigner ${_td_ver}"
        echo "Soda Wine ${_soda_version}"
        echo "DXVK ${_dxvk_version}"
    } > "${pkgdir}${prefix}/VERSION"

    # Wrapper script
    msg2 "Creating wrapper..."
    mkdir -p "${pkgdir}${prefix}/app"
    cat > "${pkgdir}${prefix}/app/touchdesigner-wrapper.sh" << 'WRAPPER'
#!/bin/bash
# TouchDesigner launcher with auto-patching

PREFIX="/opt/touchdesigner"
WINE="${PREFIX}/wine/bin/wine64"
RUNNER_DIR="${PREFIX}/wine"
TD_DIR="${PREFIX}/td"
DXVK_DIR="${PREFIX}/dxvk"
WINETRICKS="${PREFIX}/winetricks"
DATA_DIR="${PREFIX}/data"
WINE_PREFIX="${HOME}/.local/share/touchdesigner-linux/prefix"
BACKUP_DIR="${PREFIX}/backups"
FIX_FILE="${PREFIX}/wine_ui_fixes.tox"

export WINEDLLOVERRIDES="mscoree="
export WINEDEBUG="-all"
export PATH="${RUNNER_DIR}/bin:${PATH}"
export LD_LIBRARY_PATH="${RUNNER_DIR}/lib:${RUNNER_DIR}/lib64:${LD_LIBRARY_PATH:-}"

mkdir -p "$(dirname "${WINE_PREFIX}")"

# Copy pre-made prefix on first run (instant instead of 3 min setup)
if [ ! -f "${WINE_PREFIX}/drive_c/windows/system.reg" ] && [ -d "${PREFIX}/default-prefix" ]; then
    echo "TouchDesigner — Copying pre-made prefix..."
    mkdir -p "${WINE_PREFIX}"
    cp -r "${PREFIX}/default-prefix/"* "${WINE_PREFIX}/" 2>/dev/null
    echo "  Done."
fi

# ProgramData
if [ -d "${DATA_DIR}/ProgramData" ]; then
    mkdir -p "${WINE_PREFIX}/drive_c/ProgramData"
    cp -r "${DATA_DIR}/ProgramData/"* "${WINE_PREFIX}/drive_c/ProgramData/" 2>/dev/null
fi

# Handle .toe argument
EXTRA_ARGS=()
INPUT_PATH=""
if [ -n "$1" ]; then
    INPUT_PATH="$1"
    if [[ "$INPUT_PATH" == file://* ]]; then
        INPUT_PATH="${INPUT_PATH#file://}"
        INPUT_PATH="$(python3 -c "import sys, urllib.parse; print(urllib.parse.unquote(sys.argv[1]))" "$INPUT_PATH" 2>/dev/null || echo "$INPUT_PATH")"
    fi
    EXTRA_ARGS=("z:${INPUT_PATH//\\/\\\\}")
fi

# Auto-patching .toe files
TOE_EXPAND="$(find "$WINE_PREFIX/drive_c" -type f -iname 'toeexpand.exe' 2>/dev/null | head -n1 || true)"
TOE_COLLAPSE="$(find "$WINE_PREFIX/drive_c" -type f -iname 'toecollapse.exe' 2>/dev/null | head -n1 || true)"

check_and_patch_toe() {
    local TOE_PATH="$1"
    [ -f "$TOE_PATH" ] || return 0
    local TOE_BASE DIR_PATH TOC_PATH WINE_TOE
    TOE_BASE="$(basename "$TOE_PATH")"
    local TOE_DIR="$(dirname "$TOE_PATH")"
    DIR_PATH="$TOE_DIR/${TOE_BASE}.dir"
    TOC_PATH="$TOE_DIR/${TOE_BASE}.toc"
    WINE_TOE="z:${TOE_PATH//\\/\\\\}"
    rm -rf "$DIR_PATH" "$TOC_PATH" 2>/dev/null || true
    WINEPREFIX="$WINE_PREFIX" "$RUNNER_DIR/bin/wine64" "$TOE_EXPAND" "$WINE_TOE" >/dev/null 2>&1 || true
    local NEEDS_PATCH=false
    [ ! -d "$DIR_PATH/wine_ui_fixes" ] && NEEDS_PATCH=true
    rm -rf "$DIR_PATH" "$TOC_PATH" 2>/dev/null || true
    if [ "$NEEDS_PATCH" = true ]; then
        mkdir -p "$BACKUP_DIR" 2>/dev/null || true
        cp -f "$TOE_PATH" "$BACKUP_DIR/${TOE_PATH//\//_}.bak" 2>/dev/null || true
        WINEPREFIX="$WINE_PREFIX" "$RUNNER_DIR/bin/wine64" "$TOE_EXPAND" "$WINE_TOE" >/dev/null 2>&1 || true
        if [ -d "$DIR_PATH" ]; then
            local MERGE_TMP="$(mktemp -d "/tmp/td_merge_toe.XXXXXX" 2>/dev/null || true)"
            if [ -n "$MERGE_TMP" ]; then
                local MERGE_FIX="$MERGE_TMP/fix.tox"
                cp -f "$FIX_FILE" "$MERGE_FIX" 2>/dev/null || true
                WINEPREFIX="$WINE_PREFIX" "$RUNNER_DIR/bin/wine64" "$TOE_EXPAND" "z:${MERGE_FIX//\\/\\\\}" >/dev/null 2>&1 || true
                [ -d "$MERGE_FIX.dir" ] && cp -rf "$MERGE_FIX.dir/"* "$DIR_PATH/" 2>/dev/null || true
                rm -rf "$MERGE_TMP" 2>/dev/null || true
            fi
            for entry in "${FIX_ENTRIES[@]}"; do echo "$entry" >> "$TOC_PATH"; done
            WINEPREFIX="$WINE_PREFIX" "$RUNNER_DIR/bin/wine64" "$TOE_COLLAPSE" "$WINE_TOE" >/dev/null 2>&1 || true
        fi
        rm -rf "$DIR_PATH" "$TOC_PATH" 2>/dev/null || true
    fi
}

if [ -n "$TOE_EXPAND" ] && [ -n "$TOE_COLLAPSE" ] && [ -f "$FIX_FILE" ]; then
    FIX_TMPDIR="$(mktemp -d "/tmp/td_fix_launcher.XXXXXX" 2>/dev/null || true)"
    if [ -n "$FIX_TMPDIR" ]; then
        FIX_COPY="$FIX_TMPDIR/fix.tox"
        cp -f "$FIX_FILE" "$FIX_COPY" 2>/dev/null || true
        WINEPREFIX="$WINE_PREFIX" "$RUNNER_DIR/bin/wine64" "$TOE_EXPAND" "z:${FIX_COPY//\\/\\\\}" >/dev/null 2>&1 || true
        if [ -d "$FIX_COPY.dir" ]; then
            FIX_ENTRIES=()
            while IFS= read -r entry; do
                [ -z "$entry" ] && continue
                [[ "$entry" == \#* ]] && continue
                [ "$entry" = ".build" ] && continue
                FIX_ENTRIES+=("$entry")
            done < "$FIX_COPY.toc"
            while IFS= read -r -d '' NP_TOE; do
                check_and_patch_toe "$NP_TOE"
            done < <(find "$WINE_PREFIX/drive_c" -type f -iname 'NewProject.toe' -print0 2>/dev/null || true)
            if [ -n "$INPUT_PATH" ] && [[ "$INPUT_PATH" == *.toe ]]; then
                check_and_patch_toe "$INPUT_PATH"
            fi
        fi
        rm -rf "$FIX_TMPDIR" 2>/dev/null || true
    fi
fi

find "$BACKUP_DIR" -name '*.bak' -type f -mtime +30 -delete 2>/dev/null || true

# Launch TD
TD_EXE=""
for f in "${TD_DIR}/bin/TouchDesigner.exe" "${TD_DIR}/TouchDesigner.exe"; do
    [ -f "$f" ] && { TD_EXE="$f"; break; }
done
[ -z "$TD_EXE" ] && TD_EXE=$(find "${TD_DIR}" -name 'TouchDesigner*.exe' -type f 2>/dev/null | head -1)
if [ -z "$TD_EXE" ]; then
    echo "Error: TouchDesigner not found in ${TD_DIR}"
    exit 1
fi

WINEPREFIX="${WINE_PREFIX}" "${WINE}" "${TD_EXE}" "${EXTRA_ARGS[@]}"
WRAPPER
    chmod 755 "${pkgdir}${prefix}/app/touchdesigner-wrapper.sh"

    # Symlinks
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "${prefix}/app/touchdesigner-wrapper.sh" "${pkgdir}/usr/bin/touchdesigner"

    # Desktop entry
    msg2 "Creating desktop entry..."
    mkdir -p "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/touchdesigner.desktop" << DESKTOP
[Desktop Entry]
Version=1.0
Type=Application
Name=TouchDesigner ${_td_ver}
Comment=Visual development platform
Exec=${prefix}/app/touchdesigner-wrapper.sh %F
Icon=/usr/share/icons/hicolor/scalable/apps/touchdesigner.svg
Terminal=false
Categories=Development;Graphics;
MimeType=application/x-touchdesigner-toe;application/x-touchdesigner-tox;
StartupNotify=true
DESKTOP

    # MIME
    mkdir -p "${pkgdir}/usr/share/mime/packages"
    cat > "${pkgdir}/usr/share/mime/packages/touchdesigner.xml" << MIME
<?xml version="1.0"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
    <mime-type type="application/x-touchdesigner-toe">
        <comment>TouchDesigner Project File</comment>
        <glob pattern="*.toe"/>
        <icon name="touchdesigner-toe"/>
    </mime-type>
    <mime-type type="application/x-touchdesigner-tox">
        <comment>TouchDesigner Component File</comment>
        <glob pattern="*.tox"/>
        <icon name="touchdesigner-tox"/>
    </mime-type>
</mime-info>
MIME

    # Icons
    msg2 "Installing icons..."
    if [ -d "${repo_dir}/Assets/Icons" ]; then
        install -Dm644 "${repo_dir}/Assets/Icons/TouchDesigner.svg" \
            "${pkgdir}/usr/share/icons/hicolor/scalable/apps/touchdesigner.svg"
        install -Dm644 "${repo_dir}/Assets/Icons/TouchDesigner-toe.svg" \
            "${pkgdir}/usr/share/icons/hicolor/scalable/apps/touchdesigner-toe.svg"
        install -Dm644 "${repo_dir}/Assets/Icons/TouchDesigner-tox.svg" \
            "${pkgdir}/usr/share/icons/hicolor/scalable/apps/touchdesigner-tox.svg"
    fi

    # td-install + wine_ui_fixes.tox
    msg2 "Installing td-install..."
    if [ -f "${repo_dir}/td-install" ]; then
        install -Dm755 "${repo_dir}/td-install" "${pkgdir}/usr/bin/td-install"
        mkdir -p "${pkgdir}/usr/share/touchdesigner-linux"
        cp -r "${repo_dir}/td_lib" "${pkgdir}/usr/share/touchdesigner-linux/" 2>/dev/null
        if [ -f "${repo_dir}/Assets/wine_ui_fixes.tox" ]; then
            install -Dm644 "${repo_dir}/Assets/wine_ui_fixes.tox" \
                "${pkgdir}${prefix}/wine_ui_fixes.tox"
            install -Dm644 "${repo_dir}/Assets/wine_ui_fixes.tox" \
                "${pkgdir}/usr/share/touchdesigner-linux/wine_ui_fixes.tox"
        fi
    fi
}
