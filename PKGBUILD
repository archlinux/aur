# Maintainer: Music Player Contributors <https://github.com/selfAnnihilator/kaze>
pkgname=kaze
pkgver=2.0.3
pkgrel=1
pkgdesc="A calm, intelligent local music player"
arch=('x86_64')
url="https://github.com/selfAnnihilator/kaze"
license=('MIT' 'Apache-2.0')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'libsoup3'
    'alsa-lib'
    'openssl'
    'sqlite'
    'hicolor-icon-theme'
)
makedepends=(
    # Select the concrete compiler/Cargo package on fresh systems. Existing
    # Arch rustup installations also provide rust; see INSTALL.md for setup.
    'rust'
    'nodejs'
    'npm'
)
options=(!lto)
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "kaze.desktop"
)
sha256sums=(
    '72750173ecdac2cf0d7f0dc72622862b1b3b612a19bcd20fb80593f1e9bd86d0'
    'eaf39dc7d4a05cefeb1543018e5a2ae84148343e3b5a8de50ba365087d43dd0c'
)

_ensure_rust_toolchain() {
    if cargo --version >/dev/null 2>&1 && rustc --version >/dev/null 2>&1; then
        return 0
    fi

    # Arch's rustup provides rust even when no toolchain is configured.
    # Select stable for this build without changing the user's default/overrides.
    if command -v rustup >/dev/null 2>&1; then
        export RUSTUP_TOOLCHAIN=stable
        if ! cargo --version >/dev/null 2>&1 || ! rustc --version >/dev/null 2>&1; then
            msg "Installing the stable Rust toolchain needed to build Kaze..."
            if ! rustup toolchain install stable --profile minimal --no-self-update; then
                error "Could not install stable Rust. Check the download error above and retry."
                return 1
            fi
        fi
    fi

    if ! cargo --version >/dev/null 2>&1 || ! rustc --version >/dev/null 2>&1; then
        error "Kaze needs a working Rust toolchain (Cargo and rustc)."
        error "Fresh Arch installation: install rust with 'sudo pacman -Syu --needed rust'."
        error "Already using rustup: run 'rustup default stable', then retry."
        error "See INSTALL.md for Cargo provider selection and troubleshooting."
        return 1
    fi
}

prepare() {
    _ensure_rust_toolchain || return 1
}

build() {
    # makepkg may run build in a different shell from prepare (also with --noextract).
    _ensure_rust_toolchain || return 1
    cd "$pkgname-$pkgver"
    npm ci
    npm run build
    cargo build --release --locked --features tauri/custom-protocol
}

package() {
    cd "$pkgname-$pkgver"
    local bin_dir="target/release"
    if [ ! -f "$bin_dir/kaze" ]; then
        bin_dir="src-tauri/target/release"
    fi

    install -Dm755 "$bin_dir/kaze" "$pkgdir/usr/bin/kaze"
    install -Dm755 "$bin_dir/music-player-cli" "$pkgdir/usr/bin/music-player-cli"

    install -Dm644 "$srcdir/kaze.desktop" "$pkgdir/usr/share/applications/kaze.desktop"

    install -Dm644 src-tauri/icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/kaze.png"
    install -Dm644 src-tauri/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/kaze.png"
    install -Dm644 src-tauri/icons/256x256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/kaze.png"
    install -Dm644 src-tauri/icons/512x512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/kaze.png"
}
