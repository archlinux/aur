# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
pkgname=bosectl-qt-git
_pkgname=bosectl-qt
pkgver=0.3.0.r0.g0000000
pkgrel=1
pkgdesc="Qt6 system tray app for controlling Bose headphones via the BMAP protocol (git version)"
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
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/aaronsb/bosectl-qt.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "0.3.0.r%s.g%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
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
