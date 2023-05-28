# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Joseph Brains <jnbrains@gmail.com>

_pkgname=gns3-gui
pkgname="$_pkgname"-git
pkgver=v2.2.39.r2.g7654681a
pkgrel=1
pkgdesc='GNS3 network simulator. Graphical user interface package.'
arch=('any')
url='https://github.com/GNS3/gns3-gui'
license=('GPL3')
groups=('gns3')
provides=('gns3-gui')
conflicts=('gns3-gui')
makedepends=('git')
depends=(
    'desktop-file-utils'
    'python-distro'
    'python-jsonschema'
    'python-psutil'
    'python-pyqt5'
    'python-pyqt5-sip'
    'python-sentry_sdk'
    'python-setuptools'
    'qt5-svg'
    'qt5-websockets'
)
optdepends=(
    'gns3-server: GNS3 backend. Manages emulators such as Dynamips, VirtualBox or Qemu/KVM'
    'xterm: Default terminal emulator for CLI management of virtual instances'
    'wireshark-qt: Live packet capture')
source=("$_pkgname::git+https://github.com/GNS3/$_pkgname.git"
        'gns3.desktop'
        'requirements.txt')
sha256sums=('SKIP'
            '51e6db5b47e6af3d008d85e8c597755369fafb75ddb2af9e79a441f943f4c166'
            '0eb0aaa527346f7c120f9305d60994375380facefe03c5dc7c13e50f1122c976')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    # Arch usually has the latest versions. Patch requirements to allow them.
    cp "$srcdir"/requirements.txt .
}

build() {
    cd "$_pkgname"
    python setup.py build
}

package() {
    cd "$_pkgname"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 "$srcdir"/gns3.desktop "$pkgdir"/usr/share/applications/gns3.desktop
    install -Dm644 resources/images/gns3_icon_256x256.png "$pkgdir"/usr/share/pixmaps/gns3.png
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
