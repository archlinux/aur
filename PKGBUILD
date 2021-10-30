# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Marcin Mielniczuk <marmistrz dot dev at zoho dot eu>
_backend=openmpi
pkgname=ampi-${_backend}
pkgver=7.0.0
pkgrel=1
pkgdesc="Adaptive Message Passing Interface, OpenMPI backend"
arch=('x86_64')
license=('custom:Charm++/Converse License')
url="http://charm.cs.uiuc.edu/research/ampi/"
depends=('openmpi')
makedepends=('gcc-fortran')
source=("http://charm.cs.illinois.edu/distrib/charm-${pkgver}.tar.gz")
sha512sums=('ea74616d3ae26548fbaa280678258198dc350bb20ecf9a4f00d3b63cc8bf86f145069a4f7641a3f0781775e42b9a845d911e1cec860933a85e6986c02898a1dd')

build() {
  cd "charm-v${pkgver}"
  ./build AMPI mpi-linux-$CARCH --with-production
}

package() {
  cd "charm-v${pkgver}"
  make -C tmp install DESTDIR="${pkgdir}/opt/ampi-${_backend}"
  # Workaround https://github.com/UIUC-PPL/charm/issues/2275
  for wrapper in ampicc ampiCC ampicxx; do
    f="${pkgdir}/opt/ampi-${_backend}/bin/$wrapper"
    echo "Patching $f"
    sed -i 's|charmarch=$(cat $CHARMBIN/../tmp/.gdir)|charmarch=mpi|g' "$f"
  done
}
