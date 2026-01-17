# Maintainer: Tobias Brox <t-arch@tobixen.no>
pkgname=inventory-md
pkgver=0.3.2
pkgrel=1
pkgdesc="A flexible markdown-based inventory management system"
url="https://github.com/tobixen/inventory-md"
arch=('any')
license=('GPL-3.0-or-later')
depends=('python' 'python-pillow')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-hatch-vcs')
optdepends=(
    'python-fastapi: API server and chat functionality'
    'python-uvicorn: API server'
    'python-anthropic: Claude AI chat integration'
    'python-pyzbar: Barcode scanning'
    'python-easyocr: OCR text extraction'
)
backup=('etc/inventory-system/example.conf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tobixen/inventory-md/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7c32ccba98736678f58760fe906090ea57603b85be7b552256538b29eeeb4d0b')

build() {
    cd "${pkgname}-${pkgver}"
    export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install systemd service files
    install -Dm644 systemd/inventory-api@.service "$pkgdir/usr/lib/systemd/system/inventory-api@.service"
    install -Dm644 systemd/inventory-web@.service "$pkgdir/usr/lib/systemd/system/inventory-web@.service"

    # Fix ExecStart path for system-wide installation
    sed -i 's|/opt/inventory-md/venv/bin/inventory-md|/usr/bin/inventory-md|g' \
        "$pkgdir/usr/lib/systemd/system/inventory-api@.service" \
        "$pkgdir/usr/lib/systemd/system/inventory-web@.service"

    # Install example configuration
    install -Dm644 /dev/stdin "$pkgdir/etc/inventory-system/example.conf" << 'CONF'
# Inventory System Configuration
# Copy this file to /etc/inventory-system/<instance>.conf
# and adjust the values for your instance.

# Path to inventory directory (containing inventory.md/inventory.json)
INVENTORY_PATH=/var/lib/inventory/myinstance

# API server port
API_PORT=8765

# API server host (use 0.0.0.0 to listen on all interfaces)
API_HOST=127.0.0.1

# Web server port (optional, for static file serving)
WEB_PORT=8080

# Anthropic API key for Claude chat (optional)
#ANTHROPIC_API_KEY=sk-ant-...
CONF
}
