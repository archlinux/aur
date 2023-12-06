# Maintainer: Christian Holme (Nordwin) <hcmh [at] kolabnow [dot] com>
# Contributor: Thomas Roos (Roosted7) <mail [at] thomasroos [dot] nl>

pkgname=bart
pkgver=0.9.00
pkgrel=1
pkgdesc="Berkeley Advanced Reconstruction Toolbox (BART) for Computational Magnetic Resonance Imaging"
arch=('x86_64')
url="https://mrirecon.github.io/bart/"
license=('BSD')
depends=('gcc>=11.2.0' 'blas-openblas' 'fftw' 'libpng')
optdepends=('octave' 'python3')
source=("https://github.com/mrirecon/bart/archive/refs/tags/v${pkgver}.tar.gz"
	"Makefile.local")
sha512sums=('c9291c645d7f1d6e315c6d953006fc0765c1027bbeabaf29249f30a02686890fd67f4087647d2ef09e8f1950da7ae162e053be692d5e8546d53d0ccf78437023'
            '4ab4bb30e696dd262ecf59a64ec2ae5fa8f4832153816b4966c6af6e33fcf3981a5a4083d963cd3e470cd6000df32bfff4db146e9e34672f94962b5b329f4846')
conflicts=('bart')

prepare() {
    cd "$pkgname"-"$pkgver"

    # set path for openblas/lapacke/cblas headers
    ln -sf "${srcdir}/Makefile.local"

}

build() {
    cd "$pkgname"-"$pkgver"

    make
    make doc/commands.txt
}




check() {
    cd "$pkgname"-"$pkgver"

    make utest
    # takes far too long:
#    make test
}



package() {
    cd "$pkgname"-"$pkgver"
    make PREFIX="$pkgdir"/usr install

    # Also install the libs, the viewer needs this and its not done by the Makefile atm
    install -d "$pkgdir"/usr/lib/bart
    install -m644 lib/* "$pkgdir"/usr/lib/bart

    # Also install the headers, the viewer needs this and its not done by the Makefile atm
    install -d "$pkgdir"/usr/include/bart
    cd src
    for file in $(find ./ -type f -name "*.h"); do
        install -D ${file} "$pkgdir"/usr/include/bart/${file}
    done
    cd ..

    install -d "$pkgdir"/usr/share/bart/matlab
    install matlab/* "$pkgdir"/usr/share/bart/matlab

    install -d "$pkgdir"/usr/share/bart/python
    install python/* "$pkgdir"/usr/share/bart/python

    install -d "$pkgdir"/usr/share/bart/scripts
    install scripts/* "$pkgdir"/usr/share/bart

    # Install license, since each BSD license is technically a custom license
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
