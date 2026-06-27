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

    msg2 "Extracting TouchDesigner..."
    mkdir -p td-inno
    innoextract -d td-inno "TouchDesigner.${_td_ver}.exe"

    mkdir -p td
    cp -r "td-inno/\$/app/" td/
    if [ -d "td-inno/commonappdata" ]; then
        cp -r "td-inno/commonappdata/" td-commonappdata/
    fi

    msg2 "Extracting Soda Wine..."
    mkdir -p soda-wine
    tar -xJf "soda-${_soda_version}.tar.xz" -C soda-wine --strip-components=1

    msg2 "Extracting DXVK..."
    mkdir -p dxvk
    tar -xzf "dxvk-${_dxvk_version}.tar.gz" -C dxvk --strip-components=1

    chmod +x winetricks

    # Pre-setup Wine prefix (so first launch is instant)
    msg2 "Initializing Wine prefix..."
    export WINEPREFIX="${srcdir}/prefix-template"
    export WINEDLLOVERRIDES="mscoree="
    export PATH="${srcdir}/soda-wine/bin:${PATH}"
    mkdir -p "${WINEPREFIX}"
    wine64 wineboot -u 2>&1 || true

    msg2 "Installing DXVK..."
    "${srcdir}/dxvk/setup_dxvk.sh" install 2>&1 || true

    msg2 "Installing core fonts..."
    "${srcdir}/winetricks" -q corefonts 2>&1 || true

    msg2 "Wine prefix ready."
}

