# Maintainer: Insidious Fiddler <aur[at]codycody31[dot]dev>
pkgname=1code
pkgver=0.0.84
pkgrel=1
pkgdesc="Best UI for Claude Code with local and remote agent execution"
arch=('x86_64')
url="https://github.com/21st-dev/1code"
license=('Apache-2.0')
depends=('gtk3' 'nss' 'libxss' 'alsa-lib')
makedepends=('bun' 'python' 'nodejs')
conflicts=("$pkgname-bin" "$pkgname-git")
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('5d171c657c6c99f96dbb24df04c5125dec5f80d564a3acb112ce5104413b9c7e'
            '44ecea6b700e7f097b4c22669d24ee19ae3d6b61967621eb0dd2eb478eaf47df')

# ci/cd flag: gh repo for auto updates
_ghrepo="21st-dev/1code"

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    bun install
    bun run claude:download
    bun run codex:download
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    bun run build
    # Build unpacked directory only (avoids deb/AppImage homepage requirement)
    ./node_modules/.bin/electron-builder --linux dir
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install the unpacked electron app
    install -dm755 "$pkgdir/opt/$pkgname"
    cp -r release/linux-unpacked/* "$pkgdir/opt/$pkgname/"

    # Create launcher script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/bin/bash
exec /opt/1code/21st-desktop "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/$pkgname"

    # Install desktop file
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Install icon
    for size in 16 32 48 64 128 256 512; do
        if [[ -f "build/icons/${size}x${size}.png" ]]; then
            install -Dm644 "build/icons/${size}x${size}.png" \
                "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
        fi
    done

    # Fallback icon locations
    if [[ -f "resources/icon.png" ]]; then
        install -Dm644 "resources/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    elif [[ -f "build/icon.png" ]]; then
        install -Dm644 "build/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    fi

    # Install license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
