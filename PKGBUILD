# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgname=kissat
pkgver=3.1.1
pkgrel=2
pkgdesc="A keep it simple and clean bare metal SAT solver written in C"
arch=('x86_64')
url="https://fmv.jku.at/kissat"
license=('MIT')
depends=('glibc')
_srcname="${pkgname}-rel-${pkgver}"
source=("$pkgname-$pkgver.tar.gz::https://github.com/arminbiere/kissat/archive/refs/tags/rel-${pkgver}.tar.gz")
b2sums=('ce98105f2701e9dfab8dc555ace2d6891015e25bd23f09c1b2706ddb757f7580a555bdc20340d6880f2c4a0c786a71fd16466ab06a9c7499c81e4832665ce6c3')

build() {
    cd "${srcdir}/${_srcname}"

    # -O3 is upstream default and well tested
    ./configure --no-options \
		-shared \
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
    install -D -m755 "build/tissat" "$pkgdir/usr/bin/tissat"

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
