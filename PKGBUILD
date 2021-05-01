# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=siesta
pkgver=4.1.5
pkgrel=1
pkgdesc="A first-principles materials simulation code using DFT"
arch=("x86_64")
url="https://departments.icmab.es/leem/siesta"
license=('GPL')
depends=('elpa' 'metis' 'fftw' 'python')
makedepends=('gcc-fortran')
source=("https://gitlab.com/siesta-project/siesta/-/archive/v$pkgver/$pkgname-v$pkgver.tar.bz2")
sha256sums=('0beffa6b8c3f705348acba2ac619e8ad749f54bcaa1c7bb560e994a9f7f502d8')

prepare() {  
  # Whereas the configure script was removed from the distribution,
  # we have to adjust arch.make to set up building environment.
  cd "$pkgname-v$pkgver/Obj"
  cp DOCUMENTED-TEMPLATE.make arch.make
  sed -i '/CC =/c CC = mpicc' arch.make
  sed -i '/FC =/c FC = mpifort' arch.make
  sed -i '/FFLAGS =/c FFLAGS = -O3 -fPIC -march=native -fopenmp -fallow-argument-mismatch' arch.make
  sed -i 's/unknown/archlinux/g' arch.make
  sed -i 's/COMP_LIBS =/#COMP_LIBS =/' arch.make
  sed -i 's/$(COMP_LIBS)/$(COMP_LIBS) -lgomp/g' arch.make
  export MPI_INTERFACE="libmpi_f90.a"
  export MPI_INCLUDE=.
  export COMP_LIBS="-lelpa_openmp -lmetis"
  export SCALAPACK_LIBS="-lscalapack"
  export FFTW_ROOT="/usr"
  
  # Fixing libraries
  cd ../Util
  sed -i 's/ make/ make -j1 LDFLAGS="-lgomp"/g' build_all.sh
  sed -i 's/$@/$@ $(LDFLAGS)/g' Optimizer/Makefile
  
  # Handling ELPA
  _elpaver=$( ls /usr/include | grep elpa | sed 's/elpa_openmp-//g' )
}

build() {
  cd "$pkgname-v$pkgver/Obj"
  ../Src/obj_setup.sh
  make FPPFLAGS="-DMPI -DSIESTA__METIS -DSIESTA__ELPA -I/usr/include/elpa_openmp-$_elpaver/modules"
  cp siestaxc.mod ../Src
  cd ../Util
  ./build_all.sh
  rm ../Src/siestaxc.mod
}

package() {
  cd "$pkgname-v$pkgver"
  install -dm755 "$pkgdir/opt/siesta"
  install -dm755 "$pkgdir/usr/bin"
  find ./Util -type f ! -name "*.sh" -executable \
    -exec install -m755 {} "$pkgdir/opt/siesta" ";"
  install -m755 ./Obj/siesta "$pkgdir/opt/siesta"
  ln -sf "$pkgdir/opt/siesta/siesta" "$pkgdir/usr/bin"
} 
