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
    'gst-plugins-good'  # Para codecs de áudio
)
makedepends=(
    'rust'
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

validpgpkeys=()  # Adicionar chave PGP do mantenedor se usar signed commits

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}"
    
    # Garantir toolchain Rust
    export RUSTUP_HOME="$srcdir/rustup"
    export CARGO_HOME="$srcdir/cargo"
    rustup default stable 2>/dev/null || true
    
    # Baixar dependências do Cargo
    cargo fetch --locked
}

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    
    export RUSTUP_HOME="$srcdir/rustup"
    export CARGO_HOME="$srcdir/cargo"
    
    # Compilar GResources (GTK4/Adwaita)
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
    
    # Binário principal
    install -Dm755 "target/release/mechclick" "$pkgdir/usr/bin/mechclick"
    
    # Desktop entry
    install -Dm644 "data/mechclick.desktop" "$pkgdir/usr/share/applications/mechclick.desktop"
    
    # Ícone
    install -Dm644 "data/icons/mechclick-256.svg" "$pkgdir/usr/share/pixmaps/mechclick.svg"
    
    # Sons (se existirem)
    if [ -d "data/sounds" ]; then
        install -dm755 "$pkgdir/usr/share/klickity/sounds"
        cp -r data/sounds/* "$pkgdir/usr/share/klickity/sounds/"
    fi
    
    # Schema (se existir)
    if [ -d "data/schemas" ]; then
        install -dm755 "$pkgdir/usr/share/glib-2.0/schemas"
        cp -r data/schemas/* "$pkgdir/usr/share/glib-2.0/schemas/"
    fi
    
    # Systemd user service
    install -Dm644 "$srcdir/mechclick.service" "$pkgdir/usr/lib/systemd/user/mechclick.service"
    
    # License
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Documentation
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
