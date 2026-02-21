# Maintainer: Dheeraj Vittal Shenoy <dheerajshenoy22@gmail.com>
pkgname=lektra-git
pkgver=0.6.3
pkgrel=1
pkgdesc="High-performance PDF reader that prioritizes screen space and control"
arch=('x86_64')
url="https://codeberg.org/lektra/lektra"
license=('AGPL-3.0')
depends=('qt6-base' 'curl' 'libsynctex')
makedepends=('git' 'cmake' 'ninja' 'pkgconf')
provides=("lektra")
conflicts=("lektra")
_mupdf_ver=1.27.2
source=(
    "lektra::git+https://codeberg.org/lektra/lektra.git"
    "mupdf-${_mupdf_ver}-source.tar.gz::https://mupdf.com/downloads/archive/mupdf-${_mupdf_ver}-source.tar.gz"
)
sha256sums=("SKIP" "553867b135303dc4c25ab67c5f234d8e900a0e36e66e8484d99adc05fe1e8737")

pkgver() {
    cd "$srcdir/lektra"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/lektra"
    rm -rf external
    tar -xf "$srcdir/mupdf-${_mupdf_ver}-source.tar.gz"
    mkdir external
    mv "mupdf-${_mupdf_ver}-source" external/mupdf
}

build() {
    cd "$srcdir/lektra"

    # Build MuPDF
    make -C external/mupdf build=release HAVE_X11=no HAVE_GLUT=no

    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_LLM_SUPPORT=OFF
    cmake --build build
}

package() {
    cd "$srcdir/lektra"
	DESTDIR="$pkgdir/" cmake --install build
}
