# Maintainer: archibald869 at web dot de

pkgname=cling-nightly
_pkgname=cling
_build_date=2019-03-01
pkgver=0.5.${_build_date//-}
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
    "perl: support for scan-build, ccc-analyzer and c++-analyzer"
)
source=(
    "${pkgname}-${pkgver}.tar.bz2::https://root.cern.ch/download/cling/cling_${_build_date}_sources.tar.bz2"
)
sha256sums=(
    "bd79bf54344de385e9a351c9a4df82d557fdb3b7b926eb1ce6449171a096727b"
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

    make -C tools/clang -j$_cores DESTDIR="$pkgdir" install
    make -C tools/cling -j$_cores DESTDIR="$pkgdir" install

    install -d "$pkgdir/usr/bin"
    ln -s "/opt/cling/bin/cling" "$pkgdir/usr/bin/cling"

    install -Dm644 "$srcdir/src/tools/cling/LICENSE.TXT" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
