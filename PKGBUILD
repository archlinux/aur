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

    msg2 "Patching NewProject.toe templates..."
    TOE_EXP="$(find "${srcdir}/td" -type f -iname 'toeexpand.exe' -print -quit 2>/dev/null)"
    TOE_COL="$(find "${srcdir}/td" -type f -iname 'toecollapse.exe' -print -quit 2>/dev/null)"
    if [ -n "$TOE_EXP" ] && [ -n "$TOE_COL" ]; then
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
                    B=$(basename "$toe") D=$(dirname "$toe")
                    DIR="$D/${B}.dir" TOC="$D/${B}.toc" W="z:${toe}"
                    rm -rf "$DIR" "$TOC"
                    WINEPREFIX="$WINEPREFIX" wine64 "$TOE_EXP" "$W" >/dev/null 2>&1 || true
                    NEEDS=false; [ ! -d "$DIR/wine_ui_fixes" ] && NEEDS=true
                    rm -rf "$DIR" "$TOC"
                    if $NEEDS; then
                        WINEPREFIX="$WINEPREFIX" wine64 "$TOE_EXP" "$W" >/dev/null 2>&1 || true
                        [ -d "$DIR" ] && {
                            MTMP=$(mktemp -d /tmp/td_build_merge.XXXXXX)
                            cp wine_ui_fixes.tox "$MTMP/fix.tox"
                            WINEPREFIX="$WINEPREFIX" wine64 "$TOE_EXP" "z:${MTMP}/fix.tox" >/dev/null 2>&1 || true
                            [ -d "$MTMP/fix.tox.dir" ] && cp -rf "$MTMP/fix.tox.dir/"* "$DIR/"
                            rm -rf "$MTMP"
                            for entry in "${FIX_ENTS[@]}"; do echo "$entry" >> "$TOC"; done
                            WINEPREFIX="$WINEPREFIX" wine64 "$TOE_COL" "$W" >/dev/null 2>&1 || true
                        }
                        rm -rf "$DIR" "$TOC"
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
    mkdir -p "${pkgdir}${P}/backups" && chmod 777 "${pkgdir}${P}/backups"
    [ -d prefix-template ] && { msg2 "Packaging pre-made Wine prefix..."; mkdir -p "${pkgdir}${P}/default-prefix"; cp -r prefix-template/* "${pkgdir}${P}/default-prefix/" >/dev/null 2>&1; }
    { echo "TouchDesigner ${_td_ver}"; echo "Soda Wine ${_soda_version}"; echo "DXVK ${_dxvk_version}"; } > "${pkgdir}${P}/VERSION"

    msg2 "Creating wrapper..."
    mkdir -p "${pkgdir}${P}/app"
    cat > "${pkgdir}${P}/app/touchdesigner-wrapper.sh" << WRAPPER
#!/bin/bash
P="/opt/touchdesigner"
WINE="\${P}/wine/bin/wine64"
WINE_PREFIX="\${HOME}/.local/share/touchdesigner-linux/prefix"
export WINEDLLOVERRIDES="mscoree="
export WINEDEBUG="fixme-all,warn-all"
export PATH="\${P}/wine/bin:\${PATH}"
export LD_LIBRARY_PATH="\${P}/wine/lib:\${P}/wine/lib64:\${LD_LIBRARY_PATH:-}"

mkdir -p "\$(dirname "\${WINE_PREFIX}")"

if [ ! -f "\${WINE_PREFIX}/drive_c/windows/system.reg" ] && [ -d "\${P}/default-prefix" ]; then
    echo "TouchDesigner - Setting up..."
    mkdir -p "\${WINE_PREFIX}" && cp -r "\${P}/default-prefix/"* "\${WINE_PREFIX}/" 2>/dev/null
fi

if [ -d "\${P}/data/ProgramData" ]; then
    mkdir -p "\${WINE_PREFIX}/drive_c/ProgramData"
    cp -r "\${P}/data/ProgramData/"* "\${WINE_PREFIX}/drive_c/ProgramData/" 2>/dev/null
fi

# If .toe file passed: patch it with Python td_lib, then open with TD
if [ -f "\$1" ] && [[ "\$1" == *.toe ]]; then
    python3 -c "
import sys, os
sys.path.insert(0, '/usr/share/touchdesigner-linux')
os.environ['WINE'] = '\${P}/wine/bin/wine64'
os.environ['WINEPREFIX'] = '\${WINE_PREFIX}'
os.environ['WINEDLLOVERRIDES'] = 'mscoree='
# Patch the .toe file
TOE_EXPAND = os.path.join("/opt/touchdesigner", "td/bin/toeexpand.exe")
TOE_COLLAPSE = os.path.join("/opt/touchdesigner", "td/bin/toecollapse.exe")
FIX_FILE = "/opt/touchdesigner/wine_ui_fixes.tox"
import subprocess, tempfile, shutil
if os.path.exists(TOE_EXPAND) and os.path.exists(TOE_COLLAPSE) and os.path.exists(FIX_FILE):
    toe = sys.argv[1]
    toe_dir = toe + '.dir'
    toe_toc = toe + '.toc'
    shutil.rmtree(toe_dir, True); shutil.rmtree(toe_toc, True)
    subprocess.run(['wine64', TOE_EXPAND, 'z:' + toe], capture_output=True, env=os.environ)
    needs = not os.path.isdir(os.path.join(toe_dir, 'wine_ui_fixes'))
    shutil.rmtree(toe_dir, True); shutil.rmtree(toe_toc, True)
    if needs:
        subprocess.run(['wine64', TOE_EXPAND, 'z:' + toe], capture_output=True, env=os.environ)
        if os.path.isdir(toe_dir):
            t = tempfile.mkdtemp(prefix='td_patch_')
            shutil.copy2(FIX_FILE, os.path.join(t, 'fix.tox'))
            subprocess.run(['wine64', TOE_EXPAND, 'z:' + os.path.join(t, 'fix.tox')], capture_output=True, env=os.environ)
            fix_dir = os.path.join(t, 'fix.tox.dir')
            if os.path.isdir(fix_dir):
                for f in os.listdir(fix_dir):
                    dst = os.path.join(toe_dir, f)
                    if os.path.isdir(os.path.join(fix_dir, f)):
                        shutil.copytree(os.path.join(fix_dir, f), dst, dirs_exist_ok=True)
                    else:
                        shutil.copy2(os.path.join(fix_dir, f), dst)
            shutil.rmtree(t, True)
            subprocess.run(['wine64', TOE_COLLAPSE, 'z:' + toe], capture_output=True, env=os.environ)
            shutil.rmtree(toe_dir, True); shutil.rmtree(toe_toc, True)
" "$1" 2>/dev/null || true
fi

TD_EXE="" && for f in "\${P}/td/bin/TouchDesigner.exe" "\${P}/td/TouchDesigner.exe"; do [ -f "\$f" ] && { TD_EXE="\$f"; break; }; done
[ -z "\$TD_EXE" ] && TD_EXE=\$(find "\${P}/td" -name 'TouchDesigner*.exe' -type f 2>/dev/null | head -1)
[ -z "\$TD_EXE" ] && { echo "Error: TouchDesigner not found"; exit 1; }
WINEPREFIX="\${WINE_PREFIX}" "\${WINE}" "\${TD_EXE}" "\$@"
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
