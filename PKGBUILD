# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=gns3-server
pkgver=2.2.43
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
    'python-async-timeout'
    'python-distro'
    'python-jinja'
    'python-jsonschema'
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
install="$pkgname".install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname@.service"
        "fix_requirements_for_Arch.diff")
sha256sums=('dd1a22837f1a982e4d897f3c01d88c40e719641c6316f3af0d7969217099cb7a'
            'b43f0ead963a06e613d3303d2c66372b57f46c750b3d6df20eb99c11078de65f'
            '21cbba9a3dd61196177dbb6d9a48167b46e971b4156706250e41c7f1b2b1c7c9')

prepare() {
    cd "$pkgname-$pkgver"
    # Arch usually has the latest versions. Patch requirements to allow them.
    patch --strip=2 -i "$srcdir"/fix_requirements_for_Arch.diff
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
