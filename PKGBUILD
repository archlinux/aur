# Maintainer: Dragynrain <roguesignalprotocol at gmail dot com>
# AUR Package: rogue-signal-protocol-bin
#
# Installation:
#   With yay: yay -S rogue-signal-protocol-bin
#   Manual: makepkg -si
#
# This is a binary package - Python and all dependencies are bundled by PyInstaller.

pkgname=rogue-signal-protocol-bin
install=rogue-signal-protocol-bin.install
pkgver=0.9.1_beta
pkgrel=1
pkgdesc="Cyberpunk roguelike game - BETA release (binary)"
arch=('x86_64')
url="https://github.com/Dragynrain/RogueSignalProtocol"
license=('MIT')

# Runtime dependencies only - PyInstaller bundles Python and Python libraries
# SDL2 libraries are dynamically linked
depends=('sdl2' 'sdl2_ttf' 'sdl2_mixer' 'glibc')

# Optional dependencies for enhanced functionality
optdepends=(
    'steam: For Steam Deck integration'
    'gamecontrollerdb: Additional gamepad mappings'
)

# Package conflicts/provides
provides=('rogue-signal-protocol')
conflicts=('rogue-signal-protocol' 'rogue-signal-protocol-git')

# Source archive from GitHub releases
# Note: pkgver uses underscore (0.9.0_beta) but release tag uses hyphen (v0.9.0-beta)
_vertag=0.9.1-beta
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Dragynrain/RogueSignalProtocol/releases/download/v${_vertag}/RogueSignalProtocol-${_vertag}-Linux.tar.gz")

# Update this checksum for each release
# Generate with: sha256sum RogueSignalProtocol-X.Y.Z-beta-Linux.tar.gz
sha256sums=('c165fd72c526573c238c32d27221cad73b3e87fc880417e27e2a8576657f5c90')

# Don't strip the binary - PyInstaller binaries don't like being stripped
options=('!strip')

package() {
    cd "$srcdir"

    # Create installation directory
    install -dm755 "$pkgdir/opt/rogue-signal-protocol"

    # Install main executable
    install -Dm755 RogueSignalProtocol "$pkgdir/opt/rogue-signal-protocol/RogueSignalProtocol"

    # Install game assets
    cp -r graphics "$pkgdir/opt/rogue-signal-protocol/"
    cp -r sound "$pkgdir/opt/rogue-signal-protocol/"
    cp -r music "$pkgdir/opt/rogue-signal-protocol/"

    # Install configuration files
    install -Dm644 game_content.json "$pkgdir/opt/rogue-signal-protocol/"
    install -Dm644 game_rules.json "$pkgdir/opt/rogue-signal-protocol/"
    install -Dm644 graphics_tiles.json "$pkgdir/opt/rogue-signal-protocol/"
    install -Dm644 narrative_content.json "$pkgdir/opt/rogue-signal-protocol/"
    install -Dm644 default_bindings.json "$pkgdir/opt/rogue-signal-protocol/"
    install -Dm644 KreativeSquare.ttf "$pkgdir/opt/rogue-signal-protocol/"

    # Install optional files if present
    [ -f "README.txt" ] && install -Dm644 README.txt "$pkgdir/opt/rogue-signal-protocol/"
    [ -f "LICENSE" ] && install -Dm644 LICENSE "$pkgdir/opt/rogue-signal-protocol/"
    [ -f "debug_mode.flag" ] && install -Dm644 debug_mode.flag "$pkgdir/opt/rogue-signal-protocol/"

    # Create launcher script (game expects assets in CWD)
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/rogue-signal-protocol" << 'EOF'
#!/bin/sh
cd /opt/rogue-signal-protocol
exec ./RogueSignalProtocol "$@"
EOF
    chmod +x "$pkgdir/usr/bin/rogue-signal-protocol"

    # Install desktop entry
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/rogue-signal-protocol.desktop" << 'EOF'
[Desktop Entry]
Name=Rogue Signal Protocol
GenericName=Roguelike Game
Comment=Cyberpunk roguelike game
Exec=rogue-signal-protocol
Icon=rogue-signal-protocol
Terminal=false
Type=Application
Categories=Game;RolePlaying;
Keywords=roguelike;cyberpunk;tactical;turn-based;
EOF

    # Install icon (extract from tarball or use bundled logo.png)
    # Note: The release tarball should include logo.png, or we copy from assets
    if [ -f "logo.png" ]; then
        install -Dm644 logo.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/rogue-signal-protocol.png"
    fi

    # Install license to standard location
    if [ -f "LICENSE" ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}

# vim: set ts=4 sw=4 et:
