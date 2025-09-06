# Maintainer: Rahat Zaman <rahatzamancse@gmail.com>
pkgname=proton-game-saves
pkgver=0.1.0
pkgrel=1
pkgdesc="A GTK4 application to manage Proton game save files for Steam games"
arch=('x86_64')
url="https://github.com/rahatzamancse/protongamesaves"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'openssl')
makedepends=('rust' 'cargo' 'pkg-config')
optdepends=('steam: for automatic Steam directory detection')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rahatzamancse/protongamesaves/archive/v$pkgver.tar.gz")
sha256sums=('c88a60da7659a681a0cbaf3f3c5abc5334ac6888489c4d2c62442cb02bb5a999')
backup=()
options=()

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    
    # Install binary
    install -Dm755 "target/release/proton_game_saves" "$pkgdir/usr/bin/proton-game-saves"
    
    # Install desktop file
    install -Dm644 "proton-game-saves.desktop" "$pkgdir/usr/share/applications/proton-game-saves.desktop"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
