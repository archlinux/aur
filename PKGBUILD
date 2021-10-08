# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=gns3-gui
pkgver=2.2.26
pkgrel=1
pkgdesc='GNS3 network simulator. Graphical user interface package.'
arch=('any')
url='https://github.com/GNS3/gns3-gui'
license=('GPL3')
groups=('gns3')
depends=(
    'desktop-file-utils'
    'python-distro'
    'python-jsonschema'
    'python-psutil'
    'python-pyqt5'
    'python-sentry_sdk'
    'python-setuptools'
    'python-sip'
    'qt5-svg'
    'qt5-websockets'
)
optdepends=(
    'gns3-server: GNS3 backend. Manages emulators such as Dynamips, VirtualBox or Qemu/KVM'
    'xterm: Default terminal emulator for CLI management of virtual instances'
    'wireshark-qt: Live packet capture')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GNS3/$pkgname/archive/v$pkgver.tar.gz"
        'gns3.desktop')
sha256sums=('b97084e1024dfc23255fa0bdd1023a9b145ba610322a8363cd15d9153837333d'
            '51e6db5b47e6af3d008d85e8c597755369fafb75ddb2af9e79a441f943f4c166')

prepare() {
    cd "$pkgname-$pkgver"
    # Arch usually has the latest versions. Patch requirements to allow them.
    sed -i \
        -e 's|^psutil==5\.8\.0$|psutil>=5.8.0|' \
        -e 's|^sentry-sdk==1\.3\.1$|sentry-sdk>=1.3.1|' \
        -e 's|^distro==1\.6\.0$|distro>=1.6.0|' \
        requirements.txt
}

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 "$srcdir"/gns3.desktop "$pkgdir"/usr/share/applications/gns3.desktop
  install -Dm644 resources/images/gns3_icon_256x256.png "$pkgdir"/usr/share/pixmaps/gns3.png
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
