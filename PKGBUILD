# Maintainer: patrickjaja <patrickjajaa@gmail.com>
# Contributor: Claude Desktop Linux Community
# AUR Package Repository: https://github.com/patrickjaja/claude-desktop-bin

pkgname=claude-desktop-bin
pkgver=1.3883.0
pkgrel=3
pkgdesc="Claude Desktop - Linux (unofficial, from official binary)"
arch=('x86_64')
url="https://github.com/patrickjaja/claude-desktop-bin"
license=('custom:Claude')
depends=('alsa-lib' 'gtk3' 'nss')
makedepends=('unzip')
optdepends=('nodejs: System Node.js for MCP extensions that require specific versions (Electron bundles Node.js as fallback)'
            'claude-code: Claude Code CLI for agentic coding features (npm i -g @anthropic-ai/claude-code)'
            'claude-cowork-service: Enables Cowork VM features on Linux'
            'xdotool: Computer Use input (X11), cursor reading + XWayland fallback (Wayland), Quick Entry positioning'
            'scrot: Computer Use screenshots (X11)'
            'imagemagick: Computer Use screenshot fallback and crop (import/convert)'
            'wmctrl: Computer Use running app detection (X11)'
            'ydotool: Computer Use input automation (all Wayland compositors — requires ydotoold daemon running, v1.0+)'
            'grim: Computer Use screenshots (Wayland/wlroots — Sway, Hyprland)'
            'jq: Computer Use window queries on Sway (used with swaymsg)'
            'spectacle: Computer Use screenshots (KDE Plasma Wayland)'
            'glib2: Computer Use screenshots on GNOME Wayland (gdbus for D-Bus)'
            'python-gobject: Portal screenshots on GNOME Wayland 46+ — no repeated permission dialogs'
            'gst-plugin-pipewire: Portal screenshot PipeWire frame capture on GNOME Wayland 46+'
            'gnome-screenshot: Computer Use screenshot fallback (GNOME)'
            'hyprland: Quick Entry cursor positioning on Hyprland Wayland (hyprctl)'
            'socat: Faster Quick Entry toggle via socket (~2ms vs ~25ms python3 — not required)')
provides=('claude-desktop')
conflicts=('claude-desktop')
_electron_ver=41.3.0
source_x86_64=("claude-desktop-${pkgver}-${pkgrel}-linux.tar.gz::https://github.com/patrickjaja/claude-desktop-bin/releases/download/v1.3883.0-3/claude-desktop-1.3883.0-linux.tar.gz" "electron-v${_electron_ver}-linux-x64.zip::https://github.com/electron/electron/releases/download/v${_electron_ver}/electron-v${_electron_ver}-linux-x64.zip")
sha256sums_x86_64=('57afa79c49d9abcd53b556d0e6a8c8397eaad3582737cfaff95e852c54bf5718' 'SKIP')
options=('!strip')

package() {
    cd "$srcdir"

    # Install bundled Electron runtime
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    unzip -q "$srcdir/electron-v${_electron_ver}-linux-x64.zip" -d "$pkgdir/usr/lib/$pkgname"

    # Rename the Electron binary to APP_ID. Electron reads /proc/self/exe for
    # Wayland app_id / X11 WM_CLASS, so the binary name must match the .desktop
    # StartupWMClass.
    mv "$pkgdir/usr/lib/$pkgname/electron" \
       "$pkgdir/usr/lib/$pkgname/com.anthropic.claude-desktop"

    # Set SUID on chrome-sandbox (required by Chromium's sandbox)
    if [ -f "$pkgdir/usr/lib/$pkgname/chrome-sandbox" ]; then
        chmod 4755 "$pkgdir/usr/lib/$pkgname/chrome-sandbox"
    fi

    # Install application files (pre-patched) into Electron's resources directory
    cp -r app/* "$pkgdir/usr/lib/$pkgname/resources/"

    # Install launcher script (Wayland/X11 detection, env setup, lock cleanup)
    install -Dm755 "$srcdir/launcher/claude-desktop" "$pkgdir/usr/bin/claude-desktop"

    # Install desktop entry.
    # Filename must match APP_ID in the launcher (com.anthropic.claude-desktop)
    # so xdg-desktop-portal can resolve our systemd-scope / cgroup identity.
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/com.anthropic.claude-desktop.desktop" << 'EOF'
[Desktop Entry]
Name=Claude
Comment=Claude AI Desktop Application
Exec=claude-desktop %u
Icon=claude-desktop
Type=Application
Terminal=false
Categories=Office;Utility;Chat;
MimeType=x-scheme-handler/claude;
StartupWMClass=com.anthropic.claude-desktop
EOF

    # Install icon (included in tarball)
    if [ -f "$srcdir/icons/claude-desktop.png" ]; then
        install -Dm644 "$srcdir/icons/claude-desktop.png" \
            "$pkgdir/usr/share/icons/hicolor/256x256/apps/claude-desktop.png"
    fi
}

# vim: set ts=4 sw=4 et:
