# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: korjjj <korjjj+aur[at]gmail[dot]com>

pkgname=gns3-gui
pkgver=3.1.0a2
pkgrel=1
pkgdesc='GNS3 network simulator. Graphical user interface package.'
arch=(any)
url="https://github.com/GNS3/$pkgname"
license=(GPL-3.0-only)
groups=(gns3)
depends=(
    desktop-file-utils
    python-distro
    python-jsonschema
    python-psutil
    python-pyqt6
    python-qdarkstyle
    python-truststore
    qt6-svg
    qt6-websockets
)
makedepends=(
    python-build
    python-installer
    python-setuptools
)
optdepends=(
    'gns3-server: GNS3 backend. Manages emulators such as Dynamips, VirtualBox or Qemu/KVM'
    'python-sentry_sdk: Python SDK for Sentry.io'
    'xterm: Default terminal emulator for CLI management of virtual instances'
    'wireshark-qt: Live packet capture')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        gns3.desktop
        fix_requirements_for_Arch.patch)
sha256sums=('b5c139f6c5e9450c2afc27c105ecf50430a48381337efd80275d10aa448574cd'
            '51e6db5b47e6af3d008d85e8c597755369fafb75ddb2af9e79a441f943f4c166'
            '5a3e8838ced932f14c68d5656c48738556907603652ade4480a44a0617f1351d')

prepare() {
    cd "$pkgname-$pkgver"
    # Arch usually has the latest versions. Patch requirements to allow them.
    patch --strip=2 -i "$srcdir"/fix_requirements_for_Arch.patch
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
