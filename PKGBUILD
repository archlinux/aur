# Maintainer: PandaDEV <contact@pandadev.net>
pkgname=twitch-drops-miner-bin
pkgver=20250811.221512
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
    cd "$srcdir"
    unzip -o "Twitch.Drops.Miner.Linux.AppImage-${CARCH}.zip"
}

package() {
    cd "$srcdir"
    appimage_file=$(find . -name "*.AppImage" -type f | head -1)
    
    if [ -z "$appimage_file" ]; then
        echo "Error: No AppImage file found after extraction"
        exit 1
    fi
    
    chmod +x "$appimage_file"
    
    install -Dm755 "$appimage_file" "$pkgdir/usr/lib/twitch-drops-miner/twitch-drops-miner.appimage"
    
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/twitch-drops-miner" << 'EOF'
    #!/bin/bash
    export APPIMAGE_EXTRACT_AND_RUN=1

    # Create user data directory if it doesn't exist
    DATA_DIR="$HOME/.local/share/twitch-drops-miner"
    mkdir -p "$DATA_DIR"

    # Copy AppImage to user directory if it doesn't exist or is older
    USER_APPIMAGE="$DATA_DIR/twitch-drops-miner.appimage"
    SYSTEM_APPIMAGE="/usr/lib/twitch-drops-miner/twitch-drops-miner.appimage"

    if [ ! -f "$USER_APPIMAGE" ] || [ "$SYSTEM_APPIMAGE" -nt "$USER_APPIMAGE" ]; then
        echo "Copying AppImage to user directory..."
        cp "$SYSTEM_APPIMAGE" "$USER_APPIMAGE"
        chmod +x "$USER_APPIMAGE"
    fi

    # Change to user data directory and run from there
    cd "$DATA_DIR"
    exec "$USER_APPIMAGE" "$@"
EOF
    chmod +x "$pkgdir/usr/bin/twitch-drops-miner"
    
    "$appimage_file" --appimage-extract >/dev/null 2>&1
    
    if [ -f squashfs-root/*.desktop ]; then
        install -dm755 "$pkgdir/usr/share/applications"
        desktop_file=$(find squashfs-root -name "*.desktop" -type f | head -1)
        sed 's|Exec=.*|Exec=twitch-drops-miner %U|g' "$desktop_file" > "$pkgdir/usr/share/applications/twitch-drops-miner.desktop"
    fi
    
    png_file=$(find squashfs-root -name "*.png" -type f | head -1)
    if [ -n "$png_file" ]; then
        install -Dm644 "$png_file" "$pkgdir/usr/share/pixmaps/twitch-drops-miner.png"
    fi
    
    rm -rf squashfs-root
}