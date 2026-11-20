# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=ButterflyPACK
pkgname=butterflypack
pkgver=5.0.0
pkgrel=3
pkgdesc="Mathematical software for rapidly solving large-scale dense linear systems with butterfly and low-rank compression"
arch=('x86_64')
url="https://github.com/liuyangzhuan/$_name"
license=('BSD-3-Clause-LBNL')
depends=('glibc'
         'libgcc'
         'libgfortran'
         'libgomp'
         'libstdc++'
         'openmpi'
         'blas'
         'lapack'
         'scalapack'
         'zfp'
         'fftw'
         'python'
         'python-numpy'
         'parsec')
makedepends=('cmake'
             'gcc-fortran'
             'pybind11')
checkdepends=('python-mpi4py'
              'python-george')
optdepends=('python-mpi4py: run the Python interface on several MPI processes')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'parsec-cmake-config.patch'
        'redistribute-empty-1d-block.patch')
sha256sums=('9a6ba1685b0181851faba3f020285893c61318f6abcfca2309cc26703485ecf5'
            '03ca84d89dc4678f2cd9f3a12829aa6d4abeddc5adc2a3e06446116cd31ea17f'
            'ece23da8051902b4c2ea50ccf46b99a9011333a0e5c09030ca3f9d8067e10bc6')

prepare() {
  cd "$_name-$pkgver"
  # Look for PaRSEC in the installed CMake config, since libbutterflypack links PaRSEC::parsec publicly
  patch -Np1 -i ../parsec-cmake-config.patch
  # Allocate the 1D buffer on ranks that own no rows too, since passing it unallocated to pgemr2df90 makes gfortran pack it from an undefined descriptor (endless loop in STRUMPACK's SPARSE_HODLR_mpi_1)
  patch -Np1 -i ../redistribute-empty-1d-block.patch
  # Don't install the example programs into /usr/lib/EXAMPLE
  sed -i '/^install(TARGETS .* RUNTIME DESTINATION "${CMAKE_INSTALL_LIBDIR}\/EXAMPLE")/d' EXAMPLE/CMakeLists.txt
  # Install the Python interface into site-packages instead of /usr/lib
  sed -i '/install(TARGETS butterflypack_python/,/)/s/${CMAKE_INSTALL_LIBDIR}/${Python_SITEARCH}/;/FILES ${PY_SCRIPTS}/,/)/s/${CMAKE_INSTALL_LIBDIR}/${Python_SITEARCH}/' SRC/CMakeLists.txt
  # Load the Python interface's library from the module's own directory
  sed -i 's|os.path.abspath(__file__ + "/../../")|os.path.dirname(os.path.abspath(__file__))|' SRC/Py_BPACK_wrapper.py
}

build() {
  cd "$_name-$pkgver"
  cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=None -DBUILD_SHARED_LIBS=ON -DCMAKE_C_COMPILER=mpicc -DCMAKE_CXX_COMPILER=mpicxx -DCMAKE_Fortran_COMPILER=mpifort -Denable_mpi=ON -Denable_openmp=ON -Denable_toplevel_openmp=ON -Denable_parsec=ON -Denable_python=ON -Denable_fftw=ON -DTPL_BLAS_LIBRARIES=/usr/lib/libblas.so -DTPL_LAPACK_LIBRARIES=/usr/lib/liblapack.so -DTPL_SCALAPACK_LIBRARIES=/usr/lib/libscalapack.so -DTPL_ZFP_LIBRARIES="/usr/lib/libzFORp.so;/usr/lib/libzfp.so" -DTPL_ZFP_INCLUDE=/usr/include -DCMAKE_Fortran_FLAGS="$FFLAGS -ftrampoline-impl=heap" -Wno-dev
  cmake --build build
}

check() {
  cd "$_name-$pkgver"
  ln -sfn SRC_DOUBLE build/lib
  for _test in {1..16} 20; do TEST_NUMBER=$_test sh .ci_tests.sh; done
}

package() {
  cd "$_name-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 license.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
  python -m compileall -o 0 -o 1 -s "$pkgdir" -p / "$pkgdir"/usr/lib/python3*/site-packages
}
