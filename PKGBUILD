# Maintainer: yv-was-taken <yvmail@proton.me>
pkgname=desktop-waifu
pkgver=0.1.2
pkgrel=1
pkgdesc="Animated 3D VRM characters with AI-powered conversational chat - Wayland overlay"
arch=('x86_64')
url="https://github.com/yv-was-taken/desktop-waifu"
license=('MIT')
depends=(
    'gtk4'
    'webkit2gtk-4.1'
    'cairo'
    'glib2'
    'pango'
    'wayland'
    'dbus'
)
makedepends=(
    'cargo'
    'bun'
    'git'
    'nodejs'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')" --manifest-path desktop-waifu-overlay/Cargo.toml
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    # Build frontend
    bun install --frozen-lockfile
    bun run build:web

    # Build Rust binary
    cargo build --release --locked --manifest-path desktop-waifu-overlay/Cargo.toml
}

package() {
    cd "$pkgname-$pkgver"

    # Install binary
    install -Dm755 "target/release/desktop-waifu-overlay" "$pkgdir/usr/bin/desktop-waifu"

    # Install frontend assets
    install -dm755 "$pkgdir/usr/share/desktop-waifu/dist"
    cp -r dist/* "$pkgdir/usr/share/desktop-waifu/dist/"

    # Install desktop entry
    install -Dm644 "packaging/desktop-waifu.desktop" "$pkgdir/usr/share/applications/desktop-waifu.desktop"

    # Install license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
