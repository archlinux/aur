# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: jedbrown

pkgname=papi-cuda
pkgver=7.0.1
pkgrel=2
pkgdesc='Performance Application Programming Interface (with CUDA componet)'
arch=('x86_64')
url='http://icl.cs.utk.edu/papi/'
license=('BSD')
provides=("papi=${pkgver}")
conflicts=('papi' 'libpfm4')
depends=('cuda')
makedepends=('gcc-fortran' 'cuda' 'openmpi')
optdepends=('openmpi: for MPI applications'
            'gcc-fortran: for Fortran applications')
source=("http://icl.cs.utk.edu/projects/papi/downloads/papi-${pkgver}.tar.gz"
        'cuda-component-build-targets.patch'
        'sde-ldflags.patch')
sha256sums=('c105da5d8fea7b113b0741a943d467a06c98db959ce71bdd9a50b9f03eecc43e'
            '0b93df095425fd5d5a9166bb4d62a71a9ab62708b9364cb9da4193d2b60a890f'
            '5b930e34afa9b9af596344411ed3202f68d6de4e9049e1b41bc7adbd3ded8793')

prepare() {
  cd "${srcdir}/papi-${pkgver}/src"

  # resolve issue with NVCC not understand `-Wl` flag
  patch -p1 < $srcdir/cuda-component-build-targets.patch

  # fix missing LDFLAGS for SDE component (for full RELRO)
  patch -p1 < $srcdir/sde-ldflags.patch
}

build() {
  cd "${srcdir}/papi-${pkgver}/src"

  # FIXME for the cuda component there are a few snprintf calls which
  #       trigger the format-security checks. I might try to write a
  #       patch for this, but for now we disable this check locally.
  export CFLAGS="-fPIC ${CFLAGS/-Werror=format-security/}"
  export CXXFLAGS=${CXXFLAGS/-Werror=format-security/}
  export CC=gcc # for systems with other CC installed
  export F77=gfortran # for systems with other FC installed
  export CUDA_DIR=/opt/cuda
  export CUPTI_DIR=/opt/cuda/extras/CUPTI

  ./configure \
    --prefix=/usr \
    --with-static-lib=yes --with-shared-lib=yes \
    --mandir=/usr/share/man \
    --with-perf-events \
    --with-components="sde cuda"

  DBG="" make
}

## XXX the tests run for a *very* long time, so I've disabled this step for the moment
## check(){
##   cd "${srcdir}/papi-${pkgver}/src"
##
##   #make test
##   ./run_tests.sh
## }

package() {
  cd "${srcdir}/papi-${pkgver}/src"

  make DESTDIR="${pkgdir}" install
  chmod 644 $pkgdir/usr/share/papi/papi_events.csv
  install -Dm644 ${srcdir}/papi-${pkgver}/LICENSE.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
