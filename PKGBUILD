# Maintainer: Wayne Martin <ghwinslow1700@hotmail.com>
pkgname=waynewolf
pkgver=141.0
pkgrel=1
pkgdesc="Privacy-focused browser with profile templates and extension management based on LibreWolf/Firefox"
arch=('x86_64')
url="https://github.com/WTmartin8089/waynewolf"
license=('MPL2')
depends=(
    'gtk3'
    'dbus-glib'
    'ffmpeg'
    'nss'
    'ttf-font'
    'libpulse'
)
makedepends=(
    'rust'
    'cbindgen'
    'pigz'
    'python'
    'nodejs'
    'npm'
    'clang'
    'llvm'
    'zip'
    'unzip'
)
optdepends=(
    'tor: For anonymous mode with Tor integration'
    'networkmanager: For captive portal detection'
    'libnotify: For notification support'
)
provides=('waynewolf')
conflicts=('waynewolf-bin')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
)
sha256sums=('8285a06120c73219e8c4d07c89720aadbd581b33760c68bafb0bec16c6e1df84')

build() {
    cd "$srcdir/$pkgname-$pkgver/WayneWolf"

    # Fetch LibreWolf sources
    make fetch

    # Prepare build directory
    make dir

    # Bootstrap
    make bootstrap

    # Setup WASI
    make setup-wasi

    # Build
    make build

    # Package
    make package
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Extract and install browser
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    bsdtar -xf WayneWolf/librewolf-*.tar.xz -C "$pkgdir/usr/lib/" --strip-components=1
    mv "$pkgdir/usr/lib/librewolf" "$pkgdir/usr/lib/$pkgname" || true

    # Install launcher wrapper
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/bin/bash
# WayneWolf system launcher wrapper
export MOZ_ENABLE_WAYLAND=1
export MOZ_REQUIRE_SIGNING=0

BROWSER_DIR="/usr/lib/waynewolf"
SHARE_DIR="/usr/share/waynewolf"

# Run the launcher script
if [ -f "$SHARE_DIR/launch-waynewolf.sh" ]; then
    exec "$SHARE_DIR/launch-waynewolf.sh" "$@"
else
    exec "$BROWSER_DIR/librewolf" "$@"
fi
EOF

    # Install supporting scripts and configs
    install -dm755 "$pkgdir/usr/share/$pkgname"
    install -Dm755 launch-waynewolf.sh "$pkgdir/usr/share/$pkgname/"
    install -Dm755 install-extensions.sh "$pkgdir/usr/share/$pkgname/"
    install -Dm644 user.js "$pkgdir/usr/share/$pkgname/"
    install -Dm644 extensions.conf "$pkgdir/usr/share/$pkgname/"

    # Install profile templates
    install -dm755 "$pkgdir/usr/share/$pkgname/profile-templates"
    cp -r profile-templates/* "$pkgdir/usr/share/$pkgname/profile-templates/"

    # Install desktop file
    install -Dm644 waynewolf.desktop "$pkgdir/usr/share/applications/waynewolf.desktop"

    # Install icons
    install -Dm644 waynewolf.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/waynewolf.svg"
    if [ -f waynewolf-48.png ]; then
        install -Dm644 waynewolf-48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/waynewolf.png"
    fi
    if [ -f waynewolf-128.png ]; then
        install -Dm644 waynewolf-128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/waynewolf.png"
    fi
    if [ -f waynewolf-256.png ]; then
        install -Dm644 waynewolf-256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/waynewolf.png"
    fi

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 BUILD_GUIDE.md "$pkgdir/usr/share/doc/$pkgname/BUILD_GUIDE.md" || true
    install -Dm644 CUSTOMIZATIONS.md "$pkgdir/usr/share/doc/$pkgname/CUSTOMIZATIONS.md" || true
}
