# Maintainer: Aaron D. Lee <your-email@example.com>
pkgname=stegasoo-git
pkgver=4.1.7.r0.g1acb5a3
pkgrel=1
pkgdesc="Secure steganography with hybrid photo + passphrase + PIN authentication"
arch=('x86_64')
url="https://github.com/adlee-was-taken/stegasoo"
license=('MIT')

# NOTE: Requires Python 3.12 (jpegio not compatible with 3.13 yet)
depends=(
    'python312'  # AUR package - jpegio requires 3.12
)
makedepends=(
    'git'
    'python312'
)
optdepends=(
    'zbar: QR code reading from webcam/images'
)
provides=('stegasoo')
conflicts=('stegasoo')
source=("${pkgname}::git+https://github.com/adlee-was-taken/stegasoo.git#branch=main")
sha256sums=('SKIP')

# Python 3.12 from AUR package
_python="/usr/bin/python3.12"

pkgver() {
    cd "$pkgname"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || \
    printf "%s.r%s.g%s" "4.2.0" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"

    echo "Using Python: $_python ($($_python --version))"

    # Bootstrap pip for python312
    $_python -m ensurepip --user --upgrade

    # Install build dependencies
    $_python -m pip install --user build hatchling

    # Build wheel
    $_python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"

    # Install to /opt/stegasoo with dedicated venv
    install -dm755 "$pkgdir/opt/stegasoo"

    # Create fresh venv in package
    $_python -m venv "$pkgdir/opt/stegasoo/venv"

    # Install the wheel with all extras
    local wheel=$(ls dist/*.whl | head -1)
    "$pkgdir/opt/stegasoo/venv/bin/pip" install --no-cache-dir "${wheel}[all]"

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
Environment="PATH=/opt/stegasoo/venv/bin"
ExecStart=/opt/stegasoo/venv/bin/gunicorn -b 127.0.0.1:5000 app:app
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

    install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/system/stegasoo-api.service" <<EOF
[Unit]
Description=Stegasoo REST API
After=network.target

[Service]
Type=simple
User=stegasoo
Environment="PATH=/opt/stegasoo/venv/bin"
ExecStart=/opt/stegasoo/venv/bin/uvicorn main:app --host 127.0.0.1 --port 8000
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF
}
