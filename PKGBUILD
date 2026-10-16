# Maintainer: Nertwork <admin@nertwork.com>
pkgname=bluebubbles-desktop-app
_pkgname=BlueBubbles
pkgver=2.1.3+desktop.93
_tagver="2.1.3+desktop.93"
pkgrel=2
pkgdesc="A cross-platform app ecosystem, bringing iMessage to Linux, Android, and Windows (Beta Release, Compiled From Source)"
arch=('x86_64' 'aarch64')
url="https://bluebubbles.app/"
_ghurl="https://github.com/BlueBubblesApp/bluebubbles-app"
license=('Apache-2.0')
provides=("bluebubbles-desktop-app=${pkgver}" "bluebubbles")
conflicts=("bluebubbles" "bluebubbles-bin" "bluebubbles-beta-bin")
depends=(
    'webkit2gtk-4.1'
    'gdk-pixbuf2'
    'mpv'
    'libdbusmenu-glib'
    'libnotify'
    'libappindicator-gtk3'
    'libayatana-indicator'
    'libayatana-appindicator'
    'libepoxy'
    'fontconfig'
    'noto-fonts-emoji'
    'gtk3'
)
makedepends=(
    'flutter'
    'cmake'
    'ninja'
    'pkg-config'
    'clang'
    'gendesk'
    'patchelf'
    'python'
    'git'
)
options=(
    '!emptydirs'
    '!strip'
)
source=("${pkgname}::git+${_ghurl}.git#tag=v${_tagver}")
sha256sums=('SKIP')

prepare() {
    # Generate desktop entry
    gendesk -f -n -q \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Network" \
        --name="${_pkgname} Beta (Source)" \
        --custom="StartupWMClass=bluebubbles" \
        --exec="${pkgname} %U"

    # Patch out redundant per-keystroke notifyListeners() when spellcheck is disabled
    sed -i '/if (!SettingsSvc.settings.spellcheck.value || newText.isEmpty) {/,/return;/ {
        s/_mistakes.clear();/final hadMistakes = _mistakes.isNotEmpty; _mistakes.clear();/
        s/notifyListeners();/if (hadMistakes) notifyListeners();/
    }' "${srcdir}/${pkgname}/lib/app/components/custom_text_editing_controllers.dart"

    # Gate per-30s contact refresh behind syncContactsAutomatically setting
    sed -i 's/final contactSyncResult = await performContactSyncToHandles();/final contactSyncResult = SettingsSvc.settings.syncContactsAutomatically.value ? await performContactSyncToHandles() : true;/' \
        "${srcdir}/${pkgname}/lib/services/backend/sync/sync_service.dart"
}

build() {
    cd "${pkgname}"
    flutter pub get
    flutter build linux --release
}

