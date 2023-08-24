# Maintainer: Christian Holme (Nordwin) <hcmh [at] kolabnow [dot] com>
# Contributor: Thomas Roos (Roosted7) <mail [at] thomasroos [dot] nl>

pkgname=bart-cuda-git
_pkgname=bart
pkgver=0.8.00.r466.ga769c397
pkgrel=1
pkgdesc="Berkeley Advanced Reconstruction Toolbox (BART) for Computational Magnetic Resonance Imaging. Package with GPU support, using CUDA and CUDNN"
arch=('x86_64')
url="https://mrirecon.github.io/bart/"
license=('BSD')
makedepends=('git' 'gcc>=11.2.0')
depends=('gcc-libs' 'blas-openblas' 'fftw' 'libpng' 'cuda' 'cudnn')
optdepends=('octave: MATLAB/Octave wrapper'
	    'python: Python wrapper'
	    'python-numpy: Python wrapper'
	    'python-matplotlib: Python scripts')
source=('bart::git+https://github.com/mrirecon/bart.git'
	'Makefile.local')
sha512sums=('SKIP'
            'a129d7a957daa5fdef1e920274d96cf23a1de1bbea0d802f6bd2d3ec513dc03eedaeb908c7db7d32b4e59e8b16417e113e3be0c35b06c25e5c79eb1ac985f116')
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
    # also sets options for GPU support using CUDA
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
    make utest_gpu
    # takes far too long:
#    make test
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
