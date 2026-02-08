# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
pkgname=playtimed
pkgver=0.4.0
pkgrel=1
pkgdesc="Screen time daemon with personality - parental controls with friendly AI assistant character"
arch=('any')
url="https://github.com/aaronsb/playtimed"
license=('MIT')
depends=(
    'python>=3.10'
    'python-psutil'
    'python-yaml'
    'python-dbus'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
)
optdepends=(
    'kde-cli-tools: For KDE notification integration'
    'python-lz4: For Firefox session file reading (all open tabs)'
)
backup=(
    'etc/playtimed/config.yaml'
)
install=playtimed.install
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/aaronsb/playtimed/archive/v$pkgver.tar.gz"
)
sha256sums=('44ff635ffdff2af6e1ee240b70cbe34b302b2a5ff5da98594518be9d22b3a145')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install Python package
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install systemd service (use the package version)
    install -Dm644 systemd/playtimed.service.pkg "$pkgdir/usr/lib/systemd/system/playtimed.service"

    # Create config directory and install default config
    install -dm755 "$pkgdir/etc/playtimed"
    if [[ -f config/config.yaml ]]; then
        install -Dm644 config/config.yaml "$pkgdir/etc/playtimed/config.yaml"
    else
        # Create minimal default config
        cat > "$pkgdir/etc/playtimed/config.yaml" << EOF
# playtimed configuration
daemon:
  poll_interval: 30
  db_path: /var/lib/playtimed/playtimed.db
  reset_hour: 4
EOF
    fi

    # Create data directory
    install -dm755 "$pkgdir/var/lib/playtimed"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || \
        echo "MIT License" > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md" 2>/dev/null || true
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md" 2>/dev/null || true
}
