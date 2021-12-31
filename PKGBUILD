# Maintainer:  Gabriel Souza Franco <Z2FicmllbGZyYW5jb3NvdXphQGdtYWlsLmNvbQ==>

pkgname=metakit
pkgver=2.4.9.8
pkgrel=1
pkgdesc="An efficient embedded database library with a small footprint"
arch=(i686 x86_64)
url="https://equi4.com/metakit/"
license=('MIT')
optdepends=('tcl: Tcl bindings')
makedepends=('cmake' 'tcl')
source=("$pkgname-$pkgver.zip::https://github.com/jcw/jcw.github.io/raw/main/zips/metakit-2015-06-20.zip")
sha256sums=('1c5b630af7c09fb894f22956a683ce8347fce6c4fbef7e42f50b921402561ed4')

prepare() {
    cd $pkgname
    sed -i '/add_subdirectory(demos)/d' CMakeLists.txt
    sed -i 's/mk4_shared/mk4/;/mk4_static/d' src/CMakeLists.txt
}

build() {
    mkdir -p build
    cd build

    cmake \
        -DMETAKIT_PYTHON=OFF \
        -DBUILD_TESTING=OFF \
        ../$pkgname

	make
}

package() {
	cd build
    install -Dm755 src/libmk4.so "$pkgdir"/usr/lib/libmk4.so
    install -Dm755 tcl/libMk4tcl.so "$pkgdir"/usr/lib/Mk4tcl/libMk4tcl.so
    install -Dm644 "$srcdir"/$pkgname/license.terms "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    tclsh <<<"pkg_mkIndex \"$pkgdir/usr/lib/Mk4tcl\""
}
