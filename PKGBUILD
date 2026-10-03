# Maintainer:  nene <ne.ne@tuta.io>
# Contributor: redtide <redtid3@gmail.com>
# Contributor: Marcin Mikołajczak <me@m4sk.in>

_pkgname=arqiver
pkgname=$_pkgname-git
pkgver=V1.0.2.r3.gde6327b
pkgrel=1
pkgdesc="Simple Qt archive manager based on libarchive"
arch=(x86_64)
url='https://github.com/tsujan/Arqiver'
license=(GPL3)
depends=(
    libarchive
    gzip
    p7zip
    qt6-svg
    qt6-base
)
makedepends=(
    cmake
    git
    qt6-tools
)
provides=($_pkgname)
conflicts=($_pkgname)
source=($_pkgname::git+$url)
b2sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $_pkgname
    (
        set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/$_pkgname"
    local options=(
        -B build
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
        -S .
        -W no-dev
    )
    cmake "${options[@]}"
    cmake --build build --verbose
}

package() {
    cd "$srcdir/$_pkgname"
    DESTDIR="$pkgdir" cmake --install build
}
