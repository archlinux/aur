# Maintainer: PandaDEV <contact@pandadev.net>
pkgname=twitch-drops-miner-bin
pkgver=20250811.220233
pkgrel=1
pkgdesc="An app that allows you to AFK mine timed Twitch drops, with automatic drop claiming and channel switching."
arch=(x86_64 aarch64)
url="https://github.com/DevilXD/TwitchDropsMiner"
license=('MIT')
options=('!strip')
depends=()
provides=(twitch-drops-miner)
conflicts=(twitch-drops-miner)
source_x86_64=("Twitch.Drops.Miner.Linux.AppImage-x86_64.zip::https://github.com/DevilXD/TwitchDropsMiner/releases/download/dev-build/Twitch.Drops.Miner.Linux.AppImage-x86_64.zip")
source_aarch64=("Twitch.Drops.Miner.Linux.AppImage-aarch64.zip::https://github.com/DevilXD/TwitchDropsMiner/releases/download/dev-build/Twitch.Drops.Miner.Linux.AppImage-aarch64.zip")
sha256sums_x86_64=('99ff0ea1202cf99df54538e4d8728a6016ee1479774e10c8802fc6be187918ac')
sha256sums_aarch64=('2d2725ebdf9416d20427a55d67705279e9cfde85b2bef81346cc7ccc28731d6e')

prepare() {
    # Unzip the AppImage files
    cd "$srcdir"
    unzip -q "Twitch.Drops.Miner.Linux.AppImage-${CARCH}.zip"
}

package() {
    cd "$srcdir"
    
    # Find the extracted AppImage file
    appimage_file=$(find . -name "*.AppImage" -type f | head -1)
    
    if [ -z "$appimage_file" ]; then
        echo "Error: No AppImage file found after extraction"
        exit 1
    fi
    
    # Make AppImage executable
    chmod +x "$appimage_file"
    
    # Install the AppImage
    install -Dm755 "$appimage_file" "$pkgdir/opt/twitch-drops-miner/twitch-drops-miner.appimage"
    
    # Create wrapper script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/twitch-drops-miner" << 'EOF'
#!/bin/bash
export APPIMAGE_EXTRACT_AND_RUN=1
exec /opt/twitch-drops-miner/twitch-drops-miner.appimage "$@"
EOF
    chmod +x "$pkgdir/usr/bin/twitch-drops-miner"
    
    # Extract AppImage to get desktop file and icon
    "$appimage_file" --appimage-extract >/dev/null 2>&1
    
    # Install desktop file if found
    if [ -f squashfs-root/*.desktop ]; then
        install -dm755 "$pkgdir/usr/share/applications"
        desktop_file=$(find squashfs-root -name "*.desktop" -type f | head -1)
        sed 's|Exec=.*|Exec=twitch-drops-miner %U|g' "$desktop_file" > "$pkgdir/usr/share/applications/twitch-drops-miner.desktop"
    fi
    
    # Install icon if found
    png_file=$(find squashfs-root -name "*.png" -type f | head -1)
    if [ -n "$png_file" ]; then
        install -Dm644 "$png_file" "$pkgdir/usr/share/pixmaps/twitch-drops-miner.png"
    fi
    
    # Clean up extracted files
    rm -rf squashfs-root
}
