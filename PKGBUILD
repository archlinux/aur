pkgname=openaether
pkgver=0.2.2
pkgrel=1
pkgdesc="Local AI desktop agent for Arch Linux and Hyprland"
arch=('x86_64')
url="https://github.com/Qsenja/OpenAether"
license=('Apache-2.0')
depends=(
    'python>=3.10'
    'nodejs>=22'
    'npm>=10'
    'bubblewrap'
    'docker'
    'python-websockets'
    'python-requests'
    'python-beautifulsoup4'
    'python-pillow'
    'python-yaml'
    'python-httpx'
    'python-psutil'
    'python-platformdirs'
    'python-pip'
    'tesseract'
    'python-json5'
    'ollama'
    'webkit2gtk' 
)
makedepends=('python-pip' 'rust>=1.80' 'cargo' 'pkg-config' 'openssl')
install=openaether.install
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/Qsenja/OpenAether/archive/v$pkgver.tar.gz"
    "openaether.desktop"
)
sha256sums=('SKIP' 'SKIP')

prepare() {
    cd "$srcdir/OpenAether-$pkgver/frontend"
    npm install
}

build() {
    # 1. Build Frontend
    cd "$srcdir/OpenAether-$pkgver/frontend"
    npm run build

    # 2. Build Backend (Rust)
    cd "$srcdir/OpenAether-$pkgver/backend"
    cargo build --release
}

package() {
    cd "$srcdir/OpenAether-$pkgver"

    # Install to /opt/openaether
    install -dm755 "$pkgdir/opt/openaether"
    
    # We only need the binary, logic files and assets for runtime
    install -Dm755 "backend/target/release/openaether" "$pkgdir/opt/openaether/openaether"
    cp -r "logic" "$pkgdir/opt/openaether/"
    cp "openaether.svg" "$pkgdir/opt/openaether/"

    # Entry point wrapper
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/openaether" << 'EOF'
#!/bin/bash
# Start SearXNG if not already running (Automated via .install but checked here for safety)
if ! docker ps --format '{{.Names}}' | grep -q "^searxng$"; then
    echo "[OpenAether] SearXNG not detected. Please ensure docker is running."
fi

cd /opt/openaether
# Run the application
exec ./openaether "$@"
EOF
    chmod +x "$pkgdir/usr/bin/openaether"

    # .desktop file
    install -Dm644 "$srcdir/openaether.desktop" \
        "$pkgdir/usr/share/applications/openaether.desktop"

    # Icon file
    install -Dm644 "openaether.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/openaether.svg"

    # systemd service for SearXNG
    install -dm755 "$pkgdir/usr/lib/systemd/system"
    cat > "$pkgdir/usr/lib/systemd/system/openaether-searxng.service" << 'EOF'
[Unit]
Description=OpenAether SearXNG Search Instance
After=docker.service
Requires=docker.service

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/bin/docker start searxng
ExecStop=/usr/bin/docker stop searxng

[Install]
WantedBy=multi-user.target
EOF

    # Ensure correct permissions
    chmod -R 755 "$pkgdir/opt/openaether"
}
