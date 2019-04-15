# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=gns3-server
pkgver=2.1.16
pkgrel=1
pkgdesc='GNS3 network simulator, Server package'
arch=('x86_64')
url='https://github.com/GNS3/gns3-server'
license=('GPL3')
groups=('gns3')
makedepends=('python-setuptools')
depends=('python-jsonschema' 'python-aiohttp-gns3' 'python-aiohttp-cors-gns3'
         'python-yarl-gns3' 'python-jinja' 'python-raven' 'python-psutil'
         'python-zipstream-gns3' 'python-prompt_toolkit-gns3' 'python-async-timeout-gns3'
         'busybox')
optdepends=('dynamips: Cisco router emulator.'
            'gns3-gui: graphical user interface for GNS3 server.'
            'iouyap: Bridge IOU to UDP, TAP and Ethernet.'
            'qemu: Used by GNS3 to run Cisco ASA, PIX and IDS.'
            'vpcs: Simple PC emulation for basic network operations.'
            'ubridge: Bridge for UDP tunnels, Ethernet, TAP and VMnet interfaces.'
)
install="$pkgname".install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname@.service"
        'fix-requirements.diff')
sha256sums=('d41ddb835b6248164675aa5a70240f014c52447e7bead92239c34e3072d17929'
            'b43f0ead963a06e613d3303d2c66372b57f46c750b3d6df20eb99c11078de65f'
            '8727f3e22740b8ccf2333713ce84e02e01326d9c9304660a51c39d1a09afa764')

prepare() {
    cd "$pkgname-$pkgver"
    find . -type f -print0 | xargs -r0 sed -i -e 's/asyncio.async(/asyncio.ensure_future(/g'
    patch -i "$srcdir"/fix-requirements.diff
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
