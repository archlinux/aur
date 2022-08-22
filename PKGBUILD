# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Joseph Brains <jnbrains@gmail.com>

_pkgname=gns3-server
pkgname=$_pkgname-git
pkgver=v2.2.33.1.r4.g3634cc83
pkgrel=1
pkgdesc='GNS3 network simulator, Server package'
arch=('x86_64' 'aarch64')
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
)
optdepends=(
    'dynamips: Cisco router emulator'
    'gns3-gui-git: graphical user interface for GNS3 server'
    'qemu: Used by GNS3 to run Cisco ASA, PIX and IDS'
    'libvirt: needed for the NAT cloud'
    'vpcs: Simple PC emulation for basic network operations'
    'ubridge: Bridge for UDP tunnels, Ethernet, TAP and VMnet interfaces'
)
install="$_pkgname.install"
source=("$_pkgname::git+https://github.com/GNS3/$_pkgname.git"
        "$_pkgname@.service")
sha256sums=('SKIP'
            'b43f0ead963a06e613d3303d2c66372b57f46c750b3d6df20eb99c11078de65f')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    # Arch usually has the latest versions. Patch requirements to allow them.
    sed -i \
        -e 's|^aiohttp==3\.7\.4.*|aiohttp>=3.7.4|' \
        -e 's|^aiofiles==0\.7\.0$|aiofiles>=0.7.0|' \
        -e 's|^Jinja2==3\.0\.1$|Jinja2>=3.0.1|' \
        -e 's|^sentry-sdk==1\.1\.0$|sentry-sdk>=1.1.0|' \
        -e 's|^psutil==5\.8\.0$|psutil>=5.8.0|' \
        -e 's|^distro==1\.5\.0$|distro>=1.5.0|' \
        -e 's|^py-cpuinfo==8\.0\.0$|py-cpuinfo>=8.0.0|' \
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
