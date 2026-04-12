# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
pkgname=bosectl-qt
pkgver=0.1.0
pkgrel=1
pkgdesc="Qt6 system tray app for controlling Bose headphones via the BMAP protocol"
arch=('x86_64' 'aarch64')
url="https://github.com/aaronsb/bosectl-qt"
license=('MIT')
depends=(
    'qt6-base'
    'bluez-libs'
    'bluez'
)
makedepends=(
    'cmake'
    'git'
    'gcc'
)
# The bosectl submodule commit that this release is pinned to.
# Bump along with the main pkgver when updating.
_bosectl_commit=d9bd104a940fafbcd597f3dabcc62ecd8b3be6d2
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/aaronsb/bosectl-qt/archive/v$pkgver.tar.gz"
    "bosectl::git+https://github.com/aaronsb/bosectl.git#commit=$_bosectl_commit"
)
sha256sums=(
    '703f026c429e020df21ef8cd757e84b1cd8f7fe973e85acf37317706700cb2cb'
    'SKIP'
)

prepare() {
    cd "$pkgname-$pkgver"
    # Wire up the submodule from the separate git source
    rmdir lib/bosectl 2>/dev/null || rm -rf lib/bosectl
    cp -r "$srcdir/bosectl" lib/bosectl
}

build() {
    cd "$pkgname-$pkgver"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