package() {
    cd "${pkgname}"

    # Create target directories
    install -d "${pkgdir}/usr/lib/${pkgname}"

    # Copy compiled bundle assets based on target architecture
    if [ "${CARCH}" = "aarch64" ]; then
        cp -r build/linux/arm64/release/bundle/* "${pkgdir}/usr/lib/${pkgname}/"
    else
        cp -r build/linux/x64/release/bundle/* "${pkgdir}/usr/lib/${pkgname}/"
    fi

    # Fix bundled objectbox RPATH leaking build directory
    if [ -f "${pkgdir}/usr/lib/${pkgname}/lib/libobjectbox.so" ]; then
        patchelf --set-rpath '$ORIGIN' "${pkgdir}/usr/lib/${pkgname}/lib/libobjectbox.so"
    fi

    # Patch FlKeyEmbedderResponder in libflutter_linux_gtk.so (aarch64 & x86_64):
    # 1. Disable init_lock_bit_table (ret) so NumLock/CapsLock never get stuck in pressing_records.
    # 2. Map Meta modifier entry in init_modifier_bit_table to X11 Mod4Mask (0x40) and
    #    LogicalKeyboardKey.superKey (0x10000010e) so Super_L (0x700e3) is automatically
    #    released by synchronize_pressed_states after WM workspace/window switches.
    if [ -f "${pkgdir}/usr/lib/${pkgname}/lib/libflutter_linux_gtk.so" ]; then
        python3 -c '
import re, sys
p = sys.argv[1]
with open(p, "rb") as f:
    d = bytearray(f.read())

# aarch64: 1. init_lock_bit_table -> ret (c0035fd6)
m = re.search(bytes.fromhex("fd7bbea9f44f01a9fd030091f30300aa00048052") + b"...." + bytes.fromhex("f40300aae00313aa41008052"), d, re.DOTALL)
if m:
    d[m.start():m.start()+4] = bytes.fromhex("c0035fd6")

# aarch64: 2. init_modifier_bit_table Meta mask -> 0x40 (Mod4Mask)
m = re.search(bytes.fromhex("0100a252e20314aa"), d, re.DOTALL)
if m:
    d[m.start():m.start()+4] = bytes.fromhex("01088052")

# aarch64: 3. rodata Meta primary_logical_key -> 0x10000010e (superKey)
m = re.search(bytes.fromhex("e3000700000000000601000002000000"), d, re.DOTALL)
if m:
    d[m.start()+8:m.start()+16] = bytes.fromhex("0e01000001000000")

# x86_64: 1. init_lock_bit_table -> retq (c3)
m = re.search(bytes.fromhex("41574156534889fbbf20000000e8") + b"...." + bytes.fromhex("4989c6be02000000"), d, re.DOTALL)
if m:
    d[m.start():m.start()+1] = bytes.fromhex("c3")

# x86_64: 2. init_modifier_bit_table Meta mask (0x40) and superKey (0x10000010e)
m = re.search(bytes.fromhex("be000000104889df4889c2e8") + b"...." + bytes.fromhex("41c646180049c706e3000700498d4706498946084983cf074d897e10"), d, re.DOTALL)
if m:
    d[m.start():m.start()+5] = bytes.fromhex("be40000000")
    d[m.end()-16:m.end()] = bytes.fromhex("b8870000804801c04989460849894610")

with open(p, "wb") as f:
    f.write(d)
' "${pkgdir}/usr/lib/${pkgname}/lib/libflutter_linux_gtk.so"
    fi

    # Launcher wrapper script
    install -d "${pkgdir}/usr/bin"
    cat <<EOF > "${pkgdir}/usr/bin/${pkgname}"
#!/usr/bin/env bash
export GDK_BACKEND=x11
export GDK_SCALE="\${GDK_SCALE:-2}"
export GTK_IM_MODULE=simple
export LD_LIBRARY_PATH="/usr/lib/${pkgname}/lib:\${LD_LIBRARY_PATH:-}"

# Populate NotoColorEmoji.ttf as apple.ttf for Skia color emoji rendering
_BB_FONT_DIR="\${XDG_DATA_HOME:-\$HOME/.local/share}/app.bluebubbles.BlueBubbles/font"
mkdir -p "\${_BB_FONT_DIR}" 2>/dev/null || true
chmod 0755 "\${_BB_FONT_DIR}" 2>/dev/null || true
if [ ! -s "\${_BB_FONT_DIR}/apple.ttf" ] && [ -f /usr/share/fonts/noto/NotoColorEmoji.ttf ]; then
    cp -f /usr/share/fonts/noto/NotoColorEmoji.ttf "\${_BB_FONT_DIR}/apple.ttf" 2>/dev/null || true
fi

if command -v prime-run >/dev/null 2>&1; then
    exec prime-run "/usr/lib/${pkgname}/bluebubbles" --class=bluebubbles "\$@"
else
    exec -a bluebubbles "/usr/lib/${pkgname}/bluebubbles" --class=bluebubbles "\$@"
fi
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"
    ln -sf "/usr/bin/${pkgname}" "${pkgdir}/usr/bin/bluebubbles"

    # Setup icon and symlink libmpv
    install -Dm644 "assets/icon/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    ln -sf "/usr/lib/libmpv.so" "${pkgdir}/usr/lib/${pkgname}/libmpv.so.1"

    # Install desktop launcher
    install -Dm644 "../${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
