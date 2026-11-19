# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=ButterflyPACK
pkgname=butterflypack-rocm
pkgver=5.0.0
pkgrel=1
pkgdesc="Mathematical software for rapidly solving large-scale dense linear systems with butterfly and low-rank compression (with ROCm)"
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
         'arpack'
         'parsec-rocm'
         'magma-hip')
makedepends=('cmake'
             'gcc-fortran'
             'pybind11')
optdepends=('python-mpi4py: run the Python interface on several MPI processes')
provides=("butterflypack=$pkgver")
conflicts=('butterflypack')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'magma-offset-precisions.patch')
sha256sums=('9a6ba1685b0181851faba3f020285893c61318f6abcfca2309cc26703485ecf5'
            '1a9c3789fd0698b8d12b65efdb76679f4010a42e33b15cfad0c199ac6a90537e')

prepare() {
  cd "$_name-$pkgver"
  # Don't install the example programs into /usr/lib/EXAMPLE
  sed -i '/^install(TARGETS .* RUNTIME DESTINATION "${CMAKE_INSTALL_LIBDIR}\/EXAMPLE")/d' EXAMPLE/CMakeLists.txt
  # Install the Python interface into site-packages instead of /usr/lib
  sed -i '/install(TARGETS butterflypack_python/,/)/s/${CMAKE_INSTALL_LIBDIR}/${Python_SITEARCH}/;/FILES ${PY_SCRIPTS}/,/)/s/${CMAKE_INSTALL_LIBDIR}/${Python_SITEARCH}/' SRC/CMakeLists.txt
  # Load the Python interface's library from the module's own directory
  sed -i 's|os.path.abspath(__file__ + "/../../")|os.path.dirname(os.path.abspath(__file__))|' SRC/Py_BPACK_wrapper.py
  # Define the MAGMA offset helpers for each precision instead of the double complex ones in all four libraries
  patch -Np1 -i ../magma-offset-precisions.patch
  # MAGMA single precision uses sizeof_float, which MAGMA_utilities.f90 calls sizeof_real
  grep -rlZ sizeof_float . | xargs -0 sed -i 's/sizeof_float/sizeof_real/g'
}

build() {
  cd "$_name-$pkgver"
  cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=None -DBUILD_SHARED_LIBS=ON -DCMAKE_C_COMPILER=mpicc -DCMAKE_CXX_COMPILER=mpicxx -DCMAKE_Fortran_COMPILER=mpifort -Denable_mpi=ON -Denable_openmp=ON -Denable_toplevel_openmp=ON -Denable_parsec=ON -Denable_python=ON -Denable_fftw=ON -DTPL_BLAS_LIBRARIES=/usr/lib/libblas.so -DTPL_LAPACK_LIBRARIES=/usr/lib/liblapack.so -DTPL_SCALAPACK_LIBRARIES=/usr/lib/libscalapack.so -DTPL_ZFP_LIBRARIES="/usr/lib/libzFORp.so;/usr/lib/libzfp.so" -DTPL_ZFP_INCLUDE=/usr/include -DCMAKE_PREFIX_PATH=/opt/rocm -DTPL_ARPACK_LIBRARIES="/usr/lib/libparpack.so;/usr/lib/libarpack.so" -DTPL_MAGMA_LIBRARIES="/opt/rocm/lib/libmagma.so" -DCMAKE_C_FLAGS="$CFLAGS -D__HIP_PLATFORM_AMD__ -DHIPBLAS_V2 -I/opt/rocm/include" -DCMAKE_Fortran_FLAGS="$FFLAGS -ftrampoline-impl=heap" -Wno-dev
  cmake --build build
}


package() {
  cd "$_name-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 license.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
  python -m compileall -o 0 -o 1 -s "$pkgdir" -p / "$pkgdir"/usr/lib/python3*/site-packages
}
