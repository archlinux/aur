# Maintainer: FXS <admin@fxs.life>
pkgname=rustle-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A modern music player built with Rust and iced, supporting NetEase Cloud Music (prebuilt binary)"
arch=('x86_64')
url="https://github.com/ArcticFoxNetwork/Rustle"
license=('AGPL-3.0-or-later')
depends=(
    'openssl'
    'dbus'
    'alsa-lib'
    'libayatana-appindicator'
    'fuse2'
)
provides=('rustle')
conflicts=('rustle')
optdepends=(
    'libpulse: PulseAudio support'
    'pipewire-pulse: PipeWire audio support'
    'vulkan-icd-loader: GPU acceleration'
)
options=('!strip')
source=(
    "$pkgname-$pkgver.AppImage::$url/releases/download/v$pkgver/rustle-linux-x86_64.AppImage"
    "rustle.png::$url/raw/main/assets/icons/icon_256.png"
)
sha256sums=(
    'SKIP'
    'SKIP'
)

prepare() {
    chmod +x "$pkgname-$pkgver.AppImage"
    "./$pkgname-$pkgver.AppImage" --appimage-extract
}

package() {
    # Install extracted AppImage contents
    install -d "$pkgdir/opt/$pkgname"
    cp -r squashfs-root/* "$pkgdir/opt/$pkgname/"

    # Create wrapper script
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/rustle" << EOF
#!/bin/bash
exec /opt/$pkgname/AppRun "\$@"
EOF

    # Install desktop file
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/rustle.desktop" << EOF
[Desktop Entry]
Name=Rustle
Comment=A modern music player
Exec=rustle
Icon=rustle
Type=Application
Categories=Audio;Music;Player;AudioVideo;
Keywords=music;player;netease;cloud;
EOF

    # Install icon
    install -Dm644 "rustle.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/rustle.png"

    # Fix permissions
    chmod -R 755 "$pkgdir/opt/$pkgname"
}
