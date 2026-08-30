# Maintainer: Dheeraj Vittal Shenoy <dheerajshenoy22@gmail.com>
pkgname=lektra-git
pkgver=0.7.6.r7.gfbf34bf
pkgrel=1
pkgdesc="High-performance document and image viewer that prioritizes screen space and control."
arch=('x86_64')
url="https://codeberg.org/lektra/lektra"
license=('AGPL-3.0')
depends=(
    'qt6-base'
    'qt6-imageformats'
    'djvulibre'
    'lua'
)
makedepends=('git' 'cmake' 'pkgconf')
provides=("lektra")
conflicts=("lektra")
source=(
    "lektra::git+https://codeberg.org/lektra/lektra.git"
)
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/lektra"
	printf "%s" "$(git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")"
}

prepare() {
    cd "$srcdir/lektra"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/lektra"

    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_LUA=on
    cmake --build build --parallel
}

package() {
    cd "$srcdir/lektra"
	DESTDIR="$pkgdir" cmake --install build
}
