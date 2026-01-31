# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: korjjj <korjjj+aur[at]gmail[dot]com>

_pkgname=gns3-server
pkgname="$_pkgname"-2
pkgver=2.2.56.1
pkgrel=1
pkgdesc='GNS3 network simulator, Server package'
arch=('x86_64' 'aarch64')
url="https://github.com/GNS3/$_pkgname"
license=('GPL-3.0-only')
groups=('gns3')
depends=(
    'busybox'
    'python-aiofiles'
    'python-aiohttp'
    'python-aiohttp-cors'
    'python-async-timeout'
    'python-distro'
    'python-jinja'
    'python-jsonschema'
    'python-platformdirs'
    'python-psutil'
    'python-py-cpuinfo'
    'python-sentry_sdk'
    'python-setuptools'
    'python-truststore'
)
optdepends=(
    'dynamips: Cisco router emulator'
    'gns3-gui: graphical user interface for GNS3 server'
    'qemu: Used by GNS3 to run Cisco ASA, PIX and IDS'
    'libvirt: needed for the NAT cloud'
    'vpcs: Simple PC emulation for basic network operations'
    'ubridge: Bridge for UDP tunnels, Ethernet, TAP and VMnet interfaces'
)
conflicts=('gns3-server')
provides=('gns3-server')
install="$_pkgname".install
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$_pkgname@.service"
        "fix_requirements_for_Arch.patch")
sha256sums=('b213493b76c3124a6da348f37cc6dac3f06cf4196a2074009d466c14d33998ed'
            'b43f0ead963a06e613d3303d2c66372b57f46c750b3d6df20eb99c11078de65f'
            'bb35a842e91d86c4f330263f9ef432b8455c36453d37e1b3916ba8637ed65317')

prepare() {
    cd "$_pkgname-$pkgver"
    # Arch usually has the latest versions. Patch requirements to allow them.
    patch --strip=2 -i "$srcdir"/fix_requirements_for_Arch.patch
}

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/$_pkgname@.service" "$pkgdir/usr/lib/systemd/system/$_pkgname@.service"
}
