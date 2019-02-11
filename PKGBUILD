# Maintainer: archibald869 at web dot de

pkgname=cling-nightly-bin
_pkgname=cling
pkgver=0.5.20190123
pkgrel=3
pkgdesc="Interactive C++ interpreter, built on the top of LLVM and Clang libraries"
arch=("i686" "x86_64")
url="https://root.cern.ch/cling"
license=("custom:Cling Release License")
provides=("cling")
conflicts=("cling")
depends=(libxml2 ncurses)
optdepends=(
    'python2: support for scan-view, opt-viewer, Jupyter'
    'perl: support for ccc-analyzer, c++-analyzer, scan-build'
)
source=(
    "${pkgname}-${pkgver}.tar.bz2::https://root.cern.ch/download/cling/cling_2019-01-23_cc7.tar.bz2"
    https://raw.githubusercontent.com/root-project/cling/master/LICENSE.TXT
)
sha256sums=(
    "d52e3b51bad24157f7513c2a2c06ab2b11b720e9b3bd0d721a66a91dae7ef2ff"
    "a9105b805411fddb0c7c829b9fecb85d0d200c9b49aaa0c1a510daa7796b72b4"
)
options=(!strip)

package() {
    cd "$srcdir"

    # cling requires libtinfo.so.5. libtinfo.so[.6] is shipped with ncurses.
    # If libtinfo.so.5 is not installed, create a symlink to libtinfo.so.6.
    if [ ! -f /usr/lib/libtinfo.so.5 ]; then
        install -d "$pkgdir/usr/lib"
        ln -s /usr/lib/libtinfo.so.6 "$pkgdir/usr/lib/libtinfo.so.5"
    fi

    install -d "$pkgdir/opt/$_pkgname"
    cp -r cling_*/* "$pkgdir/opt/$_pkgname"

    install -d "$pkgdir/usr/bin"
    ln -sf "/opt/$_pkgname/bin/cling" "$pkgdir/usr/bin/cling"

    install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
