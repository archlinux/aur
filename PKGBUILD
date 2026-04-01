# Maintainer: patrickjaja <patrickjajaa@gmail.com>
# Contributor: Claude Desktop Linux Community
# AUR Package Repository: https://github.com/patrickjaja/claude-desktop-bin

pkgname=claude-desktop-bin
pkgver=1.1.9669
pkgrel=8
pkgdesc="Claude Desktop - Linux (unofficial, from official binary)"
arch=('x86_64')
url="https://github.com/patrickjaja/claude-desktop-bin"
license=('custom:Claude')
depends=('electron')
optdepends=('nodejs: System Node.js for MCP extensions that require specific versions (Electron bundles Node.js as fallback)'
            'claude-code: Claude Code CLI for agentic coding features (npm i -g @anthropic-ai/claude-code)'
            'claude-cowork-service: Enables Cowork VM features on Linux'
            'xdotool: Computer Use input + Quick Entry positioning (X11/XWayland)'
            'scrot: Computer Use screenshots (X11)'
            'xclip: Computer Use clipboard access (X11)'
            'wmctrl: Computer Use running app detection (X11)'
            'xorg-xrandr: Computer Use display enumeration (X11)'
            'ydotool: Computer Use input automation (Wayland — requires ydotoold daemon running)'
            'grim: Computer Use screenshots (Wayland/wlroots — Sway, Hyprland)'
            'slurp: Computer Use region selection (Wayland/wlroots)'
            'wl-clipboard: Computer Use clipboard access (Wayland)'
            'wlr-randr: Computer Use display enumeration (Wayland/wlroots)'
            'spectacle: Computer Use screenshots on KDE Plasma Wayland (pre-installed on KDE)'
            'hyprland: Quick Entry cursor positioning on Hyprland Wayland (hyprctl)'
            'socat: Cowork socket health check in launcher (fallback: age-based check)')
provides=('claude-desktop')
conflicts=('claude-desktop')
source_x86_64=("claude-desktop-${pkgver}-${pkgrel}-linux.tar.gz::https://github.com/patrickjaja/claude-desktop-bin/releases/download/v1.1.9669-8/claude-desktop-1.1.9669-linux.tar.gz")
sha256sums_x86_64=('2f9d595f210f09db13963ca50662745ef90138fda7ec6d8ef519e9c17b6ec7fd')
options=('!strip')

package() {
    cd "$srcdir"

    # Install application files (pre-patched)
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    cp -r app/* "$pkgdir/usr/lib/$pkgname/"

    # Install launcher script (Wayland/X11 detection, env setup, lock cleanup)
    install -Dm755 "$srcdir/launcher/claude-desktop" "$pkgdir/usr/bin/claude-desktop"

    # Install desktop entry
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/claude-desktop.desktop" << 'EOF'
[Desktop Entry]
Name=Claude
Comment=Claude AI Desktop Application
Exec=claude-desktop %u
Icon=claude-desktop
Type=Application
Terminal=false
Categories=Office;Utility;Chat;
MimeType=x-scheme-handler/claude;
StartupWMClass=Claude
EOF

    # Install icon (included in tarball)
    if [ -f "$srcdir/icons/claude-desktop.png" ]; then
        install -Dm644 "$srcdir/icons/claude-desktop.png" \
            "$pkgdir/usr/share/icons/hicolor/256x256/apps/claude-desktop.png"
    fi
}

# vim: set ts=4 sw=4 et:
