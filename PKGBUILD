# Maintainer: Music Player Contributors <https://github.com/selfAnnihilator/kaze>
pkgname=kaze
pkgver=1.0.9
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
    '2d82b342545b2b95a54082562e0baeb5aef6ea7801e19066c52149f6de86d57c'
    'eaf39dc7d4a05cefeb1543018e5a2ae84148343e3b5a8de50ba365087d43dd0c'
)

prepare() {
    # A rustup package can satisfy makedepends without an installed toolchain.
    # Check the executable toolchain before spending time on the frontend build.
    if ! cargo --version >/dev/null 2>&1 || ! rustc --version >/dev/null 2>&1; then
        error "Kaze needs a working Rust toolchain (Cargo and rustc)."
        error "Fresh Arch installation: install rust with 'sudo pacman -Syu --needed rust'."
        error "Already using rustup: run 'rustup default stable', then retry."
        error "See INSTALL.md for Cargo provider selection and troubleshooting."
        return 1
    fi
}

build() {
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
