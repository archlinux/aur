# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=gns3-server
pkgver=2.1.18
pkgrel=2
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
        "$pkgname@.service")
sha256sums=('b9678b8d44be57bf421072f314e52b895133f6ef447cec1a060b1eca0b2f84a0'
            'b43f0ead963a06e613d3303d2c66372b57f46c750b3d6df20eb99c11078de65f')

prepare() {
    cd "$pkgname-$pkgver"
    sed -i -e '/^typing>=3\.5\.3\.0/d' -e '/^async-timeout<3\.0\.0/d' requirements.txt
    echo 'async-timeout>=3.0.0' >> requirements.txt
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
