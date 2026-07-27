# Maintainer: Eric Jingryd <tidynest@proton.me>
pkgname=linux-system-hardener
pkgver=1.5.1
pkgrel=1
pkgdesc="Linux security automation: scanning, hardening, and rollback across 8 domains"
arch=('x86_64')
url="https://github.com/tidynest/linux-system-hardener"
license=('Apache-2.0')
depends=(
    'cairo'
    'desktop-file-utils'
    'gcc-libs'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup3'
    'openssl'
    'pango'
    'polkit'
    'webkit2gtk-4.1'
    'libxcb'
    'libxkbcommon'
    'systemd'
)
makedepends=(
    'git'
    'musl'
    'openssl'
    'librsvg'
    'rust'
    'cargo'
    'trunk'
    'pkg-config'
)
optdepends=(
    'polkit-gnome: polkit agent for GNOME, XFCE, Hyprland, Sway, i3'
    'polkit-kde-agent: polkit agent for KDE Plasma'
    'xfce-polkit: native polkit agent for XFCE'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/tidynest/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('baf3e7ed6fecdec340b72c7673c82b0efc776aafc89ffd5c7d136d2e67f8bc1e')

build() {
    cd "$pkgname-$pkgver"

    # Strip GCC LTO from CFLAGS - GCC LTO bytecode is incompatible with
    # Rust's linkers (musl self-contained and rust-lld) and causes undefined
    # references in native C/asm libraries (ring, libsqlite3-sys).
    # Rust applies its own LTO via [profile.release] lto = true.
    export CFLAGS="${CFLAGS//-flto=auto/}"
    export CXXFLAGS="${CXXFLAGS//-flto=auto/}"

    # Remap absolute source paths embedded by panic!/unwrap/tracing to
    # relative prefixes - prevents $srcdir and $HOME leaking into binaries.
    _remap="--remap-path-prefix=$srcdir=src: --remap-path-prefix=$HOME/.cargo/registry/src/=registry: --remap-path-prefix=$HOME/.rustup/toolchains/=toolchain:"
    export RUSTFLAGS="${RUSTFLAGS:-} ${_remap}"

    # Pin the target dir inside the build root. A user-level cargo config
    # (a global [build] target-dir) would otherwise relocate the artifacts
    # that package() installs from relative target/ paths.
    export CARGO_TARGET_DIR="$srcdir/$pkgname-$pkgver/target"

    cargo build --release --target x86_64-unknown-linux-musl -p hardener-cli

    # Build the Leptos WASM frontend (Tauri embeds these assets from dist/).
    # Use --public-url="." so asset paths are relative (required for Tauri's
    # custom-protocol; absolute paths like /foo.js don't resolve).
    cd crates/hardener-ui && trunk build --release --public-url="." && cd ../..

    cd src-tauri && cargo build --release --features tauri/custom-protocol
}

package() {
    cd "$pkgname-$pkgver"

    # CLI binary (static musl)
    install -Dm755 "target/x86_64-unknown-linux-musl/release/hardener" \
        "$pkgdir/usr/bin/hardener"

    # Desktop binary + wrapper (sets WebKit Wayland workaround)
    install -Dm755 "target/release/linux-hardener-desktop" \
        "$pkgdir/usr/lib/linux-hardener/linux-hardener-desktop"
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/linux-hardener-desktop" <<'WRAPPER'
#!/bin/sh
export WEBKIT_DISABLE_COMPOSITING_MODE=1
exec /usr/lib/linux-hardener/linux-hardener-desktop "$@"
WRAPPER

    # Systemd units
    install -Dm644 "packaging/systemd/linux-hardener.service" \
        "$pkgdir/usr/lib/systemd/system/linux-hardener.service"
    install -Dm644 "packaging/systemd/linux-hardener.timer" \
        "$pkgdir/usr/lib/systemd/system/linux-hardener.timer"

    # Desktop entry
    install -Dm644 "packaging/assets/linux-hardener.desktop" \
        "$pkgdir/usr/share/applications/linux-hardener.desktop"

    # Man page
    install -Dm644 "packaging/assets/hardener.1" \
        "$pkgdir/usr/share/man/man1/hardener.1"

    # Polkit policy
    install -Dm644 "packaging/assets/com.tidynest.linux-hardener.policy" \
        "$pkgdir/usr/share/polkit-1/actions/com.tidynest.linux-hardener.policy"

    # Default config
    install -Dm644 "packaging/assets/config.toml.example" \
        "$pkgdir/usr/share/doc/$pkgname/config.toml.example"
    install -Dm644 "packaging/assets/config.toml.example" \
        "$pkgdir/etc/linux-hardener/config.toml"

    # Directories
    install -dm755 "$pkgdir/etc/linux-hardener"
    install -dm755 "$pkgdir/var/lib/linux-hardener"
    install -dm700 "$pkgdir/var/log/linux-hardener"

    # Licence and docs
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
