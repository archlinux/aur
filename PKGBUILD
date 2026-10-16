# Maintainer: Mike Krüger <mkrueger@posteo.de>
pkgname=game-cheetah
pkgver=0.7.4
pkgrel=2
pkgdesc="High-performance memory scanner/editor and game trainer"
arch=('x86_64')
url="https://github.com/mkrueger/game_cheetah"
license=('Apache-2.0')
depends=('gtk3' 'libxcb' 'libxkbcommon' 'wayland' 'libgl' 'fontconfig' 'freetype2')
# rustup provides rust without a version; check the active compiler in prepare().
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('91f694d05351b13fe9a2aa7d5ba6c6db1e970c032732700589a2b9c7c137525b')

prepare() {
    local rust_version
    rust_version=$(rustc --version) || return
    if [[ ! $rust_version =~ ^rustc\ ([0-9]+)\.([0-9]+)\. ]] ||
        (( BASH_REMATCH[1] < 1 || (BASH_REMATCH[1] == 1 && BASH_REMATCH[2] < 95) )); then
        error "Rust 1.95 or newer is required; found: $rust_version"
        error "With rustup, run 'rustup update stable' and select a toolchain >=1.95 before rebuilding."
        return 1
    fi

    cd "$srcdir/game_cheetah-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/game_cheetah-$pkgver"
    cargo build --release --frozen
}

package() {
    cd "$srcdir/game_cheetah-$pkgver"

    install -Dm755 "target/release/game-cheetah" "$pkgdir/usr/bin/game-cheetah"
    install -Dm644 "build/linux/game-cheetah.desktop" "$pkgdir/usr/share/applications/game-cheetah.desktop"
    install -Dm644 "build/linux/io.github.mkrueger.game_cheetah.metainfo.xml" "$pkgdir/usr/share/metainfo/io.github.mkrueger.game_cheetah.metainfo.xml"

    sed -i "s/Exec=.*$/Exec=game-cheetah/" "$pkgdir/usr/share/applications/game-cheetah.desktop"
    sed -i "s/Icon=.*$/Icon=game-cheetah/" "$pkgdir/usr/share/applications/game-cheetah.desktop"
    sed -i "s/StartupWMClass=.*$/StartupWMClass=game-cheetah/" "$pkgdir/usr/share/applications/game-cheetah.desktop"

    install -Dm644 "build/linux/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/game-cheetah.png"
    if [ -f "build/linux/256x256.png" ]; then
        install -Dm644 "build/linux/256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/game-cheetah.png"
    fi

    if [ -f "LICENSE" ]; then
        install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
