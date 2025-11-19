#Maintainer: Rongbo <wurongbo2012@hotmail.com>

pkgname=openmx_openblas
_pkgname=openmx
pkgver=3.9.9
pkgrel=3
pkgdesc="A software package for nano-scale material simulations."
arch=(x86_64)
url=https://www.openmx-square.org/
license=('GPL-3.0-only')
depends=(blas-openblas fftw-openmpi scalapack)
makedepends=(gcc gcc-fortran)
provides=('openmx')
source=("https://www.openmx-square.org/openmx${pkgver%.*}.tar.gz"
        "${_pkgname}-patch-$pkgver.tar.gz::https://www.openmx-square.org/bugfixed/21Oct17/patch$pkgver.tar.gz"
        "Generate_Wannier.patch"
        "openmx_common.patch"
        "bandgnu13.patch"
)
noextract=("$_pkgname-patch-$pkgver.tar.gz")
sha256sums=('27bb56bd4d1582d33ad32108fb239b546bdd1bdffd6f5b739b4423da1ab93ae2'
            '20cccc4e3412a814a53568f400260e90f79f0bfb7e2bed84447fe071b26edd38'
            'SKIP'
            'SKIP'
            'SKIP'
)

prepare() {
    [[ -e "$pkgname-$pkgver" ]] && rm -rf "$pkgname-$pkgver"
    mv $_pkgname${pkgver%.*} $pkgname-${pkgver}
    tar xzvf $_pkgname-patch-$pkgver.tar.gz -C "$pkgname-${pkgver}"/source
    mv "$pkgname-$pkgver/source/kpoint.in" "$pkgname-$pkgver/work/"

    cd $pkgname-$pkgver
    patch --binary source/bandgnu13.c -i $srcdir/bandgnu13.patch
    patch --binary source/Generate_Wannier.c -i $srcdir/Generate_Wannier.patch
    patch --binary source/openmx_common.h -i ${srcdir}/openmx_common.patch
    sed -e "9s|^CC.*$|CC = mpicc -O3 -Dkcomp -march=x86-64-v3 -fcommon -fopenmp -Wno-error=implicit-function-declaration -Wl,--copy-dt-needed-entries|" \
        -e "10s|^FC.*$|FC = mpifort -O3 -Dkcomp -march=x86-64-v3 -fallow-argument-mismatch -fopenmp|" \
        -e "11s|^LIB.*$|LIB = -lfftw3 -lscalapack -lmpi_usempif08 -lmpi_usempi_ignore_tkr -lmpi_mpifh -lgfortran -lpthread -lm -ldl|" \
        -e "s|DESTDIR = ../work||" \
        source/makefile >Makefile
}

build() {
    cd "$pkgname-$pkgver/source"
    mkdir ../bin
    make -j6 -f ../Makefile || make -j1 -f ../Makefile
    DESTDIR=../bin make -j1 -f ../Makefile all
}

check() {
    cd "$pkgname-$pkgver"/work
    mpirun -np 6 ../bin/openmx -runtest -nt 1
}

package() {
    install -dm755 $pkgdir/usr/bin
    install -dm755 $pkgdir/usr/lib/$_pkgname
    install -dm755 $pkgdir/usr/share/$_pkgname
    ln -s /usr/lib/$_pkgname/openmx $pkgdir/usr/bin/openmx
    cp -r $srcdir/$pkgname-$pkgver/bin/* $pkgdir/usr/lib/$_pkgname/
    cp -r $srcdir/$pkgname-$pkgver/work $pkgdir/usr/share/$_pkgname/
    cp -r $srcdir/$pkgname-$pkgver/DFT_DATA19 $pkgdir/usr/share/$_pkgname/
}
