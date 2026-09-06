# Maintainer: Roman Vasilev <2rvasilev at live dot ru>

pkgname=scantailor-advanced-git
pkgver=v1.0.19
pkgrel=1
pkgdesc="Interactive post-processing tool for scanned pages that merges the features of the ScanTailor Featured and ScanTailor Enhanced versions, brings new ones and fixes. "
arch=("x86_64")
options=('!lto')
#url="https://github.com/4lex4/scantailor-advanced"
url="https://github.com/ScanTailor-Advanced/scantailor-advanced"
license=("GPL3")
depends=(
    "boost-libs"
    "libjpeg-turbo"
    "libpng"
    "libtiff"
    "qt5-base"
    "zlib"
    )
makedepends=(
    "git"
    "boost"
    "cmake"
    "qt5-tools"
    "qt5-svg"
    )
provides=("scantailor")
conflicts=("scantailor-advanced" "scantailor")
#source=("scantailor-advanced::git+https://github.com/4lex4/scantailor-advanced")
source=("$pkgname::git+https://github.com/ScanTailor-Advanced/scantailor-advanced.git#tag=v1.0.19")

sha256sums=('SKIP')

# pkgver() {
#     cd "$srcdir/${pkgname%-git}"
#     git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
# }

build() {
    # export LDFLAGS="-L/usr/local/lib,--rpath=/usr/local/lib"
    # export LD_LIBRARY_PATH="/usr/local/lib"
    # export CFLAGS="-fPIC"
    # export CXXFLAGS="-fPIC"

    cd "${srcdir}/${pkgname}"
    sed -i "s/#define VERSION .*$/#define VERSION \"$pkgver-GIT\"/" version.h.in
    # https://bitbucket.org/fenics-project/dolfin/issues/1115/compile-error-min_element-is-not-member-of
    sed -i '/^#include <cmath>.*/i #include <algorithm>' src/foundation/Proximity.h
    # https://aur.archlinux.org/packages/scantailor-advanced-git/#comment-831404
    rm -rf build
    mkdir build && cd build
    cmake -G "Unix Makefiles" ..
    # cmake --build .
    make -j${nproc}
}

package() {
    cd "${srcdir}/${pkgname}"
    cd build
    make DESTDIR="${pkgdir}" install
}
