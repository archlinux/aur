# Maintainer: Marcin Mielniczuk <marmistrz dot dev at zoho dot eu>
_backend=openmpi
pkgname=ampi-${_backend}
pkgver=6.9.0
pkgrel=3
pkgdesc="Adaptive Message Passing Interface, OpenMPI backend"
arch=('x86_64')
license=('custom:Charm++/Converse License')
url="http://charm.cs.uiuc.edu/research/ampi/"
depends=('openmpi')
makedepends=('gcc-fortran')
source=("http://charm.cs.illinois.edu/distrib/charm-${pkgver}.tar.gz")
sha512sums=('894d154b7d8a8757e76838d97b0fd969fd4fa874956c80af7ea0766687272bbbe7df342b7e5d77e460ea883185de8b0f8f9926548e6ef4b9b8ed00e3caef94d2')
_ENABLE_FEATURES="--enable-charmdebug"

build() {
    cd charm-${pkgver}
    ./build AMPI mpi-linux-x86_64 ${_ENABLE_FEATURES} --with-production
}

package() {
    cd charm-$pkgver
    make -C tmp install DESTDIR="${pkgdir}/opt/ampi-${_backend}"
    # Workaround https://github.com/UIUC-PPL/charm/issues/2275
    for wrapper in ampicc ampiCC ampicxx; do
        f="${pkgdir}/opt/ampi-${_backend}/bin/$wrapper"
        echo "Patching $f"
        sed -i 's|charmarch=$(cat $CHARMBIN/../tmp/.gdir)|charmarch=mpi|g' "$f"
    done
}
