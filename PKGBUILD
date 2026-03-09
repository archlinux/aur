# Maintainer: Dheeraj Vittal Shenoy <dheerajshenoy22@gmail.com>
pkgname=lektra-git
pkgver=0.6.5.r59.g28de7b0
pkgrel=1
pkgdesc="High-performance PDF reader that prioritizes screen space and control"
arch=('x86_64')
url="https://codeberg.org/lektra/lektra"
license=('AGPL-3.0')
depends=(
    'qt6-base'
    'libsynctex'
    'djvulibre'
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
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
        -DENABLE_LLM_SUPPORT=OFF
    cmake --build build
}

package() {
    cd "$srcdir/lektra"
	DESTDIR="$pkgdir" cmake --install build
}
