# Maintainer: Hikari <kauaojulio10@gmail.com>
pkgname=klickity
pkgver=1.0.0
pkgrel=1
pkgdesc="Mechanical keyboard sound simulator for Wayland — Rust+Tauri edition (evdev + PipeWire)"
arch=('x86_64')
url="https://github.com/HikariLucky/klickity"
license=('MIT')
depends=(
    'gtk4'
    'libadwaita'
    'pipewire'
    'gstreamer'
    'gst-plugins-base'
    'evdev'
)
makedepends=(
    'rustup'
    'cargo'
    'pkg-config'
    'glib2'
    'gobject-introspection'
    'git'
)
optdepends=('wpctl: PipeWire volume control')
provides=('mechclick')
conflicts=('mechclick')
source=(
    "git+$url.git#tag=v${pkgver}?signed"
    "mechclick.service"
    "mechclick.install"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

validpgpkeys=()  # Add maintainer's PGP key if signing

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}"

    # Setup Rust toolchain
    export RUSTUP_HOME="$srcdir/rustup"
    export CARGO_HOME="$srcdir/cargo"
    rustup default stable 2>/dev/null || rustup install stable
}

build() {
    cd "$srcdir/${pkgname}-${pkgver}"

    export RUSTUP_HOME="$srcdir/rustup"
    export CARGO_HOME="$srcdir/cargo"

    # Compile GResources
    glib-compile-resources \
        --target="gresource.c" \
        --sourcedir="data" \
        --generate \
        --c-name="mechclick_resources" \
        "data/gresource.xml"

    # Build release
    cargo build --release --frozen
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"

    # Binary
    install -Dm755 "target/release/mechclick" "$pkgdir/usr/bin/mechclick"

    # Desktop entry
    install -Dm644 "data/mechclick.desktop" "$pkgdir/usr/share/applications/mechclick.desktop"

    # Icon
    install -Dm644 "data/icons/mechclick-256.svg" "$pkgdir/usr/share/pixmaps/mechclick.svg"

    # Systemd service (user)
    install -Dm644 "$srcdir/mechclick.service" "$pkgdir/usr/lib/systemd/user/mechclick.service"

    # License
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Documentation
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
