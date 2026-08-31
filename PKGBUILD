# Maintainer: FXS <admin@fxs.life>
pkgname=rustle-bin
pkgver=0.4.8
pkgrel=1
pkgdesc="A modern music player built with Rust and iced, supporting NetEase Cloud Music (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Fei-xiangShi/Rustle"
license=('AGPL-3.0-or-later')
depends=(
    'dbus'
    'alsa-lib'
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
)
sha256sums=(
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

    # Install desktop metadata and icon shipped inside the AppImage
    install -Dm644 "squashfs-root/usr/share/applications/life.fxs.rustle.desktop" \
        "$pkgdir/usr/share/applications/life.fxs.rustle.desktop"
    install -Dm644 "squashfs-root/usr/share/metainfo/life.fxs.rustle.metainfo.xml" \
        "$pkgdir/usr/share/metainfo/life.fxs.rustle.metainfo.xml"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/256x256/apps/life.fxs.rustle.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/life.fxs.rustle.png"
    install -Dm644 "squashfs-root/usr/share/licenses/rustle/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Fix permissions
    chmod -R 755 "$pkgdir/opt/$pkgname"
}
