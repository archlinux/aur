# Maintainer: Iswad <iswad@archlinux.org>
# Contributor: Iswad

pkgname=touchdesigner-linux
pkgver=1.4
pkgrel=1
pkgdesc="TouchDesigner on Linux — Soda Wine, Vulkan-accelerated, ready to run"
arch=('x86_64')
url="https://github.com/iswad-lab/TouchDesigner-Linux"
license=('custom:custom')

# TouchDesigner version to package
_td_ver=2025.32820
depends=(
    'python'
    'git'
    'curl'
    'wget'
    'tar'
    'xz'
    'cabextract'
    'unzip'
    'p7zip'
    'innoextract'
    'mesa-utils'
    'vulkan-tools'
    'vulkan-icd-loader'
    'lib32-vulkan-icd-loader'
    'lib32-glib2'
    'lib32-gcc-libs'
    'lib32-libx11'
    'lib32-libxext'
    'lib32-libxrender'
    'lib32-libxrandr'
    'lib32-libxi'
    'lib32-libxcursor'
    'lib32-libxfixes'
    'lib32-libxinerama'
    'lib32-libxxf86vm'
    'lib32-libxcomposite'
    'lib32-gnutls'
    'lib32-freetype2'
    'lib32-fontconfig'
    'lib32-alsa-lib'
    'xorg-xwayland'
)
makedepends=(
    'p7zip'      # Extract outer TD archive
    'innoextract' # Extract inner Inno Setup installer
)
optdepends=(
    'nvidia-utils: NVIDIA GPU acceleration'
)
provides=("${pkgname}-${pkgver}")
conflicts=()
replaces=()

# ── Our repo (contains td-install, td_lib, Assets) ──────────────────────────
_repo_url="https://github.com/iswad-lab/TouchDesigner-Linux/archive/refs/tags/v${pkgver}.tar.gz"

# ── Soda Wine 9.0-1 ──────────────────────────────────────────────────────────
_soda_version="9.0-1"
_soda_url="https://github.com/bottlesdevs/wine/releases/download/soda-${_soda_version}/soda-${_soda_version}-x86_64.tar.xz"
_soda_sha256="ac5c8e342d376bd87f3d488b86b58e4ed8a35f1d807d5bdc325adec3943b0ced"

# ── TouchDesigner ────────────────────────────────────────────────────────────
_td_url="https://download.derivative.ca/TouchDesigner.${_td_ver}.exe"

# ── DXVK 2.4 ─────────────────────────────────────────────────────────────────
_dxvk_version="2.4"
_dxvk_url="https://github.com/doitsujin/dxvk/releases/download/v${_dxvk_version}/dxvk-${_dxvk_version}.tar.gz"
_dxvk_sha256="e78a1522ef9c738a39622e331a7c12618b2f764935c30ea54f9e1f0bedb11872"

# ── Winetricks ───────────────────────────────────────────────────────────────
_winetricks_url="https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks"

source=(
    "${pkgname}-${pkgver}.tar.gz::${_repo_url}"
    "soda-${_soda_version}.tar.xz::${_soda_url}"
    "TouchDesigner.${_td_ver}.exe::${_td_url}"
    "dxvk-${_dxvk_version}.tar.gz::${_dxvk_url}"
    "winetricks::${_winetricks_url}"
)
sha256sums=(
    'SKIP'
    "${_soda_sha256}"
    'SKIP'
    "${_dxvk_sha256}"
    'SKIP'
)



