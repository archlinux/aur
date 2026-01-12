# Maintainer: Aaron D. Lee <your-email@example.com>
pkgname=stegasoo-git
pkgver=4.2.1
pkgrel=1
pkgdesc="Secure steganography with hybrid photo + passphrase + PIN authentication"
arch=('x86_64')
url="https://github.com/adlee-was-taken/stegasoo"
license=('MIT')

# Python 3.11-3.14 supported (uses jpeglib for modern Python compatibility)
depends=(
    'python>=3.11'
    'zbar'  # QR code reading for Web UI
)
makedepends=(
    'git'
    'python'
    'python-build'
    'python-hatchling'
)
provides=('stegasoo')
conflicts=('stegasoo')
install=stegasoo-git.install
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

    # Install to /opt/stegasoo with dedicated venv
    install -dm755 "$pkgdir/opt/stegasoo"

    # Create fresh venv in package
    python -m venv "$pkgdir/opt/stegasoo/venv"

    # Install the wheel with all extras
    local wheel=$(ls dist/*.whl | head -1)
    "$pkgdir/opt/stegasoo/venv/bin/pip" install --no-cache-dir "${wheel}[all]"

    # Install frontends (not included in wheel)
    local site_packages="$pkgdir/opt/stegasoo/venv/lib/python${pyver}/site-packages"
    cp -r frontends "$site_packages/"

    # Create writable directories for stegasoo user
    install -dm755 "$pkgdir/opt/stegasoo/venv/var/app-instance"
    install -dm755 "$site_packages/frontends/web/temp_files"
    install -dm755 "$site_packages/frontends/api/temp_files"

    # Fix shebangs - replace build-time paths with installed paths
    find "$pkgdir/opt/stegasoo/venv/bin" -type f -exec \
        sed -i "s|$pkgdir/opt/stegasoo/venv|/opt/stegasoo/venv|g" {} \;

    # Fix pyvenv.cfg
    sed -i "s|$pkgdir||g" "$pkgdir/opt/stegasoo/venv/pyvenv.cfg"

    # Create symlinks to /usr/bin
    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/stegasoo/venv/bin/stegasoo "$pkgdir/usr/bin/stegasoo"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install docs
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Install systemd service files
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/system/stegasoo-web.service" <<EOF
[Unit]
Description=Stegasoo Web UI
After=network.target

[Service]
Type=simple
User=stegasoo
WorkingDirectory=/opt/stegasoo/venv/lib/python${pyver}/site-packages/frontends/web
Environment="PATH=/opt/stegasoo/venv/bin"
ExecStart=/opt/stegasoo/venv/bin/gunicorn -b 127.0.0.1:5000 app:app
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

    install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/system/stegasoo-api.service" <<EOF
[Unit]
Description=Stegasoo REST API (HTTPS)
After=network.target

[Service]
Type=simple
User=stegasoo
WorkingDirectory=/opt/stegasoo/venv/lib/python${pyver}/site-packages/frontends/api
Environment="PATH=/opt/stegasoo/venv/bin"
Environment="HOME=/opt/stegasoo"
# TLS enabled by default - certs auto-generated on first run
# Use stegasoo api tls generate to pre-generate certs
# Use stegasoo api keys create <name> to create API keys
ExecStart=/opt/stegasoo/venv/bin/stegasoo api serve --host 127.0.0.1 --port 8000
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF
}
