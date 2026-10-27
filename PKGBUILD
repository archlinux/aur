# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=grimoire-tui-git
_pkgname=grimoire-tui
pkgver=0.7.5.r0.gf3ca1e8
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
    "${_pkgname}-main::git+$url.git#branch=main"
    'grimoire.desktop'
)
sha256sums=(
    'SKIP'
    '9063f4253aaa32cac86665cee124f5388ce0c9efc8df7077a40566638b4a5aad'
)

pkgver() {
    cd "${_pkgname}-main"
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
    cd "${_pkgname}-main"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${_pkgname}-main"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${_pkgname}-main"
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
