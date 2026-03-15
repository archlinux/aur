# Maintainer: patrickjaja <patrickjajaa@gmail.com>
# Contributor: Claude Desktop Linux Community
# AUR Package Repository: https://github.com/patrickjaja/claude-desktop-bin

pkgname=claude-desktop-bin
pkgver=1.1.6679
pkgrel=3
pkgdesc="Claude Desktop - Linux (unofficial, from official binary)"
arch=('x86_64')
url="https://github.com/patrickjaja/claude-desktop-bin"
license=('custom:Claude')
depends=('electron' 'nodejs')
optdepends=('claude-code: Claude Code CLI for agentic coding features (npm i -g @anthropic-ai/claude-code)'
            'claude-cowork-service: Enables Cowork VM features on Linux (experimental)'
            'xdotool: Computer Use desktop automation - mouse/keyboard control (X11)'
            'scrot: Computer Use screenshots (X11, fallback: imagemagick)')
provides=('claude-desktop')
conflicts=('claude-desktop')
source_x86_64=("claude-desktop-${pkgver}-${pkgrel}-linux.tar.gz::https://github.com/patrickjaja/claude-desktop-bin/releases/download/v1.1.6679-3/claude-desktop-1.1.6679-linux.tar.gz")
sha256sums_x86_64=('f92edfb10925def51115fb4b86aff0b6941cb52aa731008f8096c5bab0ea13ca')
options=('!strip')

package() {
    cd "$srcdir"

    # Install application files (pre-patched)
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    cp -r app/* "$pkgdir/usr/lib/$pkgname/"

    # Install launcher script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/claude-desktop" << 'EOF'
#!/bin/bash
exec electron /usr/lib/claude-desktop-bin/app.asar "$@"
EOF
    chmod +x "$pkgdir/usr/bin/claude-desktop"

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
