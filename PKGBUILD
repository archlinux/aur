# Maintainer: Dresden Wildey <dresden196@users.noreply.github.com>
pkgname=clickpaste
pkgver=1.0.0
pkgrel=1
pkgdesc="Paste clipboard contents as simulated keystrokes - for KVMs, VMs, and restricted applications"
arch=('x86_64')
url="https://github.com/dresden196/clickpaste-linux"
license=('BSD-3-Clause')
depends=(
    'qt6-base'
    'kglobalaccel'
    'layer-shell-qt'
    'ydotool'
    'wl-clipboard'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
    'qt6-tools'
)
optdepends=(
    'plasma-desktop: Full KDE Plasma integration'
)
install=clickpaste.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9a779a1a7241b46f2600e2e82be69e6489449e7a932807092fdb17e67f7e2354')

build() {
    cd "$pkgname-linux-$pkgver"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build
}

package() {
    cd "$pkgname-linux-$pkgver"
    DESTDIR="$pkgdir" cmake --install build

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install systemd service for ydotoold
    install -Dm644 packaging/systemd/ydotoold.service "$pkgdir/usr/lib/systemd/system/ydotoold.service"
    install -Dm644 packaging/systemd/ydotoold.conf "$pkgdir/usr/lib/tmpfiles.d/ydotoold.conf"
}
