# Maintainer: symb0l <symb0l@proton.me>
# VCS package: builds the latest commit. Publish to AUR as "arcane-launcher-git".
# (On the AUR this file is named PKGBUILD; kept as PKGBUILD-git here to sit beside the
# release recipe.)
pkgname=arcane-launcher-git
_pkgname=arcane-launcher
pkgver=0.0.1.r0.g0000000
pkgrel=1
pkgdesc="Open-source, self-contained Battle.net launcher for World of Warcraft (no Battle.net client)"
arch=('x86_64')
url="https://codeberg.org/symb0l/arcane-launcher"
license=('GPL-3.0-or-later')
depends=('qt6-webengine' 'qt6-base' 'protobuf' 'curl' 'openssl' 'libzip' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja' 'mingw-w64-gcc' 'git')
optdepends=('umu-launcher: launch games under Proton (recommended backend)')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    # <cmake-version>.r<commits>.g<short-sha>, monotonic for AUR upgrades.
    local ver
    ver=$(sed -n 's/^\s*VERSION\s\+\([0-9.]\+\).*/\1/p' CMakeLists.txt | head -1)
    printf "%s.r%s.g%s" "${ver:-0}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -S "$srcdir/$_pkgname" -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DARCANE_BUILD_QT=ON \
        -DARCANE_BUILD_TESTS=OFF
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
