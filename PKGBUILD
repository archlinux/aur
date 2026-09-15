# Maintainer: dodox1
# Contributor: 0xSeren <https://github.com/0xSeren>
# Builds the daily-bugfix branch of https://github.com/dodox1/neosolve, which is
# neosolve plus fixes that have not been merged there yet. Derived from the
# PKGBUILD in pkg/arch of the source tree.
pkgname=neosolve-daily-git
_branch=daily-bugfix
pkgver=3.2.r2302.geac98c4e
pkgrel=1
pkgdesc="SolveSpace fork adding fillet, chamfer, shell, loft and sweep via OpenCASCADE"
arch=('x86_64')
url="https://github.com/dodox1/neosolve"
license=('GPL-3.0-or-later')
depends=(
    'cairo'
    'fontconfig'
    'freetype2'
    'gtkmm3'
    'json-c'
    'libglvnd'
    'libgomp'
    'libpng'
    'libspnav'
    'opencascade'
    'pangomm'
    'zlib'
)
makedepends=(
    'cmake'
    'git'
    'ninja'
)
provides=('solvespace' 'neosolve')
conflicts=('solvespace' 'neosolve')
source=("neosolve::git+https://github.com/dodox1/neosolve.git#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/neosolve"
    printf "3.2.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/neosolve"
    git submodule update --init extlib/libdxfrw extlib/mimalloc extlib/eigen
}

build() {
    cd "$srcdir/neosolve"
    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DFORCE_VENDORED_Eigen3=ON \
        -DENABLE_OPENMP=ON \
        -DENABLE_TESTS=OFF \
        -DUSE_OPENCASCADE=ON
    cmake --build build
}

package() {
    cd "$srcdir/neosolve"
    DESTDIR="$pkgdir" cmake --install build
}
