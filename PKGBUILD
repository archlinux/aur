# Maintainer: Your Name <your@email.com>
pkgname=mycelica
pkgver=0.8.3
pkgrel=1
_tag=0.8.3-1
pkgdesc="Visual knowledge graph for connected thinking"
arch=('x86_64')
url="https://github.com/Ekats/Mycelica"
license=('AGPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl' 'sqlite' 'zstd')
makedepends=('rust' 'cargo' 'npm' 'nodejs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Ekats/Mycelica/archive/refs/tags/v$_tag.tar.gz")
sha256sums=('SKIP')  # Update after tagging v0.8.3 on GitHub

build() {
    cd "Mycelica-$_tag"
    # Use system sqlite instead of bundled (fixes Arch linking issues)
    sed -i 's/, features = \["bundled"\]//' src-tauri/Cargo.toml

    npm install

    # Create linker wrapper to fix --as-needed issues on Arch Linux
    mkdir -p "$srcdir/bin"
    cat > "$srcdir/bin/cc-wrapper" << 'WRAPPER_EOF'
#!/bin/bash
# Replace --as-needed with --no-as-needed to fix DSO linking issues
args=()
for arg in "$@"; do
    if [[ "$arg" == "-Wl,--as-needed" ]]; then
        args+=("-Wl,--no-as-needed")
    else
        args+=("$arg")
    fi
done
exec cc "${args[@]}"
WRAPPER_EOF
    chmod +x "$srcdir/bin/cc-wrapper"

    # Use wrapper as linker
    mkdir -p src-tauri/.cargo
    cat > src-tauri/.cargo/config.toml << 'CARGO_EOF'
[target.x86_64-unknown-linux-gnu]
linker = "cc-wrapper"
CARGO_EOF
    export PATH="$srcdir/bin:$PATH"

    NO_STRIP=1 npm run tauri build
}

package() {
    cd "Mycelica-$_tag"
    install -Dm755 "src-tauri/target/release/mycelica" "$pkgdir/usr/bin/mycelica"
    install -Dm755 "src-tauri/target/release/mycelica-cli" "$pkgdir/usr/bin/mycelica-cli"
    install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/mycelica.png"

    # Desktop entry
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/mycelica.desktop" <<EOF
[Desktop Entry]
Name=Mycelica
Comment=Visual knowledge graph for connected thinking
Exec=mycelica
Icon=mycelica
Terminal=false
Type=Application
Categories=Office;Utility;
EOF
}
