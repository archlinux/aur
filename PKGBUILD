# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname=hpddm
pkgver=2.4.1
pkgrel=1
pkgdesc="High-performance unified framework for domain decomposition methods"
arch=('x86_64')
url="https://github.com/$pkgname/$pkgname"
license=('LGPL-3.0-or-later')
depends=('glibc'
         'libgcc'
         'libgfortran'
         'libstdc++'
         'openmpi'
         'blas'
         'lapack'
         'arpack'
         'mumps'
         'scalapack')
makedepends=('gcc-fortran'
             'python')
checkdepends=('python-numpy'
              'python-scipy'
              'python-mpi4py')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2496e573f183e6044613331eeb040722e8cae1a710f72b107cb58325a7c6449c')

prepare() {
  cd "$pkgname-$pkgver"
  # Start from upstream's Linux configuration
  cp Make.inc/Makefile.Linux Makefile.inc
  # Use Arch's MUMPS, ScaLAPACK, Python 3 and flags, and oversubscribe the MPI tests
  printf '%s\n' 'MUMPS_LIBS = -lsmumps -ldmumps -lcmumps -lzmumps -lmumps_common -lpord' 'SCALAPACK_LIBS = -lscalapack' 'PYTHON_INCS = $(shell python3-config --includes)' 'PYTHON_LIBS = $(shell python3-config --ldflags --embed)' 'MPIRUN = mpirun --oversubscribe -np' 'override CXXFLAGS += $(CPPFLAGS)' >> Makefile.inc
  # Don't put the build directory in the RPATH of the installed libraries
  sed -i '/override LDFLAGS += -Wl,-rpath,${TOP_DIR}\/${LIB_DIR}/d' Makefile
}

build() {
  cd "$pkgname-$pkgver"
  make all F90MOD=-J
}

check() {
  cd "$pkgname-$pkgver"
  LD_LIBRARY_PATH="$srcdir/$pkgname-$pkgver/lib" make test F90MOD=-J
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 include/*.hpp interface/HPDDM.h -t "$pkgdir"/usr/include/
  install -Dm755 lib/libhpddm_c.so lib/libhpddm_fortran.so -t "$pkgdir"/usr/lib/
}
