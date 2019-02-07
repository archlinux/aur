# Maintainer: archibald869 at web dot de

pkgname=cling-nightly
_pkgname=cling
pkgver=0.5.20190123
pkgrel=1
pkgdesc="Interactive C++ interpreter, built on the top of LLVM and Clang libraries"
arch=("i686" "x86_64")
url="https://root.cern.ch/cling"
license=("custom:Cling Release License")
provides=("cling")
conflicts=("cling")
depends=(libxml2 ncurses)
optdepends=(
    "python2: support for scan-view and Jupyter"
    "perl: support for ccc-analyzer and c++-analyzer"
)
source=(
    "${pkgname}-${pkgver}.tar.bz2::https://root.cern.ch/download/cling/cling_2019-01-23_sources.tar.bz2"
)
sha256sums=(
    "66ab0509d01affeddf561d4f1c67db6ecfe57e2c4c9d162fe189dc4b3380e504"
)
_cores=$(getconf _NPROCESSORS_ONLN)

build() {
    mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="/opt/cling" \
        -DLLVM_TARGETS_TO_BUILD="host" \
        -DLLVM_ENABLE_RTTI=ON \
        "$srcdir/src"

    make -C tools/clang -j$_cores
    make -C tools/cling -j$_cores
}

package() {
    cd "$srcdir/build"

    cores=$(getconf _NPROCESSORS_ONLN)
    make -C tools/clang -j$_cores DESTDIR="$pkgdir" install
    make -C tools/cling -j$_cores DESTDIR="$pkgdir" install

    install -d "$pkgdir/usr/bin"
    ln -s "/opt/cling/bin/cling" "$pkgdir/usr/bin/cling"

    install -Dm644 "$srcdir/src/tools/cling/LICENSE.TXT" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
