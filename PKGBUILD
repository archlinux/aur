# Maintainer: Andrew Werner <aur@andrewwerner.com>
pkgname=scantailor-universal-git
pkgdesc="ScanTailor Universal - a fork based on Enhanced+Featured+Master versions of ST"
pkgver=r1552.f280e04a
pkgrel=2
arch=("x86_64")
url="https://github.com/trufanov-nok/scantailor-universal"
license=("GPL3")
depends=(
    "boost-libs"
    "libjpeg"
    "libpng"
    "libtiff"
    "qt5-base"
    "qt5-svg"
    "zlib"
)
makedepends=(
    "boost"
    "cmake"
    "qt5-tools"
    "git"
    "ninja"
)
provides=("scantailor" "scantailor-universal")
conflicts=("scantailor-universal" "scantailor" "scantailor-advanced" "scantailor-advanced-git")
source=("scantailor-universal::git+https://github.com/trufanov-nok/scantailor-universal.git")
sha256sums=('SKIP')

pkgver() {
    cd "scantailor-universal"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    # This is the NEW part that fixes your error.
    # It initializes the submodules (BreezeStyleSheets) so they actually download.
    cd "scantailor-universal"
    git submodule update --init --recursive
}

build() {
    cd "${srcdir}/scantailor-universal"

    cmake -B build -S . \
        -GNinja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr

    cmake --build build
}

package() {
    cd "${srcdir}/scantailor-universal"
    DESTDIR="${pkgdir}" cmake --install build

    # Create the symlink for the GUI
    # This makes 'scantailor' launch 'scantailor-universal'
    ln -s scantailor-universal "${pkgdir}/usr/bin/scantailor"
}
