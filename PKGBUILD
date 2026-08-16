# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
pkgname=bosectl-qt-git
_pkgname=bosectl-qt
pkgver=0.3.0.r3.g1bca24a
pkgrel=1
pkgdesc="Qt6 system tray app for controlling Bose headphones via the BMAP protocol (git version)"
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
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/aaronsb/bosectl-qt.git")
sha256sums=('SKIP')

# Derived from the tag rather than hardcoded. The base version used to be
# written into the printf, so it had to be rewritten by hand at every release —
# and would have kept reporting 0.3.0.rN after v0.4.0 was tagged if anyone
# forgot. git describe reads it from the tag, which cannot go stale.
pkgver() {
    cd "$_pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

prepare() {
    cd "$_pkgname"
    git submodule update --init --recursive
}

build() {
    cd "$_pkgname"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build
}

package() {
    cd "$_pkgname"
    DESTDIR="$pkgdir" cmake --install build

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
