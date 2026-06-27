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
makedepends=('innoextract')
optdepends=('nvidia-utils: NVIDIA GPU acceleration')
provides=("${pkgname}-${pkgver}")
conflicts=()
replaces=()

# ── URLs ────────────────────────────────────────────────────────────────────
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

# ── Build ────────────────────────────────────────────────────────────────────

build() {
    cd "${srcdir}"

    # The TouchDesigner .exe is a 7z SFX archive. bsdtar (called by makepkg
    # during source extraction) already extracts the 7z payload, so files like
    # setup.exe, setup.1, setup.2, etc. are already in $srcdir.
    #
    # We find the inner Inno Setup exe and extract it with innoextract.

    # 1. TouchDesigner
    msg2 "Extracting TouchDesigner..."
    local inner_exe=""
    for f in *.exe; do
        if [ -f "$f" ] && [ "$f" != "TouchDesigner.${_td_ver}.exe" ]; then
            inner_exe="$f"
            break
        fi
    done

    if [ -z "$inner_exe" ]; then
        # Inner exe not found — try 7z on the main exe
        msg2 "Trying 7z extraction..."
        7z x "TouchDesigner.${_td_ver}.exe" -o"td-7z" -y >/dev/null 2>&1
        for f in td-7z/*.exe; do
            if [ -f "$f" ]; then
                inner_exe="$f"
                break
            fi
        done
    fi

    if [ -z "$inner_exe" ]; then
        error "No inner installer found in TouchDesigner archive"
        exit 1
    fi

    msg2 "Innoextracting: ${inner_exe}..."
    mkdir -p td-inno
    innoextract -d td-inno -e "$inner_exe" >/dev/null 2>&1

    if [ ! -d "td-inno/\$/app" ]; then
        error "Unexpected installer structure"
        ls td-inno/ 2>/dev/null
        exit 1
    fi

    mkdir -p td
    cp -r "td-inno/\$/app/" td/

    if [ -d "td-inno/commonappdata" ]; then
        cp -r "td-inno/commonappdata/" td-commonappdata/
    fi

    # 2. Soda Wine
    msg2 "Extracting Soda Wine..."
    mkdir -p soda-wine
    tar -xJf "soda-${_soda_version}.tar.xz" -C soda-wine --strip-components=1

    # 3. DXVK
    msg2 "Extracting DXVK..."
    mkdir -p dxvk
    tar -xzf "dxvk-${_dxvk_version}.tar.gz" -C dxvk --strip-components=1

    # 4. Winetricks
    chmod +x winetricks
}

# ── Package ──────────────────────────────────────────────────────────────────

package() {
    cd "${srcdir}"
    local repo_dir="${srcdir}/TouchDesigner-Linux-${pkgver}"
    local prefix="/opt/touchdesigner"

    # ── Soda Wine ──
    msg2 "Installing Soda Wine..."
    mkdir -p "${pkgdir}${prefix}/wine"
    cp -r soda-wine/* "${pkgdir}${prefix}/wine/"

    # ── TouchDesigner ──
    msg2 "Installing TouchDesigner ${_td_ver}..."
    mkdir -p "${pkgdir}${prefix}/td"
    cp -r td/* "${pkgdir}${prefix}/td/"

    if [ -d td-commonappdata ]; then
        mkdir -p "${pkgdir}${prefix}/data/ProgramData"
        cp -r td-commonappdata/* "${pkgdir}${prefix}/data/ProgramData/"
    fi

    # ── DXVK ──
    msg2 "Installing DXVK..."
    mkdir -p "${pkgdir}${prefix}/dxvk"
    cp -r dxvk/* "${pkgdir}${prefix}/dxvk/"

    # ── Winetricks ──
    install -Dm755 winetricks "${pkgdir}${prefix}/winetricks"

    # ── Version manifest ──
    {
        echo "TouchDesigner ${_td_ver}"
        echo "Soda Wine ${_soda_version}"
        echo "DXVK ${_dxvk_version}"
    } > "${pkgdir}${prefix}/VERSION"

    # ── Wrapper script ──
    msg2 "Creating wrapper..."
    mkdir -p "${pkgdir}${prefix}/app"
    cat > "${pkgdir}${prefix}/app/touchdesigner-wrapper.sh" << 'WRAPPER'
#!/bin/bash
# TouchDesigner launcher — first-run sets up Wine prefix, then launches.

PREFIX="/opt/touchdesigner"
WINE="${PREFIX}/wine/bin/wine64"
TD_DIR="${PREFIX}/td"
DXVK_DIR="${PREFIX}/dxvk"
WINETRICKS="${PREFIX}/winetricks"
DATA_DIR="${PREFIX}/data"
WINE_PREFIX="${HOME}/.local/share/touchdesigner-linux/prefix"

export WINEDLLOVERRIDES="mscoree="
export WINEDEBUG="-all"
export PATH="${PREFIX}/wine/bin:${PATH}"
export LD_LIBRARY_PATH="${PREFIX}/wine/lib:${PREFIX}/wine/lib64:${LD_LIBRARY_PATH:-}"

mkdir -p "$(dirname "${WINE_PREFIX}")"

# First-run
if [ ! -f "${WINE_PREFIX}/drive_c/windows/system.reg" ]; then
    echo "TouchDesigner — First run setup"
    echo "  Initializing Wine prefix..."
    WINEPREFIX="${WINE_PREFIX}" "${WINE}" wineboot -u 2>/dev/null
    echo "  Installing DXVK..."
    "${DXVK_DIR}/setup_dxvk.sh" install 2>/dev/null
    echo "  Installing core fonts..."
    WINEPREFIX="${WINE_PREFIX}" "${WINETRICKS}" -q corefonts 2>/dev/null
    echo "  Setup complete."
fi

# ProgramData
if [ -d "${DATA_DIR}/ProgramData" ]; then
    mkdir -p "${WINE_PREFIX}/drive_c/ProgramData"
    cp -r "${DATA_DIR}/ProgramData/"* "${WINE_PREFIX}/drive_c/ProgramData/" 2>/dev/null
fi

# Find TD exe
TD_EXE=""
for f in "${TD_DIR}/bin/TouchDesigner.exe" "${TD_DIR}/TouchDesigner.exe"; do
    [ -f "$f" ] && { TD_EXE="$f"; break; }
done
if [ -z "$TD_EXE" ]; then
    TD_EXE=$(find "${TD_DIR}" -name 'TouchDesigner*.exe' -type f 2>/dev/null | head -1)
fi
if [ -z "$TD_EXE" ]; then
    echo "Error: TouchDesigner not found in ${TD_DIR}"
    exit 1
fi

WINEPREFIX="${WINE_PREFIX}" "${WINE}" "${TD_EXE}" "$@"
WRAPPER
    chmod 755 "${pkgdir}${prefix}/app/touchdesigner-wrapper.sh"

    # Symlink
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "${prefix}/app/touchdesigner-wrapper.sh" "${pkgdir}/usr/bin/touchdesigner"

    # ── Desktop file ──
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

    # ── MIME XML ──
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

    # ── Icons ──
    msg2 "Installing icons..."
    if [ -d "${repo_dir}/Assets/Icons" ]; then
        install -Dm644 "${repo_dir}/Assets/Icons/TouchDesigner.svg" \
            "${pkgdir}/usr/share/icons/hicolor/scalable/apps/touchdesigner.svg"
        install -Dm644 "${repo_dir}/Assets/Icons/TouchDesigner-toe.svg" \
            "${pkgdir}/usr/share/icons/hicolor/scalable/apps/touchdesigner-toe.svg"
        install -Dm644 "${repo_dir}/Assets/Icons/TouchDesigner-tox.svg" \
            "${pkgdir}/usr/share/icons/hicolor/scalable/apps/touchdesigner-tox.svg"
    fi

    # ── td-install ──
    msg2 "Installing td-install..."
    if [ -f "${repo_dir}/td-install" ]; then
        install -Dm755 "${repo_dir}/td-install" "${pkgdir}/usr/bin/td-install"
        mkdir -p "${pkgdir}/usr/share/touchdesigner-linux"
        cp -r "${repo_dir}/td_lib" "${pkgdir}/usr/share/touchdesigner-linux/"
        if [ -f "${repo_dir}/Assets/wine_ui_fixes.tox" ]; then
            install -Dm644 "${repo_dir}/Assets/wine_ui_fixes.tox" \
                "${pkgdir}/usr/share/touchdesigner-linux/wine_ui_fixes.tox"
        fi
    fi
}
