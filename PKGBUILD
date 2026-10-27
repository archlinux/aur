# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=grimoire-tui
pkgver=0.7.5
pkgrel=1
pkgdesc='A terminal writing desk for novels'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://github.com/kelsierbot/GrimoireTUI'
license=('MIT')
debends=('playerctl')
makedepends=(
    'cargo'
    'alsa-lib'
)
optdepends=(
    'speech-dispatcher: For the voice feature'
    'espeak-ng: Another option for the voice feature'
)
options=(
    '!lto'
    '!debug'
)
provides=('grimoire')
conflicts=('grimoire-tui-git' 'grimoire-tui-bin')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    'grimoire.desktop'
)
sha256sums=(
    '273fa1f72936e6975928072db90dccaf46c0f6ce55d649c79198e17d3663c880'
    '9063f4253aaa32cac86665cee124f5388ce0c9efc8df7077a40566638b4a5aad'
)

prepare() {
    cd "GrimoireTUI-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "GrimoireTUI-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "GrimoireTUI-$pkgver"
    install -Dm0755 target/release/grimoire "$pkgdir/usr/bin/grimoire"
    install -Dm644 apps/mobile/src-tauri/icons/128x128.png \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/grimoire.png"
    install -Dm644 apps/mobile/src-tauri/icons/128x128@2x.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/grimoire.png"

    install -Dm644 ../grimoire.desktop "$pkgdir/usr/share/applications/grimoire.desktop"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
