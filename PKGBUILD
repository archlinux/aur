# Maintainer: Nertwork <admin@nertwork.com>
# Contributor: Topaz <topazRN@protonmail.com>
# Contributor: Josh <joshring@gmail.com>
pkgname=bluebubbles-beta-bin
_pkgname=BlueBubbles
pkgver=2.1.3+desktop.93
_tagver="2.1.3%2Bdesktop.93"
pkgrel=2
pkgdesc="A cross-platform app ecosystem, bringing iMessage to Linux, Android, and Windows (Beta Prebuilt Release)"
arch=('x86_64' 'aarch64')
url="https://bluebubbles.app/"
_ghurl="https://github.com/BlueBubblesApp/bluebubbles-app"
license=('Apache-2.0')
provides=("bluebubbles-beta=${pkgver}" "bluebubbles")
conflicts=("bluebubbles" "bluebubbles-bin" "bluebubbles-git")
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
    'gendesk'
    'patchelf'
    'python'
)
options=(
    '!emptydirs'
    '!strip'
)
source_x86_64=("bluebubbles-beta-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${_tagver}/bluebubbles-linux-x86_64.tar.gz")
source_aarch64=("bluebubbles-beta-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${_tagver}/bluebubbles-linux-aarch64.tar.gz")
source=("bluebubbles-beta.sh")
sha256sums=('efe4503308a1e4e44b892065b6fb8f582bd2f7d01e3f0232e4d86539101ebbb5')
sha256sums_x86_64=('a9ed17847b7f068b1b79610d2fa39a986a1bf452fda3ffea97572a516986b668')
sha256sums_aarch64=('190c223a77db0404d76d4a189e5bdee36475d4988ea9c5fb1bf36b66844a2491')

prepare() {
    sed -i -e "
        s/@appname@/bluebubbles-beta/g
        s/@runname@/bluebubbles-beta/g
    " "${srcdir}/bluebubbles-beta.sh"
    gendesk -f -n -q \
        --pkgname="bluebubbles-beta" \
        --pkgdesc="${pkgdesc}" \
        --categories="Network" \
        --name="${_pkgname} Beta" \
        --custom="StartupWMClass=bluebubbles" \
        --exec="bluebubbles-beta %U"
}

package() {
    install -Dm755 "${srcdir}/bluebubbles-beta.sh" "${pkgdir}/usr/bin/bluebubbles-beta"
    ln -sf "/usr/bin/bluebubbles-beta" "${pkgdir}/usr/bin/bluebubbles"
    install -Dm755 "${srcdir}/bluebubbles" "${pkgdir}/usr/lib/bluebubbles-beta/bluebubbles-beta.real"
    cat <<'EOF' > "${pkgdir}/usr/lib/bluebubbles-beta/bluebubbles-beta"
#!/usr/bin/env bash
export GDK_BACKEND=x11
export GDK_SCALE="${GDK_SCALE:-2}"
export GTK_IM_MODULE=simple

# Populate NotoColorEmoji.ttf as apple.ttf for Skia color emoji rendering
_BB_FONT_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/app.bluebubbles.BlueBubbles/font"
mkdir -p "${_BB_FONT_DIR}" 2>/dev/null || true
chmod 0755 "${_BB_FONT_DIR}" 2>/dev/null || true
if [ ! -s "${_BB_FONT_DIR}/apple.ttf" ] && [ -f /usr/share/fonts/noto/NotoColorEmoji.ttf ]; then
    cp -f /usr/share/fonts/noto/NotoColorEmoji.ttf "${_BB_FONT_DIR}/apple.ttf" 2>/dev/null || true
fi

if command -v prime-run >/dev/null 2>&1; then
    exec prime-run "/usr/lib/bluebubbles-beta/bluebubbles-beta.real" --class=bluebubbles "$@"
else
    exec -a bluebubbles "/usr/lib/bluebubbles-beta/bluebubbles-beta.real" --class=bluebubbles "$@"
fi
EOF
    chmod 755 "${pkgdir}/usr/lib/bluebubbles-beta/bluebubbles-beta"
    cp -r --no-preserve=ownership "${srcdir}/"{data,lib} "${pkgdir}/usr/lib/bluebubbles-beta"

    # Fix bundled objectbox RPATH leaking CI runner build directory
    if [ -f "${pkgdir}/usr/lib/bluebubbles-beta/lib/libobjectbox.so" ]; then
        patchelf --set-rpath '$ORIGIN' "${pkgdir}/usr/lib/bluebubbles-beta/lib/libobjectbox.so"
    fi

    # Patch FlKeyEmbedderResponder in libflutter_linux_gtk.so (aarch64 & x86_64):
    # 1. Disable init_lock_bit_table (ret) so NumLock/CapsLock never get stuck in pressing_records.
    # 2. Map Meta modifier entry in init_modifier_bit_table to X11 Mod4Mask (0x40) and
    #    LogicalKeyboardKey.superKey (0x10000010e) so Super_L (0x700e3) is automatically
    #    released by synchronize_pressed_states after WM workspace/window switches.
    if [ -f "${pkgdir}/usr/lib/bluebubbles-beta/lib/libflutter_linux_gtk.so" ]; then
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
' "${pkgdir}/usr/lib/bluebubbles-beta/lib/libflutter_linux_gtk.so"
    fi

    install -Dm644 "${srcdir}/data/flutter_assets/assets/icon/icon.png" "${pkgdir}/usr/share/pixmaps/bluebubbles-beta.png"
    ln -sf "bluebubbles-beta.png" "${pkgdir}/usr/share/pixmaps/bluebubbles.png"
    ln -sf "/usr/lib/libmpv.so" "${pkgdir}/usr/lib/bluebubbles-beta/libmpv.so.1"
    install -Dm644 "${srcdir}/bluebubbles-beta.desktop" -t "${pkgdir}/usr/share/applications"
}
