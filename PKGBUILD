# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=gns3-gui
pkgver=3.0.0
pkgrel=1
pkgdesc='GNS3 network simulator. Graphical user interface package.'
arch=(any)
url='https://github.com/GNS3/gns3-gui'
license=(GPL-3.0-only)
groups=(gns3)
depends=(
    desktop-file-utils
    python-distro
    python-jsonschema
    python-psutil
    python-pyqt5
    python-pyqt5-sip
    python-sentry_sdk
    python-truststore
    qt5-svg
    qt5-websockets
)
makedepends=(
    python-build
    python-installer
    python-setuptools
)
optdepends=(
    'gns3-server: GNS3 backend. Manages emulators such as Dynamips, VirtualBox or Qemu/KVM'
    'xterm: Default terminal emulator for CLI management of virtual instances'
    'wireshark-qt: Live packet capture')
source=("$pkgname-$pkgver.tar.gz::https://github.com/GNS3/$pkgname/archive/v$pkgver.tar.gz"
        gns3.desktop
        fix_requirements_for_Arch.diff)
sha256sums=('e522a9189395cd34e75e2a6b0cba5e225fd3161681b12449909de0a2f835d0c0'
            '51e6db5b47e6af3d008d85e8c597755369fafb75ddb2af9e79a441f943f4c166'
            'e2733e2d148c814b9a518e2d3ac94af6d26dc62b98cfa94e2d634280efcf05d7')

prepare() {
    cd "$pkgname-$pkgver"
    # Arch usually has the latest versions. Patch requirements to allow them.
    patch --strip=2 -i "$srcdir"/fix_requirements_for_Arch.diff
}

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir"/gns3.desktop "$pkgdir"/usr/share/applications/gns3.desktop
    install -Dm644 resources/images/gns3_icon_256x256.png "$pkgdir"/usr/share/pixmaps/gns3.png
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
