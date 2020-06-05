# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Joseph Brains <jnbrains@gmail.com>

_pkgname=gns3-server
pkgname=$_pkgname-git
pkgver=v2.2.9.r0.gc0c81514
pkgrel=1
pkgdesc='GNS3 network simulator, Server package'
arch=('x86_64')
url='https://github.com/GNS3/gns3-server'
license=('GPL3')
groups=('gns3')
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=('git' 'python-setuptools')
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
    'python-zipstream-gns3'
)
optdepends=(
    'dynamips: Cisco router emulator.'
    'gns3-gui-git: graphical user interface for GNS3 server.'
    'iouyap: Bridge IOU to UDP, TAP and Ethernet.'
    'qemu: Used by GNS3 to run Cisco ASA, PIX and IDS.'
    'libvirt: needed for the NAT cloud'
    'vpcs: Simple PC emulation for basic network operations.'
    'ubridge: Bridge for UDP tunnels, Ethernet, TAP and VMnet interfaces.'
)
install="$_pkgname.install"
source=("$_pkgname::git+git://github.com/GNS3/$_pkgname.git"
        "$_pkgname@.service")
sha256sums=('SKIP'
            'd145c7a4b7163aecd91b71a0769130d62beb5f4381fe5437774f6b4477a3fa48')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    sed -i \
        -e 's|^aiofiles==0\.4\.0$|aiofiles>=0.4.0|' \
        -e 's|^psutil==5\.6\.6$|psutil>=5.6.6|' \
        requirements.txt
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
