# Maintainer: m4rcel-lol <your@email.com>
pkgname=termitune
pkgver=0.1.0
pkgrel=1
pkgdesc="A beautiful, fast TUI MP3 music player for Arch Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/m4rcel-lol/termitune"
license=('MIT')
depends=('alsa-lib' 'gcc-libs')
makedepends=('rust' 'cargo' 'pkgconf')
optdepends=('libpulse: PulseAudio support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')  # Replace with real hash before AUR submission

prepare() {
    cd "TermiTune-$pkgver"
    # Download dependencies (offline build)
    export CARGO_HOME="$srcdir/cargo-home"
    cargo fetch --locked 2>/dev/null || cargo fetch
}

build() {
    cd "TermiTune-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    export RUSTFLAGS="-C opt-level=3 -C lto=thin"
    cargo build --release --locked 2>/dev/null || cargo build --release
}

check() {
    cd "TermiTune-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    cargo test --release 2>/dev/null || true
}

package() {
    cd "TermiTune-$pkgver"

    # Binary
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Docs
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Default config/themes (will be created at runtime if missing)
    # install -Dm644 ...
}
