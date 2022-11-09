# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=gns3-server
pkgver=2.2.35
pkgrel=1
pkgdesc='GNS3 network simulator, Server package'
arch=('x86_64' 'aarch64')
url='https://github.com/GNS3/gns3-server'
license=('GPL3')
groups=('gns3')
depends=(
    'busybox'
    'python-aiofiles'
    'python-aiohttp'
    'python-aiohttp-cors'
    'python-async_generator'
    'python-async-timeout'
    'python-distro'
    'python-importlib_resources'
    'python-jinja'
    'python-jsonschema'
    'python-prompt_toolkit'
    'python-psutil'
    'python-py-cpuinfo'
    'python-sentry_sdk'
    'python-setuptools'
    'python-yarl'
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
        "fix_requirements_for_Arch.diff")
sha256sums=('2c20ddc968a24fd8a77c272071d35304bac0706266a3f9e643658555e634c489'
            'b43f0ead963a06e613d3303d2c66372b57f46c750b3d6df20eb99c11078de65f'
            '29274baf515265f55f6236c41e24cf0da88f99eaf5f5e2947c6dc07375f85b2c')

prepare() {
    # Arch usually has the latest versions. Patch requirements to allow them.
    patch --strip=1 -i fix_requirements_for_Arch.diff
}

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname@.service" "$pkgdir/usr/lib/systemd/system/$pkgname@.service"
}
