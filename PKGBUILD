# Maintainer: Christian Holme (Nordwin) <hcmh [at] kolabnow [dot] com>
# Contributor: Thomas Roos (Roosted7) <mail [at] thomasroos [dot] nl>

pkgname=bart
pkgver=1.0.00
pkgrel=1
pkgdesc="Berkeley Advanced Reconstruction Toolbox (BART) for Computational Magnetic Resonance Imaging"
arch=('x86_64')
url="https://mrirecon.codeberg.page/"
license=('BSD')
makedepends=('gcc>=11.2.0')
depends=('gcc-libs' 'blas-openblas' 'fftw' 'libpng')
optdepends=('octave: MATLAB/Octave wrapper'
	    'python: Python wrapper'
	    'python-numpy: Python wrapper'
	    'python-matplotlib: Python scripts')
source=("https://codeberg.org/mrirecon/bart/archive/v${pkgver}.tar.gz"
	"Makefile.local"
)
sha512sums=('fbffcb8fdcc8dea75b46bbae4ad36ff90266ebc360237215b45ce37d2100fdf37267f667050f14208688bcf2c8f53777d746f48acb9aee16fbf7a0d8ff8ee131'
            '4ab4bb30e696dd262ecf59a64ec2ae5fa8f4832153816b4966c6af6e33fcf3981a5a4083d963cd3e470cd6000df32bfff4db146e9e34672f94962b5b329f4846'
)
conflicts=('bart')

prepare() {
    cd "$pkgname"

    # set path for openblas/lapacke/cblas headers
    ln -sf "${srcdir}/Makefile.local"
}

build() {
    cd "$pkgname"

    make
    make doc/commands.txt
}

check() {
    cd "$pkgname"

    make utest
    # takes far too long:
#    make test
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" PREFIX=usr install
    install commands/* "$pkgdir"/usr/lib/bart/commands/

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