build() {
    cd "${srcdir}"

    # 1. Extract Soda Wine
    msg2 "Extracting Soda Wine..."
    mkdir -p "soda-wine"
    tar -xJf "soda-${_soda_version}.tar.xz" \
        -C "soda-wine" --strip-components=1

    # 2. Extract TouchDesigner installer
    msg2 "Extracting TouchDesigner installer (7z)..."
    mkdir -p "td-7z"
    7z x "TouchDesigner.${_td_ver}.exe" -o"td-7z" -y >/dev/null 2>&1

    # Find inner Inno Setup .exe
    inner_exe=""
    for f in td-7z/*.exe; do
        if [ -f "$f" ]; then
            inner_exe="$f"
            break
        fi
    done

    if [ -z "$inner_exe" ]; then
        error "No inner installer found in TouchDesigner archive"
        exit 1
    fi

    msg2 "Extracting TouchDesigner files (innoextract)..."
    mkdir -p "td-inno"
    innoextract -d "td-inno" -e "$inner_exe" >/dev/null 2>&1

    if [ ! -d "td-inno/\$/app" ]; then
        error "Unexpected installer structure"
        exit 1
    fi

    msg2 "Setting up TouchDesigner directory..."
    mkdir -p "td"
    cp -r "td-inno/\$/app/" "td/"

    # Copy commonappdata if exists
    if [ -d "td-inno/commonappdata" ]; then
        cp -r "td-inno/commonappdata/" "td-commonappdata/"
    fi

    # 3. Extract DXVK
    msg2 "Extracting DXVK..."
    mkdir -p "dxvk"
    tar -xzf "dxvk-${_dxvk_version}.tar.gz" \
        -C "dxvk" --strip-components=1

    # 4. Prepare winetricks
    chmod +x "winetricks"
}


package() {
    cd "${srcdir}"

    # Base install dir
    local td_prefix="/opt/touchdesigner"
    local wine_dir="${td_prefix}/wine"
    local td_dir="${td_prefix}/td"
    local dxvk_dir="${td_prefix}/dxvk"
    local app_dir="${td_prefix}/app"
    local data_dir="${td_prefix}/data"

    # ── Soda Wine ──
    msg2 "Installing Soda Wine..."
    mkdir -p "${pkgdir}${wine_dir}"
    cp -r "soda-wine/"* "${pkgdir}${wine_dir}/"

    # ── TouchDesigner ──
    msg2 "Installing TouchDesigner ${_td_ver}..."
    mkdir -p "${pkgdir}${td_dir}"
    cp -r "td/"* "${pkgdir}${td_dir}/"

    # commonappdata
    if [ -d "td-commonappdata" ]; then
        mkdir -p "${pkgdir}${data_dir}/ProgramData"
        cp -r "td-commonappdata/"* "${pkgdir}${data_dir}/ProgramData/"
    fi

    # ── DXVK ──
    msg2 "Installing DXVK..."
    mkdir -p "${pkgdir}${dxvk_dir}"
    cp -r "dxvk/"* "${pkgdir}${dxvk_dir}/"

    # ── Winetricks ──
    install -Dm755 "winetricks" "${pkgdir}${td_prefix}/winetricks"

    # ── Version manifest ──
    echo "TouchDesigner ${_td_ver}" > "${pkgdir}${td_prefix}/VERSION"
    echo "Soda Wine ${_soda_version}" >> "${pkgdir}${td_prefix}/VERSION"
    echo "DXVK ${_dxvk_version}" >> "${pkgdir}${td_prefix}/VERSION"

    # ── Wrapper script ──
    msg2 "Creating wrapper..."
    mkdir -p "${pkgdir}${app_dir}"
    cat > "${pkgdir}${app_dir}/touchdesigner-wrapper.sh" << 'WRAPPER'
#!/bin/bash
# TouchDesigner launcher — first-run sets up Wine prefix, then launches TD.

TD_PREFIX="/opt/touchdesigner"
WINE_DIR="${TD_PREFIX}/wine"
TD_DIR="${TD_PREFIX}/td"
DXVK_DIR="${TD_PREFIX}/dxvk"
WINETRICKS="${TD_PREFIX}/winetricks"
DATA_DIR="${TD_PREFIX}/data"

WINE_PREFIX="${HOME}/.local/share/touchdesigner-linux/prefix"
WINE="${WINE_DIR}/bin/wine64"
WINE_BIN="${WINE_DIR}/bin"
export WINEDLLOVERRIDES="mscoree="
export WINEDEBUG="-all"
export PATH="${WINE_BIN}:${PATH}"

mkdir -p "$(dirname "${WINE_PREFIX}")"

# First-run: initialize prefix
if [ ! -f "${WINE_PREFIX}/drive_c/windows/system.reg" ]; then
    echo "TouchDesigner — First run setup"
    echo "  Initializing Wine prefix..."
    WINEPREFIX="${WINE_PREFIX}" "${WINE}" wineboot -u 2>/dev/null
    echo "  Installing DXVK (Vulkan)..."
    "${DXVK_DIR}/setup_dxvk.sh" install 2>/dev/null
    echo "  Installing core fonts..."
    WINEPREFIX="${WINE_PREFIX}" "${WINETRICKS}" -q corefonts 2>/dev/null
    echo "  Setup complete."
fi

# Restore ProgramData on each run (some TD builds expect it)
if [ -d "${DATA_DIR}/ProgramData" ]; then
    mkdir -p "${WINE_PREFIX}/drive_c/ProgramData"
    cp -r "${DATA_DIR}/ProgramData/"* "${WINE_PREFIX}/drive_c/ProgramData/" 2>/dev/null
fi

# Find TD executable
TD_EXE=""
for f in "${TD_DIR}/bin/TouchDesigner.exe" "${TD_DIR}/TouchDesigner.exe"; do
    if [ -f "$f" ]; then
        TD_EXE="$f"
        break
    fi
done

if [ -z "$TD_EXE" ]; then
    TD_EXE=$(find "${TD_DIR}" -name "TouchDesigner*.exe" -type f 2>/dev/null | head -1)
fi

if [ -z "$TD_EXE" ]; then
    echo "Error: TouchDesigner executable not found in ${TD_DIR}"
    exit 1
fi

# Launch
WINEPREFIX="${WINE_PREFIX}" "${WINE}" "${TD_EXE}" "$@"
WRAPPER
    chmod 755 "${pkgdir}${app_dir}/touchdesigner-wrapper.sh"

    # Symlink in PATH
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "${app_dir}/touchdesigner-wrapper.sh" "${pkgdir}/usr/bin/touchdesigner"

    # ── Desktop file ──
    msg2 "Creating desktop entry..."
    mkdir -p "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/touchdesigner.desktop" << DESKTOP
[Desktop Entry]
Version=1.0
Type=Application
Name=TouchDesigner ${_td_ver}
Comment=Visual development platform for real-time interactive content
Exec=${app_dir}/touchdesigner-wrapper.sh %F
Icon=/usr/share/icons/hicolor/scalable/apps/touchdesigner.svg
Terminal=false
Categories=Development;Graphics;
MimeType=application/x-touchdesigner-toe;application/x-touchdesigner-tox;
StartupNotify=true
DESKTOP

    # ── MIME XML ──
    msg2 "Creating MIME types..."
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

    # ── Icons (from Assets) ──
    msg2 "Installing icons..."
    local repo_dir="${srcdir}/TouchDesigner-Linux-${pkgver}"
    if [ -d "${repo_dir}/Assets/Icons" ]; then
        mkdir -p "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
        install -Dm644 "${repo_dir}/Assets/Icons/TouchDesigner.svg"   "${pkgdir}/usr/share/icons/hicolor/scalable/apps/touchdesigner.svg"
        install -Dm644 "${repo_dir}/Assets/Icons/TouchDesigner-toe.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/touchdesigner-toe.svg"
        install -Dm644 "${repo_dir}/Assets/Icons/TouchDesigner-tox.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/touchdesigner-tox.svg"
    fi

    # ── td-install CLI tool ──
    msg2 "Installing td-install..."
    if [ -f "${repo_dir}/td-install" ]; then
        install -Dm755 "${repo_dir}/td-install" "${pkgdir}/usr/bin/td-install"
        # Also install td_lib for td-install
        if [ -d "${repo_dir}/td_lib" ]; then
            mkdir -p "${pkgdir}/usr/share/touchdesigner-linux"
            cp -r "${repo_dir}/td_lib" "${pkgdir}/usr/share/touchdesigner-linux/td_lib"
        fi
        # Font fix file
        if [ -f "${repo_dir}/Assets/wine_ui_fixes.tox" ]; then
            install -Dm644 "${repo_dir}/Assets/wine_ui_fixes.tox" "${pkgdir}/usr/share/touchdesigner-linux/wine_ui_fixes.tox"
        fi
    fi
}

# Makepkg does not build from source, just extracts binaries
# (but the build() function processes the downloads)
