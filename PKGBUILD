# Maintainer: Different AI <team@different.ai>
pkgname=openwork-git
pkgver=0.2.9.r0.g0000000
pkgrel=1
pkgdesc="Open-source alternative to Claude Cowork - mobile-first Tauri app"
arch=('x86_64')
url="https://github.com/different-ai/openwork"
license=('MIT')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'glib2'
    'libsoup3'
    'openssl'
    'dbus'
    'librsvg'
    'libayatana-appindicator'
)
makedepends=(
    'git'
    'rust'
    'cargo'
    'nodejs'
    'pnpm'
    'curl'
    'unzip'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/different-ai/openwork.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || \
        printf "0.2.9.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname}"
    
    # Download opencode sidecar
    echo "Downloading OpenCode sidecar..."
    local opencode_version
    opencode_version=$(curl -fsSL https://api.github.com/repos/anomalyco/opencode/releases/latest | \
        sed -n 's/.*"tag_name": *"v\([^"]*\)".*/\1/p')
    
    if [[ -z "$opencode_version" ]]; then
        opencode_version="1.1.25"
    fi
    
    local opencode_url="https://github.com/anomalyco/opencode/releases/download/v${opencode_version}/opencode-linux-x64-baseline.tar.gz"
    
    mkdir -p packages/desktop/src-tauri/sidecars
    curl -fsSL "$opencode_url" | tar -xz -C packages/desktop/src-tauri/sidecars/
    mv packages/desktop/src-tauri/sidecars/opencode \
       packages/desktop/src-tauri/sidecars/opencode-x86_64-unknown-linux-gnu
    chmod 755 packages/desktop/src-tauri/sidecars/opencode-x86_64-unknown-linux-gnu
}

build() {
    cd "${srcdir}/${pkgname}"
    
    export CARGO_HOME="${srcdir}/cargo"
    export RUSTUP_TOOLCHAIN=stable
    
    # Install npm dependencies
    pnpm install --frozen-lockfile
    
    # Build frontend
    cd packages/desktop
    pnpm build:web
    
    # Build Tauri app
    cd src-tauri
    cargo build --release --locked
}

package() {
    cd "${srcdir}/${pkgname}"
    
    # Install binary
    install -Dm755 "packages/desktop/src-tauri/target/release/openwork" \
        "${pkgdir}/usr/bin/openwork"
    
    # Install opencode sidecar
    install -Dm755 "packages/desktop/src-tauri/sidecars/opencode-x86_64-unknown-linux-gnu" \
        "${pkgdir}/usr/lib/openwork/opencode"
    
    # Create wrapper script that sets sidecar path
    cat > "${pkgdir}/usr/bin/openwork" << 'EOF'
#!/bin/bash
export OPENWORK_SIDECAR_DIR=/usr/lib/openwork
exec /usr/lib/openwork/openwork "$@"
EOF
    
    # Move actual binary to lib
    install -Dm755 "packages/desktop/src-tauri/target/release/openwork" \
        "${pkgdir}/usr/lib/openwork/openwork"
    chmod 755 "${pkgdir}/usr/bin/openwork"
    
    # Install desktop file
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/openwork.desktop" << EOF
[Desktop Entry]
Name=OpenWork
Comment=Open-source alternative to Claude Cowork
Exec=openwork
Icon=openwork
Type=Application
Categories=Development;Utility;
Terminal=false
EOF
    
    # Install icons
    for size in 32 128 256; do
        if [[ -f "packages/desktop/src-tauri/icons/${size}x${size}.png" ]]; then
            install -Dm644 "packages/desktop/src-tauri/icons/${size}x${size}.png" \
                "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/openwork.png"
        fi
    done
    
    # License
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || \
        echo "MIT License" > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
