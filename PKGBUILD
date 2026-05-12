# Maintainer: Jon Kinney <jon@headway.io>
pkgname=vernier
pkgver=0.1.3
pkgrel=1
pkgdesc="Cross-platform pixel-measurement overlay in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/jondkinney/vernier"
license=('MIT' 'Apache-2.0')
# C-level LTO trips up cc-compiled static archives from libspa-sys /
# libspa: cc::Build picks up makepkg's -flto=auto and emits LTO IR
# objects that lld then can't resolve when linking the Rust binary.
# !debug suppresses the split `vernier-debug` companion package.
# Arch's official repos route those to [core-debug] / [extra-debug],
# but AUR users see a confusing prompt instead — turn it off here.
options=(!lto !debug)
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
sha256sums=('e8232aab98f848821fefd169a0247b2d57ae7368a3d604afcf07de0fd9f80b59')

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
    # Rewrite $srcdir out of compile-time paths embedded by env!()
    # / panic-site metadata so the packaged binary doesn't leak the
    # builder's cache path (and makepkg stops warning about it).
    export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/build"
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

    # Hicolor icon tree — apps only. Status icons (the tray glyph)
    # stay out: SNI clients render the daemon's `icon_pixmap` (white,
    # via the runtime-recolored symbolic SVG), and a themed lookup of
    # `vernier-symbolic` picks the 16px PNG on small bars and shows
    # it in whatever single color it was baked in.
    install -d "$pkgdir/usr/share/icons/hicolor"
    cp -r assets/icons/hicolor/. "$pkgdir/usr/share/icons/hicolor/"
    rm -rf "$pkgdir"/usr/share/icons/hicolor/*/status

    # Licenses
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"

    # README
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
