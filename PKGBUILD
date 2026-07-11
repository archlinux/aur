# Maintainer: edo hikmahtiar <edohikmahtiar@me.com>
pkgname=mameuix
pkgver=0.1.6
pkgrel=1
pkgdesc="Modern MAME frontend with enhanced features"
arch=('x86_64')
url="https://github.com/firesand/MAMEUIx"
license=('MIT' 'OFL-1.1')
depends=(
    'glibc'
    'hicolor-icon-theme'
    'libgcc'
    'libglvnd'
    'libx11'
    'libxcursor'
    'libxi'
    'libxkbcommon'
    'libxkbcommon-x11'
    'libxcb'
    'libxrender'
    'mame>=0.200'
    'sh'
    'wayland'
    'xz'
)
makedepends=('cargo' 'pkgconf')
optdepends=(
    'xdg-desktop-portal: Native file dialogs under Wayland'
    'xdg-utils: Open links in the default web browser'
)
options=('!debug' '!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/firesand/MAMEUIx/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('08d1d39d71cbfb0102df320729ea964fc484ba19912ff581fff1751120005311')

_cargo_env() {
    local remap_flag="--remap-path-prefix=$srcdir=/usr/src/debug/$pkgname-$pkgver"

    export CARGO_HOME="$srcdir/cargo-home"
    export CARGO_TARGET_DIR="$srcdir/target"
    export RUSTUP_TOOLCHAIN=stable
    if [[ " ${RUSTFLAGS:-} " != *" $remap_flag "* ]]; then
        export RUSTFLAGS="${RUSTFLAGS:+$RUSTFLAGS }$remap_flag"
    fi

    # Upstream enables full LTO and one codegen unit. Disabling LTO here keeps
    # local AUR builds practical on machines with limited memory.
    export CARGO_PROFILE_RELEASE_LTO=false
}

prepare() {
    cd "MAMEUIx-$pkgver"
    _cargo_env
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "MAMEUIx-$pkgver"
    _cargo_env
    cargo build --frozen --release --bin mameuix
}

check() {
    cd "MAMEUIx-$pkgver"
    _cargo_env
    cargo test --frozen --release --bin mameuix
}

package() {
    cd "MAMEUIx-$pkgver"

    install -Dm755 "$srcdir/target/release/mameuix" "$pkgdir/usr/bin/mameuix"
    install -Dm644 mameuix.desktop \
        "$pkgdir/usr/share/applications/mameuix.desktop"
    install -Dm644 assets/icons/scalable/mameuix.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/mameuix.svg"

    local size
    for size in 16 32 48 64 128 256; do
        install -Dm644 "assets/icons/${size}x${size}/mameuix.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/mameuix.png"
    done

    install -Dm644 debian/mameuix.1 "$pkgdir/usr/share/man/man1/mameuix.1"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm644 docs/*.md -t "$pkgdir/usr/share/doc/$pkgname"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 assets/fonts/public_sans/OFL.txt \
        "$pkgdir/usr/share/licenses/$pkgname/OFL-Public-Sans.txt"
}
