# Maintainer: Aaron D. Lee <your-email@example.com>
pkgname=stegasoo-api-git
pkgver=4.2.1
pkgrel=1
pkgdesc="Stegasoo REST API with TLS and API key authentication"
arch=('x86_64')
url="https://github.com/adlee-was-taken/stegasoo"
license=('MIT')

# Python 3.11-3.14 supported
depends=(
    'python>=3.11'
    'zbar'  # QR code reading for RSA key extraction
)
makedepends=(
    'git'
    'python'
    'python-build'
    'python-hatchling'
)
optdepends=(
    'libjpeg-turbo: jpegtran for lossless JPEG rotation (DCT-safe)'
)
provides=('stegasoo-api')
conflicts=('stegasoo-api' 'stegasoo' 'stegasoo-git')
install=stegasoo-api-git.install
source=("${pkgname}::git+https://github.com/adlee-was-taken/stegasoo.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || \
    printf "%s.r%s.g%s" "4.2.1" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"

    # Detect Python version for site-packages path
    local pyver=$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')

    # Install to /opt/stegasoo-api with dedicated venv
    install -dm755 "$pkgdir/opt/stegasoo-api"

    # Create fresh venv in package
    python -m venv "$pkgdir/opt/stegasoo-api/venv"

    # Install the wheel with API + CLI + compression extras
    local wheel=$(ls dist/*.whl | head -1)
    "$pkgdir/opt/stegasoo-api/venv/bin/pip" install --no-cache-dir "${wheel}[api,cli,compression]"

    # Install API frontend (not included in wheel by default)
    local site_packages="$pkgdir/opt/stegasoo-api/venv/lib/python${pyver}/site-packages"
    install -dm755 "$site_packages/frontends/api"
    cp -r frontends/api/*.py "$site_packages/frontends/api/"
    cp -r frontends/__init__.py "$site_packages/frontends/" 2>/dev/null || true

    # Create temp directory for API
    install -dm755 "$site_packages/frontends/api/temp_files"

    # Create config directories
    install -dm755 "$pkgdir/opt/stegasoo-api/config"
    install -dm700 "$pkgdir/opt/stegasoo-api/certs"

    # Fix shebangs - replace build-time paths with installed paths
    find "$pkgdir/opt/stegasoo-api/venv/bin" -type f -exec \
        sed -i "s|$pkgdir/opt/stegasoo-api/venv|/opt/stegasoo-api/venv|g" {} \;

    # Fix pyvenv.cfg
    sed -i "s|$pkgdir||g" "$pkgdir/opt/stegasoo-api/venv/pyvenv.cfg"

    # Create symlink to /usr/bin
    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/stegasoo-api/venv/bin/stegasoo "$pkgdir/usr/bin/stegasoo"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install docs
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Install systemd service
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/system/stegasoo-api.service" <<EOF
[Unit]
Description=Stegasoo REST API (HTTPS)
After=network.target

[Service]
Type=simple
User=stegasoo
WorkingDirectory=/opt/stegasoo-api/venv/lib/python${pyver}/site-packages/frontends/api
Environment="PATH=/opt/stegasoo-api/venv/bin"
Environment="HOME=/opt/stegasoo-api"
# TLS enabled by default - certs auto-generated on first run
# Use: stegasoo api tls generate (to pre-generate certs)
# Use: stegasoo api keys create <name> (to create API keys)
ExecStart=/opt/stegasoo-api/venv/bin/stegasoo api serve --host 127.0.0.1 --port 8000
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF
}
