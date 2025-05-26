# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=gns3-server
pkgver=3.0.5
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
    'python-sentry_sdk: Python SDK for Sentry.io'
    'vpcs: Simple PC emulation for basic network operations'
    'ubridge: Bridge for UDP tunnels, Ethernet, TAP and VMnet interfaces'
)
install="$pkgname".install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname@.service"
        fix_requirements_for_Arch.diff)
sha256sums=('1126af5aa8f04b0a606654ae6f13f4ea58f352a8be051b1952dfdd494257f999'
            'b43f0ead963a06e613d3303d2c66372b57f46c750b3d6df20eb99c11078de65f'
            '9529f53b4a81e47e5b27dda8a098a68749a614b48b28d6f04a28113bd0975608')

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
