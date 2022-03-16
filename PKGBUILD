# Maintainer: Thomas Roos (Roosted7) <mail [at] thomasroos [dot] nl>
# Maintainer: Christian Holme (Nordwin) <hcmh [at] kolabnow [dot] com>

pkgname=bart-git
_pkgname=bart
pkgver=0.7.00.r358.ge35c79c
pkgrel=1
pkgdesc="Berkeley Advanced Reconstruction Toolbox (BART) for Computational Magnetic Resonance Imaging"
arch=('x86_64')
url="https://mrirecon.github.io/bart/"
license=('BSD')
makedepends=('git')
depends=('gcc>=11.2.0' 'openblas-lapack' 'fftw' 'libpng')
optdepends=('octave' 'python3')
source=('bart::git+https://github.com/mrirecon/bart.git')
sha512sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    # cutting off 'v' prefix that presents in the git tag
    # but also use the last tag actually describing a version, which is the latest
    # tag starting with v (for now)
    git describe --match v\* --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"

    make
    make doc/commands.txt
}

package() {
    cd "$_pkgname"
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
