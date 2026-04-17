# Maintainer: patrickjaja <patrickjajaa@gmail.com>
# Contributor: Claude Desktop Linux Community
# AUR Package Repository: https://github.com/patrickjaja/claude-desktop-bin

pkgname=claude-desktop-bin
pkgver=1.3109.0
pkgrel=2
pkgdesc="Claude Desktop - Linux (unofficial, from official binary)"
arch=('x86_64')
url="https://github.com/patrickjaja/claude-desktop-bin"
license=('custom:Claude')
depends=('electron')
makedepends=('electron')
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
            'socat: Cowork socket health check in launcher (fallback: age-based check)')
provides=('claude-desktop')
conflicts=('claude-desktop')
source_x86_64=("claude-desktop-${pkgver}-${pkgrel}-linux.tar.gz::https://github.com/patrickjaja/claude-desktop-bin/releases/download/v1.3109.0-2/claude-desktop-1.3109.0-linux.tar.gz")
sha256sums_x86_64=('69f3fa280595555657e8805fe070e281b612173cbe9ab124950fb7a6e24d0d1b')
options=('!strip')

package() {
    cd "$srcdir"

    # Install application files (pre-patched)
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    cp -r app/* "$pkgdir/usr/lib/$pkgname/"

    # Hardlink system electron into our prefix under the APP_ID name. Electron
    # ignores Chromium's --class flag and argv[0]; it reads /proc/self/exe and
    # uses the basename as the Wayland app_id / X11 WM_CLASS. A hardlink lets
    # us appear as com.anthropic.claude-desktop without duplicating 200 MB.
    # Caveat: if the electron package is upgraded, this link still points at
    # the OLD inode until claude-desktop-bin is reinstalled. See .install.
    local electron_bin=/usr/lib/electron/electron
    if [[ -x $electron_bin ]]; then
        ln "$electron_bin" "$pkgdir/usr/lib/$pkgname/com.anthropic.claude-desktop"
    else
        echo "PKGBUILD: /usr/lib/electron/electron not found; WM_CLASS will be wrong until rebuilt against an installed electron" >&2
    fi

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
