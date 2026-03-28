# Maintainer: robinpie <robin413@protonmail.com>
pkgname=chessament-git
_pkgname=chessament
pkgver=r457.6ae9db1
pkgrel=1
pkgdesc='Chess tournament manager for Swiss-system tournaments'
arch=('x86_64')
url='https://apps.kde.org/chessament/'
license=('GPL-3.0-or-later')
depends=(
    'gcc-libs'
    'glibc'
    'karchive'
    'kconfig'
    'kcoreaddons'
    'ki18n'
    'kiconthemes'
    'kio'
    'kirigami'
    'kirigami-addons'
    'kitemmodels'
    'qcoro'
    'qqc2-desktop-style'
    'qt6-base'
    'qt6-declarative'
    'qt6-networkauth'
    'qt6-svg'
    'qtkeychain-qt6'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
    'git'
)
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
source=("${_pkgname}::git+https://invent.kde.org/games/chessament.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    ( set -o pipefail
        git describe --long --abbrev=7 2>/dev/null \
            | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" \
            "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    cmake -B build -S "$_pkgname" \
        -DBUILD_TESTING=OFF \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
