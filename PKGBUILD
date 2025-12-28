# Maintainer: Gabriel Menezes <menezes@mnzs.dev>
pkgname=mrunner
pkgver=0.0.8
_gitver=0.0.8
pkgrel=1
pkgdesc="A fast, keyboard-driven application runner for Linux."
arch=('x86_64')
url="https://github.com/mnzsss/mrunner"
license=('MIT')
depends=(
    'gtk3'
    'webkit2gtk-4.1'
    'libappindicator-gtk3'
    'librsvg'
)
optdepends=(
    'libnotify: for desktop notifications'
)
source=("$pkgname-$_gitver.AppImage::https://github.com/mnzsss/mrunner/releases/download/v$_gitver/mrunner-$_gitver-linux-x86_64.AppImage")
sha256sums=('34e994e5306a056073fde9c58f588550dde1f53794b59e33b2b7ca8944089329')
options=('!strip')

prepare() {
    chmod +x "$pkgname-$_gitver.AppImage"
    ./"$pkgname-$_gitver.AppImage" --appimage-extract
}

package() {
    # Install binary
    install -Dm755 "$srcdir/squashfs-root/usr/bin/mrunner" "$pkgdir/usr/bin/mrunner"

    # Install desktop entry
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/mrunner.desktop" << 'EOF'
[Desktop Entry]
Name=MRunner
Comment=A custom command launcher
Exec=env GDK_BACKEND=x11 WEBKIT_DISABLE_DMABUF_RENDERER=1 mrunner
Icon=mrunner
Terminal=false
Type=Application
Categories=Utility;
StartupWMClass=mrunner
EOF

    # Install icon from AppImage
    if [ -f "$srcdir/squashfs-root/usr/share/icons/hicolor/128x128/apps/mrunner.png" ]; then
        install -Dm644 "$srcdir/squashfs-root/usr/share/icons/hicolor/128x128/apps/mrunner.png" \
            "$pkgdir/usr/share/icons/hicolor/128x128/apps/mrunner.png"
    elif [ -f "$srcdir/squashfs-root/mrunner.png" ]; then
        install -Dm644 "$srcdir/squashfs-root/mrunner.png" \
            "$pkgdir/usr/share/icons/hicolor/128x128/apps/mrunner.png"
    fi
}
