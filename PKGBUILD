# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: jedbrown

pkgname=papi-cuda
pkgver=7.0.0
pkgrel=1
pkgdesc='Performance Application Programming Interface (with CUDA componet)'
arch=('x86_64')
url='http://icl.cs.utk.edu/papi/'
license=('BSD')
provides=("papi=${pkgver}")
conflicts=('papi' 'libpfm4')
depends=('python-argparse' 'gcc-fortran' 'cuda')
optdepends=('openmpi: for MPI applications')
source=("http://icl.cs.utk.edu/projects/papi/downloads/papi-${pkgver}.tar.gz"
        'cuda-component-build-targets.patch')
sha256sums=('799dcc317a47da96beaeed445812ecb6ae49df7c0504a4569797c1f7d74c4fd2'
            '0b93df095425fd5d5a9166bb4d62a71a9ab62708b9364cb9da4193d2b60a890f')

prepare() {
  cd "${srcdir}/papi-${pkgver}/src"

  # resolve issue with NVCC not understand `-Wl` flag
  patch -p1 < $srcdir/cuda-component-build-targets.patch
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
