# Maintainer: Jon Kinney <jon@headway.io>
pkgname=vernier
pkgver=0.1.0
pkgrel=1
pkgdesc="Cross-platform pixel-measurement overlay in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/jondkinney/vernier"
license=('MIT' 'Apache-2.0')
# C-level LTO trips up cc-compiled static archives from libspa-sys /
# libspa: cc::Build picks up makepkg's -flto=auto and emits LTO IR
# objects that lld then can't resolve when linking the Rust binary.
options=(!lto)
depends=(
    'fontconfig'
    'freetype2'
    'libglvnd'
    'libxkbcommon'
    'pipewire'
    'wayland'
)
makedepends=(
    'cargo'
    'pkgconf'
)
optdepends=(
    'grim: capture held-rect regions via wlr-screencopy'
    'slurp: region selection for the external screenshot shortcut'
    'wl-clipboard: copy screenshots / measurements to the clipboard'
    'libnotify: post-capture notifications'
    'xdg-desktop-portal-hyprland: global hotkey via the GlobalShortcuts portal'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jondkinney/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f032713778aedd1bdefe78135694d8f07304d2b0b3572407e0e2ac769567778a')

prepare() {
    cd "$pkgname-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --bin vernier
}

check() {
    cd "$pkgname-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release --workspace
}

package() {
    cd "$pkgname-$pkgver"

    # Binary
    install -Dm755 "target/release/vernier" "$pkgdir/usr/bin/vernier"

    # Desktop entry
    install -Dm644 "packaging/vernier.desktop" \
        "$pkgdir/usr/share/applications/vernier.desktop"

    # Hicolor icon tree (PNG + scalable SVG, app + symbolic status)
    install -d "$pkgdir/usr/share/icons/hicolor"
    cp -r assets/icons/hicolor/. "$pkgdir/usr/share/icons/hicolor/"

    # Licenses
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"

    # README
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
