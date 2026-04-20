# Maintainer: David O Neill <dmz.oneill@gmail.com>
pkgname=dfakeseeder
pkgver=1.1.6
pkgrel=1
pkgdesc="BitTorrent seeding simulator for testing and development"
arch=('any')
url="https://github.com/dmzoneill/DFakeSeeder"
license=('MIT')
depends=(
    'python>=3.11'
    'python-pip'
    'python-requests>=2.31.0'
    'python-urllib3>=1.26.18'
    'python-watchdog>=4.0.0'
    'python-gobject>=3.42.0'
    'python-typer>=0.12.3'
    'python-bencodepy>=0.9.5'
    'python-aiohttp>=3.8.0'
    'python-pycryptodome>=3.15.0'
    'python-psutil>=5.9.0'
    'gtk4'
    'libadwaita'
)
optdepends=(
    'libappindicator-gtk3: system tray support'
    'libnotify: desktop notifications'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dmzoneill/DFakeSeeder/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "DFakeSeeder-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "DFakeSeeder-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install desktop file
    install -Dm644 "d_fake_seeder/components/images/dfakeseeder.desktop" \
        "$pkgdir/usr/share/applications/dfakeseeder.desktop" 2>/dev/null || true

    # Install icons
    for size in 16 32 48 64 128 256; do
        icon="d_fake_seeder/components/images/${size}x${size}/dfakeseeder.png"
        if [ -f "$icon" ]; then
            install -Dm644 "$icon" \
                "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/dfakeseeder.png"
        fi
    done
}
