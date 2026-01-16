# Maintainer: Dheeraj Vittal Shenoy <dheerajshenoy22@gmail.com>
pkgname=dodo-pdf-reader-git
pkgver=0.5.6
pkgrel=1
pkgdesc="A fast, keyboard-based, configurable PDF reader"
arch=('x86_64')
url="https://github.com/dheerajshenoy/dodo"
license=('AGPL-3.0')
depends=('qt6-base' 'curl')
makedepends=('git' 'cmake' 'ninja' 'pkgconf') # 'bzr', 'git', 'mercurial' or 'subversion'
optdepends=('libsynctex')
provides=("dodo")
conflicts=("dodo")
_mupdf_ver=1.27.0
source=(
    "dodo::git+https://github.com/dheerajshenoy/dodo.git"
    "mupdf-${_mupdf_ver}-source.tar.gz::https://mupdf.com/downloads/archive/mupdf-${_mupdf_ver}-source.tar.gz"
)
sha256sums=("SKIP" "ae2442416de499182d37a526c6fa2bacc7a3bed5a888d113ca04844484dfe7c6")

pkgver() {
    cd "$srcdir/dodo"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/dodo"
    rm -rf external
    tar -xf "$srcdir/mupdf-${_mupdf_ver}-source.tar.gz"
    mkdir external
    mv "mupdf-${_mupdf_ver}-source" external/mupdf
}

build() {
    cd "$srcdir/dodo"

    # Build MuPDF
    make -C external/mupdf build=release HAVE_X11=no HAVE_GLUT=no

    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_LLM_SUPPORT=OFF
    cmake --build build
}

package() {
    cd "$srcdir/dodo"
	DESTDIR="$pkgdir/" cmake --install build
}
