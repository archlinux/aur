# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=gns3-server
pkgver=3.0.4
pkgrel=1
pkgdesc='GNS3 network simulator, Server package'
arch=(x86_64 aarch64)
url='https://github.com/GNS3/gns3-server'
license=(GPL-3.0-only)
groups=(gns3)
depends=(
    busybox
    python-aiofiles
    python-aiohttp
    python-aiosqlite
    python-alembic
    python-bcrypt
    python-distro
    python-email-validator
    python-fastapi
    python-greenlet
    python-jinja
    python-joserfc
    python-platformdirs
    python-py-cpuinfo
    python-pydantic
    python-python-multipart
    python-psutil
    python-sentry_sdk
    python-sqlalchemy
    python-truststore
    python-watchdog
    python-websockets
    python-zstandard
    uvicorn
)
makedepends=(
    python-build
    python-installer
    python-setuptools
)
optdepends=(
    'dynamips: Cisco router emulator'
    'gns3-gui: graphical user interface for GNS3 server'
    'qemu: Used by GNS3 to run Cisco ASA, PIX and IDS'
    'libvirt: needed for the NAT cloud'
    'vpcs: Simple PC emulation for basic network operations'
    'ubridge: Bridge for UDP tunnels, Ethernet, TAP and VMnet interfaces'
)
install="$pkgname".install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname@.service"
        fix_requirements_for_Arch.diff)
sha256sums=('5ca90ec369d11ea83e652cb0ee45e642b201619e90b54d2bbeacbf88a33f86e8'
            'b43f0ead963a06e613d3303d2c66372b57f46c750b3d6df20eb99c11078de65f'
            'c3f2cd29c43ed1e575ea8f4cb873ec2bf6b3f3993cce864edef48a628afb766f')

prepare() {
    cd "$pkgname-$pkgver"
    # Arch usually has the latest versions. Patch requirements to allow them.
    patch --strip=2 -i "$srcdir"/fix_requirements_for_Arch.diff
}

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/$pkgname@.service" "$pkgdir/usr/lib/systemd/system/$pkgname@.service"
}
