# Maintainer: GizzyUwU me@gizzy.pro
# Maintainer: oxmc contact@oxmc.is-a.dev

pkgname=bskydesktop
pkgver=$(curl -s https://api.github.com/repos/oxmc/bsky-desktop/releases/latest | jq -r .tag_name | sed 's/v//')
pkgrel=1
pkgdesc="Bluesky Desktop - A decentralized social networking client distributed as an AppImage"
arch=('x86_64' 'aarch64')
url="https://github.com/oxmc/bsky-desktop"
license=('AGPL-3.0-only')
depends=('fuse2')
makedepends=('curl')
options=('!strip')
icon_url="https://raw.githubusercontent.com/oxmc/bsky-desktop/refs/heads/main/src/ui/images/logo.png"
icon_name="bsky-desktop.png"

prepare() {
    latest_tag=$(curl -s "https://api.github.com/repos/oxmc/bsky-desktop/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')
    echo "Latest release tag: $latest_tag"

    case "$CARCH" in
        x86_64)
            appimage_name="bskyDesktop-${latest_tag:1}-linux-x64.AppImage"
            ;;
        aarch64)
            appimage_name="bskyDesktop-${latest_tag:1}-linux-arm64.AppImage"
            ;;
        *)
            echo "Unsupported architecture: $CARCH"
            exit 1
            ;;
    esac

    source=(
        "https://github.com/oxmc/bsky-desktop/releases/download/$latest_tag/$appimage_name"
        "$icon_url"
    )
    echo "AppImage source: ${source[0]}"
    sha256sums=('SKIP' 'SKIP')
    curl -L "${source[0]}" -o "$srcdir/bskyDesktop.appimage"
    curl -L "${source[1]}" -o "$srcdir/$icon_name"
}

package() {
    appimage_dest="$pkgdir/opt/appimages/bsky-desktop"
    bin_dest="$pkgdir/usr/bin/bsky-desktop"
    desktop_file="$pkgdir/usr/share/applications/bsky-desktop.desktop"
    icon_dest="$pkgdir/usr/share/icons/hicolor/128x128/apps/$icon_name"

    if [[ ! -f "$srcdir/bskyDesktop.appimage" ]]; then
        echo "Error: AppImage file not found: $srcdir/bskyDesktop.appimage"
        exit 1
    fi
    if [[ ! -f "$srcdir/$icon_name" ]]; then
        echo "Error: Icon file not found: $srcdir/$icon_name"
        exit 1
    fi

    install -d "$pkgdir/opt/appimages"
    install -Dm755 "$srcdir/bskyDesktop.appimage" "$appimage_dest"

    install -d "$(dirname "$bin_dest")"
    ln -sf "/opt/appimages/bsky-desktop" "$bin_dest"

    install -d "$(dirname "$icon_dest")"
    install -Dm644 "$srcdir/$icon_name" "$icon_dest"

    install -d "$(dirname "$desktop_file")"
    install -Dm644 /dev/stdin "$desktop_file" <<EOF
[Desktop Entry]
Name=Bluesky Desktop
Comment=Bluesky Desktop Client
Exec=/usr/bin/bsky-desktop
Icon=bsky-desktop
Terminal=false
Type=Application
Categories=Network;Social;Application;
EOF
}
