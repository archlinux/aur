# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
pkgname=bosectl-qt
pkgver=0.4.0
pkgrel=1
pkgdesc="Qt6 system tray app for controlling Bose headphones via the BMAP protocol"
arch=('x86_64' 'aarch64')
url="https://github.com/aaronsb/bosectl-qt"
license=('MIT')
depends=(
    'qt6-base'
    'bluez-libs'
    'bluez'
    # CMake installs bosectl-qt.svg into
    # /usr/share/icons/hicolor/scalable/apps, and that hierarchy is owned by
    # hicolor-icon-theme. Nothing in this file mentions the icon, which is why
    # the dependency was missed: the install comes from the build system, not
    # from package().
    'hicolor-icon-theme'
)
makedepends=(
    'cmake'
    'git'
    'gcc'
)
# The bosectl submodule commit that this release is pinned to.
# Bump along with the main pkgver when updating.
_bosectl_commit=c46a1f607ee717b958dd9f880f7dbb2344b2f543
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/aaronsb/bosectl-qt/archive/v$pkgver.tar.gz"
    "bosectl::git+https://github.com/aaronsb/bosectl.git#commit=$_bosectl_commit"
)
sha256sums=(
    '78d53cf85c83a510ca8a5e5155df00b9d69f6f049d8298b0556e5b05a0005b99'
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
