# Maintainer: Christian Holme (Nordwin) <hcmh [at] kolabnow [dot] com>
# Contributor: Thomas Roos (Roosted7) <mail [at] thomasroos [dot] nl>

pkgname=bart
pkgver=0.9.00
pkgrel=2
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
	"0001-backport-dicom-fixes.patch")
sha512sums=('e8d34bf5413fcc149b501f56d0bba2c677f4a712127a6e81529722a56fea6bd33332bc6d8426a828c73e04d35d45e54b1fe3db88ea5628718e32aadceaaf0a37'
            '4ab4bb30e696dd262ecf59a64ec2ae5fa8f4832153816b4966c6af6e33fcf3981a5a4083d963cd3e470cd6000df32bfff4db146e9e34672f94962b5b329f4846'
    	    'b0ab7f2f64a90bb70f8bdd80c20df390918fe8d26b28e0fa62c1a6c7fe4594b9c89acbf41519a9fcdb2ecabc6db880f746cc97e64206168524c5669f97b9a1a6')
conflicts=('bart')

prepare() {
    cd "$pkgname"

    # set path for openblas/lapacke/cblas headers
    ln -sf "${srcdir}/Makefile.local"
    patch -p1 < "${srcdir}/0001-backport-dicom-fixes.patch"

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
