# Maintainer: tuxzz <dorazzsoft@gmail.com>

pkgname=blis-cblas-openmp
pkgver=0.7.0
_blasver=3.9.0
pkgrel=1
pkgdesc="BLAS-like Library Instantiation Software Framework (providing blas and cblas, with OpenMP support, particularly recommended for AMD Zen CPUs)"
arch=('i686' 'x86_64')
license=('custom')
url="https://github.com/flame/blis"
makedepends=('git' 'make' 'gcc' 'python')
provides=('blis')
conflicts=('blis' 'blas' 'cblas')
provides=("blas=${_blasver}" "cblas=${_blasver}")
source=(
"$pkgname::git+https://github.com/flame/blis.git#commit=943a21def0bedc1732c0a2453afe7c90d7f62e95"
"cblas_f77.h"
"cblas_mangling.h"
"cblas_test.h"
"cblas.h"
)
sha1sums=(
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
)
options=('staticlibs' '!emptydirs')

build() {
  cd "${pkgname}"
  unset CC CXX CFLAGS CXXFLAGS
  export CC="gcc"
  export CXX="g++"
  export CFLAGS="-pipe -Ofast -fno-plt -ftree-vectorize -flto -falign-functions=32 -fno-semantic-interposition -fipa-pta -fdevirtualize-at-ltrans -floop-nest-optimize -floop-strip-mine -floop-interchange -fgraphite-identity"
  export CXXFALGS=${CFLAGS}
  
  export BLIS_JC_NT=1
  export BLIS_PC_NT=1
  export BLIS_IC_NT=1
  export BLIS_JR_NT=1
  export BLIS_IR_NT=1
  export OMP_NUM_THREADS=1
  export OPENBLAS_NUM_THREADS=1
  export MKL_NUM_THREADS=1
  export nt_use=1
  
  # static build is necessary for some packages and programs (e. g. GAMESS)
  ./configure --prefix=/usr --enable-static --enable-shared --enable-cblas --enable-threading=openmp auto
  make
}

check() {
    cd "${pkgname}"
    
    export BLIS_JC_NT=1
    export BLIS_PC_NT=1
    export BLIS_IC_NT=1
    export BLIS_JR_NT=1
    export BLIS_IR_NT=1
    export OMP_NUM_THREADS=1
    export OPENBLAS_NUM_THREADS=1
    export MKL_NUM_THREADS=1
    export nt_use=1
    make check
}

package() {
  cd "${pkgname}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
  install -Dm644 ${srcdir}/cblas_{f77,mangling,test}.h "${pkgdir}/usr/include/"
  install -Dm644 ${srcdir}/cblas.h "${pkgdir}/usr/include/"
  
  cd ${pkgdir}/usr/lib
  # BLAS
  ln -sv libblis.so libblas.so
  ln -sv libblis.so libblas.so.3
  ln -sv libblis.so libblas.so.3.9.0
  # CBLAS
  ln -sv libblis.so libcblas.so
  ln -sv libblis.so libcblas.so.3
  ln -sv libblis.so libcblas.so.3.9.0
}
