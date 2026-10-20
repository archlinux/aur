# Maintainer: Nertwork <admin@nertwork.com>
pkgname=bluebubbles-desktop-app
_pkgname=BlueBubbles
pkgver=2.1.3+desktop.93
_tagver="2.1.3+desktop.93"
pkgrel=4
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

    # Patch libmedia_kit_video_plugin.so on aarch64 so portrait videos (w < h, e.g. 720x1280)
    # multiply before dividing ((w * 1080) // h instead of (w // h) * 1080 = 0)
    if [[ "$CARCH" == "aarch64" ]] && [ -f "${pkgdir}/usr/lib/${pkgname}/lib/libmedia_kit_video_plugin.so" ]; then
        python3 -c '
import struct, sys
p = sys.argv[1]
with open(p, "rb") as f:
    d = f.read()
w_old = struct.pack("<III", 2596801544, 1384154889, 2601090304)
w_new = struct.pack("<III", 1384154889, 2601090048, 2596801536)
h_old = struct.pack("<III", 2596801544, 3547713801, 3406306592)
h_new = struct.pack("<III", 1384181769, 2601090048, 2596801536)
d = d.replace(w_old, w_new, 1).replace(h_old, h_new, 1)
with open(p, "wb") as f:
    f.write(d)
' "${pkgdir}/usr/lib/${pkgname}/lib/libmedia_kit_video_plugin.so"
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

# Stage runtime binary in XDG_RUNTIME_DIR so pacman upgrades never leave /proc/self/exe
# pointing to a '(deleted)' inode (which breaks Dart GlobalIsolate / package_info_plus)
_BB_RT_DIR="\${XDG_RUNTIME_DIR:-/tmp}/${pkgname}-\${UID}"
mkdir -p "\${_BB_RT_DIR}" 2>/dev/null || true
ln -sfn "/usr/lib/${pkgname}/data" "\${_BB_RT_DIR}/data"
ln -sfn "/usr/lib/${pkgname}/lib" "\${_BB_RT_DIR}/lib"
cp -f "/usr/lib/${pkgname}/bluebubbles" "\${_BB_RT_DIR}/bluebubbles.new" 2>/dev/null && \\
    mv -f "\${_BB_RT_DIR}/bluebubbles.new" "\${_BB_RT_DIR}/bluebubbles" 2>/dev/null || true
if [ -f /usr/lib/libmpv.so.2 ]; then
    if [ ! -f "\${_BB_RT_DIR}/libmpv.so.2" ] || [ /usr/lib/libmpv.so.2 -nt "\${_BB_RT_DIR}/libmpv.so.2" ]; then
        cp -f /usr/lib/libmpv.so.2 "\${_BB_RT_DIR}/libmpv.so.2.tmp" 2>/dev/null || true
        chmod 755 "\${_BB_RT_DIR}/libmpv.so.2.tmp" 2>/dev/null || true
        python3 - "\${_BB_RT_DIR}/libmpv.so.2.tmp" <<'PYEOF' 2>/dev/null || true
import struct, sys
p = sys.argv[1]
with open(p, "rb") as f:
    d = bytearray(f.read())
desc_off = d.find(b"render API for libmpv\x00")
if desc_off >= 0:
    target = struct.pack("<II", 0, 65)
    idx = 0
    while True:
        idx = d.find(target, idx)
        if idx < 0:
            break
        if idx + 24 <= len(d) and struct.unpack_from("<Q", d, idx + 16)[0] == desc_off:
            struct.pack_into("<II", d, idx, 0, 64)
        idx += 4
    with open(p, "wb") as f:
        f.write(d)
PYEOF
        mv -f "\${_BB_RT_DIR}/libmpv.so.2.tmp" "\${_BB_RT_DIR}/libmpv.so.2" 2>/dev/null || true
    fi
    ln -sf libmpv.so.2 "\${_BB_RT_DIR}/libmpv.so.1"
    ln -sf libmpv.so.2 "\${_BB_RT_DIR}/libmpv.so"
else
    ln -sfn "/usr/lib/${pkgname}/libmpv.so.1" "\${_BB_RT_DIR}/libmpv.so.1"
fi
export LD_LIBRARY_PATH="\${_BB_RT_DIR}:/usr/lib/${pkgname}/lib\${LD_LIBRARY_PATH:+:\$LD_LIBRARY_PATH}"
_BB_BIN="\${_BB_RT_DIR}/bluebubbles"
[ -x "\${_BB_BIN}" ] || _BB_BIN="/usr/lib/${pkgname}/bluebubbles"

if command -v prime-run >/dev/null 2>&1; then
    exec prime-run "\${_BB_BIN}" --class=bluebubbles "\$@"
else
    exec -a bluebubbles "\${_BB_BIN}" --class=bluebubbles "\$@"
fi
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"
    ln -sf "/usr/bin/${pkgname}" "${pkgdir}/usr/bin/bluebubbles"

    # Install systemd user service and upgrade watcher units
    install -dm755 "${pkgdir}/usr/lib/systemd/user"
    cat <<EOF > "${pkgdir}/usr/lib/systemd/user/bluebubbles.service"
[Unit]
Description=BlueBubbles
Documentation=https://bluebubbles.app/
After=graphical-session.target

[Service]
Type=simple
ExecStart=/usr/bin/${pkgname}
Restart=on-failure
RestartSec=3

[Install]
WantedBy=graphical-session.target
EOF
    cat <<EOF > "${pkgdir}/usr/lib/systemd/user/bluebubbles-upgrade-watcher.path"
[Unit]
Description=Watch BlueBubbles binary for package upgrades and restart bluebubbles.service

[Path]
PathChanged=/usr/lib/${pkgname}/bluebubbles
Unit=bluebubbles-upgrade-watcher.service

[Install]
WantedBy=default.target graphical-session.target
EOF
    cat <<'EOF' > "${pkgdir}/usr/lib/systemd/user/bluebubbles-upgrade-watcher.service"
[Unit]
Description=Restart bluebubbles.service after package upgrade to prevent deleted /proc/self/exe

[Service]
Type=oneshot
ExecStart=/usr/bin/systemctl --user try-restart bluebubbles.service
EOF

    # Setup icon and symlink libmpv
    install -Dm644 "assets/icon/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    ln -sf "/usr/lib/libmpv.so" "${pkgdir}/usr/lib/${pkgname}/libmpv.so.1"

    # Install desktop launcher
    install -Dm644 "../${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
