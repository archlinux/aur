# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgname=kissat
pkgver=4.0.1
pkgrel=1
pkgdesc="A keep it simple and clean bare metal SAT solver written in C"
arch=('x86_64')
url="https://fmv.jku.at/kissat"
license=('MIT')
depends=('glibc')
_srcname="${pkgname}-rel-${pkgver}"
source=("$pkgname-$pkgver.tar.gz::https://github.com/arminbiere/kissat/archive/refs/tags/rel-${pkgver}.tar.gz")
b2sums=('ca0699e48601ef0c5b0284f75bc6f5a260f9b594411921f8c502402fe6f5b2fc5890ebceb81d7b01c87fe75489d91263d7d4edf94e00e73ec1d868bc36e626e8')

build() {
    cd "${srcdir}/${_srcname}"

    # -O3 is upstream default and well tested
    # -shared with _one_ dash is on purpose
    # --kitten with _two_ dashes too
    ./configure -shared \
		--kitten
    make
}

check() {
    cd "${srcdir}/${_srcname}"
    make test
}

package() {
    cd "${srcdir}/${_srcname}"

    # Binaries
    install -D -m755 "build/kissat" "$pkgdir/usr/bin/kissat"
    install -D -m755 "build/kitten" "$pkgdir/usr/bin/kitten"

    # Shared libraries
    install -D -m755 "build/libkissat.so" "$pkgdir/usr/lib/libkissat.so"

    # Documentation
    install -D -m644 NEWS.md "$pkgdir/usr/share/doc/$pkgname/NEWS.md"
    install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -D -m644 CONTRIBUTING "$pkgdir/usr/share/doc/$pkgname/CONTRIBUTING"

    # License
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Headers
    cd "${srcdir}/${_srcname}/src"
    find . -name '*.h' -exec install -D -m644 {} "$pkgdir/usr/include/$pkgname/{}" \;
}
