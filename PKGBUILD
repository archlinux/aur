# Maintainer: Mike Krüger <mkrueger@posteo.de>
pkgname=game-cheetah
pkgver=0.7.3
pkgrel=1
pkgdesc="High-performance memory scanner/editor and game trainer"
arch=('x86_64')
url="https://github.com/mkrueger/game_cheetah"
license=('Apache-2.0')
depends=('gtk3' 'libxcb' 'libxkbcommon' 'wayland' 'libgl' 'fontconfig' 'freetype2')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('200137e7820ed6018be73206f9974ddb1ae5c10c2169e981e654adc01c475c3b')

prepare() {
    cd "$srcdir/game_cheetah-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/game_cheetah-$pkgver"
    cargo build --release --frozen
}

package() {
    cd "$srcdir/game_cheetah-$pkgver"
    
    # Install binary
    install -Dm755 "target/release/game-cheetah" "$pkgdir/usr/bin/game-cheetah"
    
    # Install desktop file
    install -Dm644 "build/linux/game-cheetah.desktop" "$pkgdir/usr/share/applications/game-cheetah.desktop"
    
    # Fix the desktop file to use correct binary and icon names
    sed -i "s/Exec=.*$/Exec=game-cheetah/" "$pkgdir/usr/share/applications/game-cheetah.desktop"
    sed -i "s/Icon=.*$/Icon=game-cheetah/" "$pkgdir/usr/share/applications/game-cheetah.desktop"
    sed -i "s/StartupWMClass=.*$/StartupWMClass=game-cheetah/" "$pkgdir/usr/share/applications/game-cheetah.desktop"
    
    # Install icons with the correct name (game-cheetah instead of game_cheetah)
    install -Dm644 "build/linux/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/game-cheetah.png"
    if [ -f "build/linux/256x256.png" ]; then
        install -Dm644 "build/linux/256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/game-cheetah.png"
    fi
    
    # Install license if it exists
    if [ -f "LICENSE" ]; then
        install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
    
    # Install documentation
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}