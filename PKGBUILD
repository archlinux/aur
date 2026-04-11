pkgname=openaether
pkgver=0.2.0
pkgrel=1
pkgdesc="Local AI desktop agent for Arch Linux and Hyprland"
arch=('x86_64')
url="https://github.com/Qsenja/OpenAether"
license=('Apache-2.0')
depends=(
    'python'
    'nodejs'
    'npm'
    'electron'
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
)
makedepends=('python-pip')
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

package() {
    cd "$srcdir/OpenAether-$pkgver"

    # Install app to /opt
    install -dm755 "$pkgdir/opt/openaether"
    cp -r . "$pkgdir/opt/openaether/"

    # The venv creation is handled in openaether.install post_install
    # to ensure absolute paths match the target system.

    # Entry point script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/openaether" << 'EOF'
#!/bin/bash
# Start SearXNG if not already running
if ! docker ps --format '{{.Names}}' | grep -q "^searxng$"; then
    echo "[OpenAether] Starting SearXNG..."
    docker run -d \
        --name searxng \
        --restart always \
        -p 8888:8080 \
        searxng/searxng 2>/dev/null || true
    # Enable JSON format
    sleep 2
    docker exec searxng sed -i 's/formats:/formats:\n  - json/' \
        /etc/searxng/settings.yml 2>/dev/null || true
    docker restart searxng 2>/dev/null || true
fi

cd /opt/openaether/frontend
exec electron . "$@"
EOF
    chmod +x "$pkgdir/usr/bin/openaether"

    # .desktop
    install -Dm644 "$srcdir/openaether.desktop" \
        "$pkgdir/usr/share/applications/openaether.desktop"

    # Icon
    install -Dm644 "$srcdir/OpenAether-$pkgver/openaether.svg" \
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

    # Ensure user-writable directories are not created in /opt
    # Runtime dirs are handled by the app itself via platformdirs
    chmod -R 755 "$pkgdir/opt/openaether"
}
