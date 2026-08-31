# Maintainer: Roy <roymedina@me.com>
pkgname=observer-ai
pkgver=2.5.4
pkgrel=1
pkgdesc="Observer - AI-powered application built with Tauri"
arch=('x86_64')
url="https://github.com/Roy3838/Observer"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
makedepends=('git' 'openssl' 'libappindicator-gtk3' 'librsvg' 'cargo' 'pnpm' 'nodejs' 'cargo-tauri' 'clang')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Roy3838/Observer/archive/v$pkgver.tar.gz")
sha256sums=('26408534a4e9c2584f7bbaa2037cf229d8093212f27b06a6fcb8cb0cf19ad2a7')

prepare() {
    cd "$srcdir/Observer-$pkgver/app"
    # Disable updater artifacts for AUR build to avoid signing errors
    sed -i 's/"createUpdaterArtifacts": true/"createUpdaterArtifacts": false/' desktop/tauri.conf.json
    # pnpm v11 requires allowBuilds in pnpm-workspace.yaml; create it since it's not in the tarball
#     cat > pnpm-workspace.yaml << 'EOF'
# allowBuilds:
#   browser-tabs-lock: true
#   esbuild: true
#   onnxruntime-node: true
#   protobufjs: true
#   sharp: true
#   tesseract.js: true
# onlyBuiltDependencies:
#   - onnxruntime-node
# EOF
    pnpm install
}

build() {
    # Set environment variables to fix ring crate compilation
    export CC=gcc
    export CXX=g++
    export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=gcc
    export PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
    # Fix ring crate compilation issues
    export CFLAGS="-fPIC -O2"
    export CXXFLAGS="-fPIC -O2"
    export LDFLAGS="-Wl,-z,now -Wl,-z,relro"
    export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_RUSTFLAGS="-C target-cpu=native"

    # Build the observe CLI sidecar first
    cargo build --release --manifest-path "$srcdir/Observer-$pkgver/cli/Cargo.toml"
    mkdir -p "$srcdir/Observer-$pkgver/app/desktop/binaries"
    cp "$srcdir/Observer-$pkgver/cli/target/release/observe" \
       "$srcdir/Observer-$pkgver/app/desktop/binaries/observe-x86_64-unknown-linux-gnu"

    cd "$srcdir/Observer-$pkgver/app"
    # Disable signing for packaging
    unset TAURI_SIGNING_PRIVATE_KEY
    unset TAURI_SIGNING_PRIVATE_KEY_PASSWORD
    # Build frontend first
    pnpm build
    # Build desktop app with only deb bundle to avoid linking issues
    cd desktop
    cargo tauri build -b deb
}

package() {
    cd "$srcdir/Observer-$pkgver"
    # Install the binaries
    install -Dm755 "app/desktop/target/release/app" "$pkgdir/usr/bin/observer-ai"
    install -Dm755 "cli/target/release/observe" "$pkgdir/usr/bin/observe"
    
    # Install the static files that Tauri expects
    install -dm755 "$pkgdir/usr/lib/Observer/_up_"
    cp -r "app/dist" "$pkgdir/usr/lib/Observer/_up_/"
}
