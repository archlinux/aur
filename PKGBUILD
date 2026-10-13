# Maintainer: Custom Source Builder <custom at aur dot archlinux dot org>
pkgname=bluebubbles-desktop-app
_pkgname=BlueBubbles
pkgver=2.1.2+92
_tagver="2.1.2+92"
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
    'gtk3'
)
makedepends=(
    'flutter'
    'cmake'
    'ninja'
    'pkg-config'
    'clang'
    'gendesk'
    'git'
)
options=(
    '!emptydirs'
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

    # Launcher wrapper script
    install -d "${pkgdir}/usr/bin"
    cat <<EOF > "${pkgdir}/usr/bin/${pkgname}"
#!/bin/bash
export GDK_BACKEND=x11
export GTK_IM_MODULE=simple
export LD_LIBRARY_PATH="/usr/lib/${pkgname}/lib:\${LD_LIBRARY_PATH}"

# Disable 45MB Apple Color Emoji font to prevent per-keystroke regex & font-shaping stalls on Linux
_BB_FONT_DIR="\${XDG_DATA_HOME:-\$HOME/.local/share}/app.bluebubbles.BlueBubbles/font"
if [ -f "\${_BB_FONT_DIR}/apple.ttf" ] || [ -w "\${_BB_FONT_DIR}" ] || [ ! -d "\${_BB_FONT_DIR}" ]; then
    chmod u+w "\${_BB_FONT_DIR}" 2>/dev/null || true
    rm -rf "\${_BB_FONT_DIR}/apple.ttf"
    mkdir -p "\${_BB_FONT_DIR}" 2>/dev/null || true
    chmod 0555 "\${_BB_FONT_DIR}" 2>/dev/null || true
fi

if command -v prime-run >/dev/null 2>&1; then
    exec prime-run "/usr/lib/${pkgname}/bluebubbles" "\$@"
else
    exec "/usr/lib/${pkgname}/bluebubbles" "\$@"
fi
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # Setup icon and symlink libmpv
    install -Dm644 "assets/icon/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    ln -sf "/usr/lib/libmpv.so" "${pkgdir}/usr/lib/${pkgname}/libmpv.so.1"

    # Install desktop launcher
    install -Dm644 "../${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
