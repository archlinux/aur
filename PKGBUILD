# Maintainer: Jon Kinney <jon@headway.io>
pkgname=hyprcorrect
pkgver=0.4.1
pkgrel=1
pkgdesc="Keyboard-driven desktop spelling and typo corrector (Hyprland-first)"
arch=('x86_64' 'aarch64')
url="https://github.com/jondkinney/hyprcorrect"
license=('MIT' 'Apache-2.0')
# !debug suppresses the split `hyprcorrect-debug` companion package
# so AUR helpers don't prompt for it on install.
options=(!debug)
depends=(
    'fontconfig'
    'freetype2'
    'hyprland'         # daemon registers its chord via `hyprctl bind`
    'libglvnd'         # OpenGL surface for the egui prefs window
    'libsecret'        # keyring backend the LLM API key lives in
    'libxkbcommon'     # capture-side keysym translation
    'wayland'
    'wtype'            # synthetic input (the only emit path)
)
makedepends=(
    'cargo'
    'pkgconf'
)
optdepends=(
    'wl-clipboard: enables the clipboard / selection fallback when the keystroke buffer is empty'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jondkinney/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a8e3cab43b12747aea368f788a77b7d29dffc92ab911fb61579746e380ab5727')

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
    # Rewrite $srcdir out of compile-time paths embedded by env!() /
    # panic-site metadata so the packaged binary doesn't leak the
    # builder's cache path (and makepkg stops warning about it).
    export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/build"
    cargo build --frozen --release --bin hyprcorrect
}

check() {
    cd "$pkgname-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release --workspace
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "target/release/hyprcorrect" "$pkgdir/usr/bin/hyprcorrect"

    install -Dm644 "packaging/hyprcorrect.desktop" \
        "$pkgdir/usr/share/applications/hyprcorrect.desktop"

    install -Dm644 "assets/icons/hicolor/scalable/apps/hyprcorrect.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/hyprcorrect.svg"
    for size in 16 22 24 32 48 64 128 256 512; do
        install -Dm644 "assets/icons/hicolor/${size}x${size}/apps/hyprcorrect.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/hyprcorrect.png"
    done

    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
