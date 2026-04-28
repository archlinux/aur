# Maintainer: Matthew Cushing <cushing.matt@gmail.com>
pkgname=wflow
pkgver=0.3.26
pkgrel=1
pkgdesc="A workflow engine for Wayland automation — Shortcuts-style GUI + CLI"
arch=('x86_64')
url="https://github.com/cushycush/wflow"
license=('MIT' 'Apache-2.0')
# cxx-qt-lib's generated C++ glue can't be linked against the Rust
# side when the system enables makepkg's LTO (the bitcode artifacts
# never resolve into the symbols Rust's link step expects). Cargo's
# own profile.release lto = "thin" stays on; this only opts out of
# the makepkg-driven external LTO.
options=(!lto)
depends=(
    'qt6-base'
    'qt6-declarative'
    'gcc-libs'
    'glibc'
)
makedepends=('rust' 'cargo')
optdepends=(
    'libnotify: desktop notifications via notify-send'
    'wl-clipboard: clipboard via wl-copy'
    'xdg-desktop-portal: input via libei portal + Record Mode'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    local bin="target/release/$pkgname"

    install -Dm755 "$bin" "$pkgdir/usr/bin/$pkgname"

    # Shell completions
    "$bin" completions bash | install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    "$bin" completions zsh  | install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
    "$bin" completions fish | install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"

    # Man pages — wflow(1) plus one page per subcommand.
    install -d "$pkgdir/usr/share/man/man1"
    "$bin" man --output "$pkgdir/usr/share/man/man1" >/dev/null

    # Desktop entry + scalable icon, so rofi / wofi / Krunner / GNOME
    # Activities discover wflow as an app. Reverse-DNS name matches the
    # Flatpak install so users see the same launcher entry across
    # install methods.
    install -Dm644 packaging/flatpak/io.github.cushycush.wflow.desktop \
        "$pkgdir/usr/share/applications/io.github.cushycush.wflow.desktop"
    install -Dm644 packaging/flatpak/io.github.cushycush.wflow.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.cushycush.wflow.svg"

    # Docs
    install -Dm644 README.md     "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 docs/KDL.md   "$pkgdir/usr/share/doc/$pkgname/KDL.md"

    # License files — only install if upstream has them; the dual
    # MIT/Apache-2.0 declaration in Cargo.toml is authoritative either
    # way.
    for f in LICENSE-MIT LICENSE-APACHE LICENSE; do
        if [ -f "$f" ]; then
            install -Dm644 "$f" "$pkgdir/usr/share/licenses/$pkgname/$f"
        fi
    done
}
