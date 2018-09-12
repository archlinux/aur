# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Joseph Brains <jnbrains@gmail.com>

_pkgname=gns3-server
pkgname=$_pkgname-git
pkgver=v2.1.9.r26.geb0e26b5
pkgrel=1
pkgdesc='GNS3 network simulator, Server package'
arch=('x86_64')
url='https://github.com/GNS3/gns3-server'
license=('GPL3')
groups=('gns3')
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=('git' 'python-setuptools')
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
install="$_pkgname.install"
source=("$_pkgname::git+git://github.com/GNS3/$_pkgname.git#branch=2.1"
        "$_pkgname@.service")
sha256sums=('SKIP'
            'd145c7a4b7163aecd91b71a0769130d62beb5f4381fe5437774f6b4477a3fa48')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    python setup.py build
}

package() {
    cd "$_pkgname"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 "$srcdir/$_pkgname@.service" "$pkgdir/usr/lib/systemd/system/$_pkgname@.service"
}
