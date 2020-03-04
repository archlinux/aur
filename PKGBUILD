# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: jedbrown

pkgname=papi-cuda
pkgver=6.0.0
pkgrel=1
pkgdesc='Performance Application Programming Interface (with CUDA componet)'
arch=('x86_64' 'i686')
url='http://icl.cs.utk.edu/papi/'
license=('BSD')
provides=("papi=${pkgver}")
conflicts=('papi' 'libpfm4')
depends=('python' 'gcc-fortran' 'cuda')
optdepends=('openmpi: for MPI applications')
source=("http://icl.cs.utk.edu/projects/papi/downloads/papi-${pkgver}.tar.gz"
        'cuda-component-build-targets.patch')
sha256sums=('3442709dae3405c2845b304c06a8b15395ecf4f3899a89ceb4d715103cb4055f'
            '0b93df095425fd5d5a9166bb4d62a71a9ab62708b9364cb9da4193d2b60a890f')

prepare() {
  cd "${srcdir}/papi-${pkgver}/src"

  # resolve issue with NVCC not understand `-Wl` flag
  patch -p1 < $srcdir/cuda-component-build-targets.patch
}

build() {
  cd "${srcdir}/papi-${pkgver}/src"

  export CFLAGS="-fPIC ${CFLAGS}"
  export CC=gcc # for systems with other CC installed
  export F77=gfortran # for systems with other FC installed
  export CUDA_DIR=/opt/cuda
  export CUPTI_DIR=/opt/cuda/extras/CUPTI
  ./configure \
    --prefix=/usr \
    --with-static-lib=yes --with-shared-lib=yes \
    --mandir=/usr/share/man \
    --with-perf-events \
    --with-components="cuda"

  make
}

check(){
  cd "${srcdir}/papi-${pkgver}/src"

  make test
}

package() {
  cd "${srcdir}/papi-${pkgver}/src"

  make DESTDIR="${pkgdir}" install
  chmod 644 $pkgdir/usr/share/papi/papi_events.csv
  install -Dm644 ${srcdir}/papi-${pkgver}/LICENSE.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