package() {
    cd "${srcdir}"
    local repo_dir="${srcdir}/TouchDesigner-Linux-${pkgver}"
    local PREFIX="/opt/touchdesigner"

    msg2 "Installing Soda Wine..."
    mkdir -p "${pkgdir}${PREFIX}/wine"
    cp -r soda-wine/* "${pkgdir}${PREFIX}/wine/"

    msg2 "Installing TouchDesigner..."
    mkdir -p "${pkgdir}${PREFIX}/td"
    if [ -d td/app ]; then
        cp -r td/app/* "${pkgdir}${PREFIX}/td/"
    else
        cp -r td/* "${pkgdir}${PREFIX}/td/"
    fi

    if [ -d td-commonappdata ]; then
        mkdir -p "${pkgdir}${PREFIX}/data/ProgramData"
        cp -r td-commonappdata/* "${pkgdir}${PREFIX}/data/ProgramData/"
    fi

    msg2 "Installing DXVK..."
    mkdir -p "${pkgdir}${PREFIX}/dxvk"
    cp -r dxvk/* "${pkgdir}${PREFIX}/dxvk/"

    install -Dm755 winetricks "${pkgdir}${PREFIX}/winetricks"

    if [ -d prefix-template ]; then
        msg2 "Packaging pre-made Wine prefix..."
        mkdir -p "${pkgdir}${PREFIX}/default-prefix"
        cp -r prefix-template/* "${pkgdir}${PREFIX}/default-prefix/"
    fi

    echo "TouchDesigner ${_td_ver}" > "${pkgdir}${PREFIX}/VERSION"
    echo "Soda Wine ${_soda_version}" >> "${pkgdir}${PREFIX}/VERSION"
    echo "DXVK ${_dxvk_version}" >> "${pkgdir}${PREFIX}/VERSION"

    msg2 "Creating wrapper..."
    mkdir -p "${pkgdir}${PREFIX}/app"
    cat > "${pkgdir}${PREFIX}/app/touchdesigner-wrapper.sh" << 'WRAPPER'
#!/bin/bash
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

# Copy pre-made prefix on first run (instant)
if [ ! -f "${WINE_PREFIX}/drive_c/windows/system.reg" ] && [ -d "${PREFIX}/default-prefix" ]; then
    echo "TouchDesigner — Placing pre-made Wine prefix..."
    mkdir -p "${WINE_PREFIX}"
    cp -r "${PREFIX}/default-prefix/"* "${WINE_PREFIX}/" 2>/dev/null
fi

# ProgramData
if [ -d "${DATA_DIR}/ProgramData" ]; then
    mkdir -p "${WINE_PREFIX}/drive_c/ProgramData"
    cp -r "${DATA_DIR}/ProgramData/"* "${WINE_PREFIX}/drive_c/ProgramData/" 2>/dev/null
fi

# Handle .toe argument
INPUT_PATH=""
if [ -n "$1" ]; then
    INPUT_PATH="$1"
    if [[ "$INPUT_PATH" == file://* ]]; then
        INPUT_PATH="${INPUT_PATH#file://}"
        INPUT_PATH="$(python3 -c "import sys,urllib.parse; print(urllib.parse.unquote(sys.argv[1]))" "$INPUT_PATH" 2>/dev/null || echo "$INPUT_PATH")"
    fi
fi

# Auto-patching
TOE_EXPAND="$(find "$WINE_PREFIX/drive_c" -type f -iname 'toeexpand.exe' 2>/dev/null | head -n1 || true)"
TOE_COLLAPSE="$(find "$WINE_PREFIX/drive_c" -type f -iname 'toecollapse.exe' 2>/dev/null | head -n1 || true)"
TD_EXE="" && for f in "${TD_DIR}/bin/TouchDesigner.exe" "${TD_DIR}/TouchDesigner.exe"; do [ -f "$f" ] && { TD_EXE="$f"; break; }; done
[ -z "$TD_EXE" ] && TD_EXE=$(find "${TD_DIR}" -name 'TouchDesigner*.exe' -type f 2>/dev/null | head -1)

patch_toe() {
    local F="$1"; [ -f "$F" ] || return 0
    local B="$(basename "$F")" D="$(dirname "$F")"
    local DIR="$D/${B}.dir" TOC="$D/${B}.toc"
    local W="z:${F//\\/\\\\}"
    rm -rf "$DIR" "$TOC"
    WINEPREFIX="$WINE_PREFIX" "$RUNNER_DIR/bin/wine64" "$TOE_EXPAND" "$W" >/dev/null 2>&1 || true
    local P=false; [ ! -d "$DIR/wine_ui_fixes" ] && P=true
    rm -rf "$DIR" "$TOC"
    if $P; then
        mkdir -p "$BACKUP_DIR"
        cp -f "$F" "$BACKUP_DIR/${F//\//_}.bak"
        WINEPREFIX="$WINE_PREFIX" "$RUNNER_DIR/bin/wine64" "$TOE_EXPAND" "$W" >/dev/null 2>&1 || true
        [ -d "$DIR" ] && {
            local T="$(mktemp -d /tmp/td_patch.XXXXXX)"
            cp -f "$FIX_FILE" "$T/fix.tox"
            WINEPREFIX="$WINE_PREFIX" "$RUNNER_DIR/bin/wine64" "$TOE_EXPAND" "z:${T//\\/\\\\}/fix.tox" >/dev/null 2>&1 || true
            [ -d "$T/fix.tox.dir" ] && cp -rf "$T/fix.tox.dir/"* "$DIR/"
            rm -rf "$T"
            for e in "${FIX_ENTS[@]}"; do echo "$e" >> "$TOC"; done
            WINEPREFIX="$WINE_PREFIX" "$RUNNER_DIR/bin/wine64" "$TOE_COLLAPSE" "$W" >/dev/null 2>&1 || true
        }
        rm -rf "$DIR" "$TOC"
    fi
}

if [ -n "$TOE_EXPAND" ] && [ -n "$TOE_COLLAPSE" ] && [ -f "$FIX_FILE" ]; then
    T="$(mktemp -d /tmp/td_fix.XXXXXX)"
    cp -f "$FIX_FILE" "$T/fix.tox"
    WINEPREFIX="$WINE_PREFIX" "$RUNNER_DIR/bin/wine64" "$TOE_EXPAND" "z:${T//\\/\\\\}/fix.tox" >/dev/null 2>&1 || true
    if [ -d "$T/fix.tox.dir" ]; then
        FIX_ENTS=()
        while IFS= read -r e; do [ -n "$e" ] && [[ "$e" != \#* ]] && [ "$e" != ".build" ] && FIX_ENTS+=("$e"); done < "$T/fix.tox.toc"
        while IFS= read -r -d '' f; do patch_toe "$f"; done < <(find "$WINE_PREFIX/drive_c" -type f -iname 'NewProject.toe' -print0 2>/dev/null || true)
        [ -n "$INPUT_PATH" ] && [[ "$INPUT_PATH" == *.toe ]] && patch_toe "$INPUT_PATH"
    fi
    rm -rf "$T"
fi

find "$BACKUP_DIR" -name '*.bak' -type f -mtime +30 -delete 2>/dev/null || true

[ -z "$TD_EXE" ] && { echo "Error: TouchDesigner not found"; exit 1; }
WINEPREFIX="${WINE_PREFIX}" "${WINE}" "${TD_EXE}" $( [ -n "$INPUT_PATH" ] && echo "z:${INPUT_PATH//\\/\\\\}" )
WRAPPER
    chmod 755 "${pkgdir}${PREFIX}/app/touchdesigner-wrapper.sh"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "${PREFIX}/app/touchdesigner-wrapper.sh" "${pkgdir}/usr/bin/touchdesigner"

    msg2 "Creating desktop entry..."
    mkdir -p "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/touchdesigner.desktop" << DESKTOP
[Desktop Entry]
Version=1.0
Type=Application
Name=TouchDesigner ${_td_ver}
Comment=Visual development platform
Exec=${PREFIX}/app/touchdesigner-wrapper.sh %F
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

    msg2 "Installing icons..."
    if [ -d "${repo_dir}/Assets/Icons" ]; then
        install -Dm644 "${repo_dir}/Assets/Icons/TouchDesigner.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/touchdesigner.svg"
        install -Dm644 "${repo_dir}/Assets/Icons/TouchDesigner-toe.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/touchdesigner-toe.svg"
        install -Dm644 "${repo_dir}/Assets/Icons/TouchDesigner-tox.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/touchdesigner-tox.svg"
    fi

    msg2 "Installing td-install..."
    if [ -f "${repo_dir}/td-install" ]; then
        install -Dm755 "${repo_dir}/td-install" "${pkgdir}/usr/bin/td-install"
        mkdir -p "${pkgdir}/usr/share/touchdesigner-linux"
        cp -r "${repo_dir}/td_lib" "${pkgdir}/usr/share/touchdesigner-linux/"
        if [ -f "${repo_dir}/Assets/wine_ui_fixes.tox" ]; then
            install -Dm644 "${repo_dir}/Assets/wine_ui_fixes.tox" "${pkgdir}${PREFIX}/wine_ui_fixes.tox"
            install -Dm644 "${repo_dir}/Assets/wine_ui_fixes.tox" "${pkgdir}/usr/share/touchdesigner-linux/wine_ui_fixes.tox"
        fi
    fi
}
