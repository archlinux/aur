# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: korjjj <korjjj+aur[at]gmail[dot]com>

_pkgname=gns3-gui
pkgname="$_pkgname"-2
pkgver=2.2.52
pkgrel=1
pkgdesc='GNS3 network simulator. Graphical user interface package.'
arch=('any')
url="https://github.com/GNS3/$_pkgname"
license=('GPL-3.0-only')
groups=('gns3')
depends=(
    'desktop-file-utils'
    'python-distro'
    'python-jsonschema'
    'python-psutil'
    'python-pyqt5'
    'python-pyqt5-sip'
    'python-sentry_sdk'
    'python-setuptools'
    'python-truststore'
    'qt5-svg'
    'qt5-websockets'
)
optdepends=(
    'gns3-server: GNS3 backend. Manages emulators such as Dynamips, VirtualBox or Qemu/KVM'
    'xterm: Default terminal emulator for CLI management of virtual instances'
    'wireshark-qt: Live packet capture')
conflicts=('gns3-gui')
provides=('gns3-gui')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'gns3.desktop'
        'fix_requirements_for_Arch.diff')
sha256sums=('ff854f1403a99887c132daa210663c2b9b28ab5e8062500a8dc349e897b4c5c1'
            '51e6db5b47e6af3d008d85e8c597755369fafb75ddb2af9e79a441f943f4c166'
            '4174c91317fce6795b7a665ec26944107d9d2a41ee04a23eb782d4fc97207117')

prepare() {
    cd "$_pkgname-$pkgver"
    # Arch usually has the latest versions. Patch requirements to allow them.
    patch --strip=2 -i "$srcdir"/fix_requirements_for_Arch.diff
}

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 "$srcdir"/gns3.desktop "$pkgdir"/usr/share/applications/gns3.desktop
  install -Dm644 resources/images/gns3_icon_256x256.png "$pkgdir"/usr/share/pixmaps/gns3.png
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
