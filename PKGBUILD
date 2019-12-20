# Maintainer: Thomas Roos (Roosted7) <mail [at] thomasroos [dot] nl>

pkgname=bart-git
_pkgname=bart
pkgver=0.5.00.r16.gb197fe3
pkgrel=1
pkgdesc="Berkeley Advanced Reconstruction Toolbox (BART) for Computational Magnetic Resonance Imaging"
arch=('x86_64')
url="https://mrirecon.github.io/bart/"
license=('BSD3')
depends=('openblas-lapack' 'fftw' 'gcc-libs' 'libpng')
optdepends=('octave')
source=('bart::git+https://github.com/mrirecon/bart.git')
sha512sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    # cutting off 'v' prefix that presents in the git tag
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"

    # Add linking flag, seems needed for Arch. Will open PR / issue upstream
    #sed -i 's;BLAS_L := -L$(BLAS_BASE)/lib -llapacke -lblas;BLAS_L := -L$(BLAS_BASE)/lib -llapacke -lopenblas -lcblas;' Makefile

    make
}

package() {
    cd "$_pkgname"
    make PREFIX="$pkgdir"/usr install

    install -d "$pkgdir"/usr/share/bart/matlab
    install matlab/* "$pkgdir"/usr/share/bart/matlab

    install -d "$pkgdir"/usr/share/bart/python
    install python/* "$pkgdir"/usr/share/bart/python

    install -d "$pkgdir"/usr/share/bart/scripts
    install scripts/* "$pkgdir"/usr/share/bart
}