# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=phast
pkgver=1.6
pkgrel=1
pkgdesc="Phylogenetic analysis with space/time models"
arch=("x86_64")
url="http://compgen.bscb.cornell.edu/phast"
license=("BSD")
source=("http://www.netlib.org/clapack/clapack.tgz"
        "$pkgname-$pkgver.tar.gz::https://github.com/CshlSiepelLab/phast/archive/refs/tags/v${pkgver}.tar.gz")
sha1sums=('8b284658999d1eb71adb6ad521c6118e2db57a99'
          'bd489a547e40fbaab3b7785b7435f8cf720dc613')

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
