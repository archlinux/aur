# Maintainer: Christian Holme (Nordwin) <hcmh [at] kolabnow [dot] com>
# Contributor: Thomas Roos (Roosted7) <mail [at] thomasroos [dot] nl>

pkgname=bart
pkgver=0.8.00
pkgrel=1
pkgdesc="Berkeley Advanced Reconstruction Toolbox (BART) for Computational Magnetic Resonance Imaging"
arch=('x86_64')
url="https://mrirecon.github.io/bart/"
license=('BSD')
depends=('gcc>=11.2.0' 'openblas-lapack' 'fftw' 'libpng')
optdepends=('octave' 'python3')
source=("https://github.com/mrirecon/bart/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('2c8ebdbe6aca004debdf2ea977e07d4624612cee07f66946fd7b9608144d74ae3bad9e68ca158bec61b3f21f104df5f63457ed88423ed7bb74fd506f47532591')
conflicts=('bart-git')

build() {
    cd "$pkgname"-"$pkgver"

    make
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
