# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=gns3-server
pkgver=2.2.20
pkgrel=2
pkgdesc='GNS3 network simulator, Server package'
arch=('x86_64')
url='https://github.com/GNS3/gns3-server'
license=('GPL3')
groups=('gns3')
makedepends=('python-setuptools')
depends=(
    'busybox'
    'python-aiofiles'
    'python-aiohttp'
    'python-aiohttp-cors'
    'python-async_generator'
    'python-async-timeout'
    'python-distro'
    'python-jinja'
    'python-jsonschema'
    'python-prompt_toolkit'
    'python-psutil'
    'python-py-cpuinfo'
    'python-sentry_sdk'
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
        "$pkgname@.service")
sha256sums=('eb4d221a5498f441ad784911a30276d25558f052585262065f2040a0e3b995d4'
            'b43f0ead963a06e613d3303d2c66372b57f46c750b3d6df20eb99c11078de65f')

prepare() {
    cd "$pkgname-$pkgver"
    # Arch usually has the latest versions. Patch requirements to allow them.
    sed -i \
        -e 's|^aiohttp==3\.7\.4.*|aiohttp>=3.7.4|' \
        -e 's|^aiofiles==0\.6\.0$|aiofiles>=0.6.0|' \
        -e 's|^psutil==5\.8\.0$|psutil>=5.8.0|' \
        -e 's|^distro==1\.5\.0$|distro>=1.5.0|' \
        -e 's|^py-cpuinfo==7\.0\.0$|py-cpuinfo>=7.0.0|' \
        requirements.txt
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
