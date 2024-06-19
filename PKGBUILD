# Maintainer: Christoph Stelz <mail[plus]arch[at]ch-st[d0t]de>
pkgname=reproblas
pkgver=2.1.0
pkgrel=1
pkgdesc="Reproducible Basic Linear Algebra Subprograms"
url="https://bebop.cs.berkeley.edu/reproblas/"
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://bebop.cs.berkeley.edu/reproblas/include/download.php?filetype=tar.gz")
sha256sums=('f0c6b219691b3c5a07c442e22ca0485f37454c2e4847a8872ba4e46190d439c2')
depends=('openmpi')
makedepends=('python')
license=('custom')

build() {
    mv "${srcdir}/ReproBLAS-${pkgver}/" "${srcdir}/${pkgname}-${pkgver}/"
    mkdir -p "${srcdir}/${pkgname}-${pkgver}"
    cd "${srcdir}/${pkgname}-${pkgver}"

    sed -i 's/CC = cc/CC = gcc/' config.mk
    sed -i 's/BUILD_MPI = false/BUILD_MPI = true/' config.mk
    echo 'CFLAGS += -fPIC' >> config.mk

    patch -p1 scripts/cogapp/cogapp.py < "../../reproblas-deprecated-imp.patch"
    make update
    make
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make check
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make BIN_DIR="${pkgdir}/usr/bin" LIB_DIR="${pkgdir}/usr/lib" INC_DIR="${pkgdir}/usr/include" DOC_DIR="${pkgdir}/usr/share/doc/reproblas" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "../../${pkgname}.pc" "$pkgdir/usr/lib/pkgconfig/${pkgname}.pc"
}
