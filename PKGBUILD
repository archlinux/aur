# Maintainer: Thomas Roos (Roosted7) <mail [at] thomasroos [dot] nl>
# Maintainer: Christian Holme (Nordwin) <hcmh [at] kolabnow [dot] com>

pkgname=bart-git
_pkgname=bart
pkgver=0.8.00.r512.g2d6ec2d3
pkgrel=1
pkgdesc="Berkeley Advanced Reconstruction Toolbox (BART) for Computational Magnetic Resonance Imaging"
arch=('x86_64')
url="https://mrirecon.github.io/bart/"
license=('BSD')
makedepends=('git' 'gcc>=11.2.0')
depends=('gcc-libs' 'blas-openblas' 'fftw' 'libpng')
optdepends=('octave: MATLAB/Octave wrapper'
	    'python: Python wrapper'
	    'python-numpy: Python wrapper'
	    'python-matplotlib: Python scripts')
source=('bart::git+https://github.com/mrirecon/bart.git'
	'Makefile.local')
sha512sums=('SKIP'
            '4ab4bb30e696dd262ecf59a64ec2ae5fa8f4832153816b4966c6af6e33fcf3981a5a4083d963cd3e470cd6000df32bfff4db146e9e34672f94962b5b329f4846')
provides=('bart')
conflicts=('bart')

pkgver() {
    cd "$_pkgname"
    # cutting off 'v' prefix that presents in the git tag
    # but also use the last tag actually describing a version, which is the latest
    # tag starting with v (for now)
    git describe --match v\* --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"

    # set path for openblas/lapacke/cblas headers
    ln -sf "${srcdir}/Makefile.local"

}

build() {
    cd "$_pkgname"

    make
    make doc/commands.txt
}

check() {
    cd "$_pkgname"

    make utest
    # takes far too long:
#    make test
}

package() {
    cd "$_pkgname"
    make PREFIX="$pkgdir"/usr install
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
