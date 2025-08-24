# Maintainer: Mike Krüger <mkrueger@posteo.de>
pkgname=game-cheetah
pkgver=0.5.1
pkgrel=1
pkgdesc="High-performance memory scanner/editor and game trainer"
arch=('x86_64')
url="https://github.com/mkrueger/game_cheetah"
license=('Apache')
depends=('gtk3' 'libxcb' 'libxkbcommon' 'wayland' 'libgl' 'fontconfig' 'freetype2')
makedepends=('rust' 'cargo')
options=('!strip') # Optional: keep debug symbols for better crash reports
source=("$pkgname-$pkgver.tar.gz::https://github.com/mkrueger/game_cheetah/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a08a19c7d37ca949bfad00faeba27c34dc3c2428744de0c4ef8d241d4a8cf4e3')

prepare() {
    cd "$srcdir/game_cheetah-$pkgver"
}

build() {
    cd "$srcdir/game_cheetah-$pkgver"
    export RUSTFLAGS="-C target-cpu=x86-64-v2"
    cargo build --release
}

check() {
    cd "$srcdir/game_cheetah-$pkgver"
    # cargo test --release
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