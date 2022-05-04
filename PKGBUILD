# Maintainer: tuxzz <dorazzsoft@gmail.com>
# Contributer: jclds139 <codling@umich.edu>

pkgname=blis-cblas
pkgver=0.9.0
_blasver=3.10.0
pkgrel=1
pkgdesc="BLAS-like Library Instantiation Software Framework (providing blas and cblas, with pthreads support, particularly recommended for AMD Zen CPUs)"
arch=('i686' 'x86_64')
license=('custom')
url="https://github.com/flame/blis"
makedepends=('git' 'make' 'gcc' 'python')
provides=('blis')
conflicts=('blis' 'blas' 'cblas')
provides=("blas=${_blasver}" "cblas=${_blasver}")
source=(
"${pkgname%-cblas}::https://github.com/flame/blis/archive/refs/tags/${pkgver}.tar.gz"
"cblas_f77.h"
"cblas_mangling.h"
"cblas_test.h"
"cblas.h"
)
sha1sums=(
'c5ff9b0437edc1f93ad30fcdd633c0a276165b7e'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
)
options=('staticlibs' '!emptydirs')

build() {
  cd "${pkgname%-cblas}-${pkgver}"
  
  export BLIS_NUM_THREADS=`nproc`
  export nt_use=1
  
  # static build is necessary for some packages and programs (e. g. GAMESS)
  ./configure --prefix=/usr --enable-static --enable-shared --enable-cblas --enable-threading=pthreads auto
  make
}

check() {
    cd "${pkgname%-cblas}-${pkgver}"
    
    export BLIS_NUM_THREADS=`nproc`
    export nt_use=1
    make check
}

package() {
  cd "${pkgname%-cblas}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
  install -Dm644 ${srcdir}/cblas_{f77,mangling,test}.h "${pkgdir}/usr/include/"
  install -Dm644 ${srcdir}/cblas.h "${pkgdir}/usr/include/"
    
  cd ${pkgdir}/usr/lib
  # BLAS
  ln -sv libblis.so libblas.so
  ln -sv libblis.so libblas.so.${_blasver%.*.*}
  ln -sv libblis.so libblas.so.${_blasver}
  # CBLAS
  ln -sv libblis.so libcblas.so
  ln -sv libblis.so libcblas.so.${_blasver}
  ln -sv libblis.so libcblas.so.${_blasver%.*.*}
}
