# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=fleur
pkgver=0.31
_pkgver=MaX4
pkgrel=1
pkgdesc="A full-potential linearized augmented planewave code"
arch=("x86_64")
url="https://www.flapw.de"
license=('MIT')
depends=('libxml2' 'hdf5' 'spfft' 'scalapack')
makedepends=('cmake' 'gcc-fortran')
source=("$url/pm/uploads/FLEUR/${pkgname}${_pkgver}.tgz")
sha256sums=('96c6907786ea2d321ab90ab6cb4edd8d96368552f5c7f7852f08ffc75b019cb4')

prepare() {
  LIBMPI=$( mpifort -show | sed "s@.*-L@-L@g" )
  MPIINC="-I/usr/include -pthread -I/usr/lib/openmpi"
  mkdir "$srcdir/build"
}

build() {
  cd "$srcdir/build"
  cmake ../$pkgname \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_Fortran_FLAGS="$MPIINC -I/usr/include/spfft -O3 -march=native -fallow-argument-mismatch" \
        -DCMAKE_EXE_LINKER_FLAGS="-lblas -lscalapack $LIBMPI -lspfft" \
        -DLAPACK_LIBRARIES="-llapack" \
        -DFLEUR_USE_MPI=TRUE \
        -DFLEUR_USE_SCALAPACK=TRUE \
        -DFLEUR_USE_SPFFT=TRUE
  make
}

check() {
  cd "$srcdir/build"
  make test
}

package() {
  cd "$pkgdir"
  install -dm755 usr/{bin,share/licenses/$pkgname}
  install -m755 "$srcdir/build/fleur_MPI" usr/bin
  install -m755 "$srcdir/build/inpgen" usr/bin
  install -m755 "$srcdir/$pkgname/LICENSE" usr/share/licenses/$pkgname
}
