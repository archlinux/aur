# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=phast
pkgver=1.7
pkgrel=1
pkgdesc="Phylogenetic analysis with space/time models"
arch=("x86_64")
url="http://compgen.bscb.cornell.edu/phast"
license=("BSD")
source=("http://www.netlib.org/clapack/clapack.tgz"
        "$pkgname-$pkgver.tar.gz::https://github.com/CshlSiepelLab/phast/archive/refs/tags/v${pkgver}.tar.gz"
        "stdio.patch"
        "stdio_blas.patch"
        "tstiee.patch")
sha256sums=('6dc4c382164beec8aaed8fd2acc36ad24232c406eda6db462bd4c41d5e455fac'
            '710e71f201cfb6c263ccb9ab38f4e63bc50f2fe16405c1e4562f6d737c7ca9eb'
            'cd9817d19b6d4824ba1e72c55ada20a43c677a22d086b7ab0f014968a17eb758'
            'ff6d3e320044079426d323589ce36feb1c52213a011e4fb0ecf72daf68c115a9'
            'daeb183a38b15e8428ec5007718c867fbbaa7731f9b5dbe12025d299298d017f')

prepare() {
    # Apply patches
    cd "${srcdir}/CLAPACK-3.2.1"
    patch -p1 -i "${srcdir}/stdio.patch"
    patch -p1 -i "${srcdir}/stdio_blas.patch"
    patch -p1 -i "${srcdir}/tstiee.patch"
}

build() {
    # Build CLAPACK
    cd "$srcdir/CLAPACK-3.2.1"
    cp make.inc.example make.inc
    make f2clib
    make blaslib
    make lib

    # Build Phast
    cd "$srcdir/phast-${pkgver}/src"
    make CLAPACKPATH="$srcdir/CLAPACK-3.2.1"
}

package() {
    cd "$srcdir/phast-${pkgver}/bin"
    for fname in $(ls -1); do
        install -Dm755 $fname "$pkgdir/usr/bin/$fname"
    done
    cd "$srcdir/phast-${pkgver}/doc/man"
    for fname in $(ls -1); do
        install -Dm644 $fname "$pkgdir/usr/share/man/man1/$fname"
    done
}
