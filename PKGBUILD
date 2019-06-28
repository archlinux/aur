# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: jedbrown

pkgname=papi-cuda
pkgver=5.7.0
pkgrel=1
pkgdesc='Performance Application Programming Interface (with CUDA componet)'
arch=('x86_64' 'i686')
url='http://icl.cs.utk.edu/papi/'
license=('BSD')
provides=("papi=${pkgver}")
conflicts=('papi' 'libpfm4')
depends=('glibc' 'gcc-fortran' 'cuda')
optdepends=('openmpi: for MPI applications')
source=("http://icl.cs.utk.edu/projects/papi/downloads/papi-${pkgver}.tar.gz"
        'cuda-component-build-targets.patch'
        'papi-utils-ldpath-fix.patch')
sha256sums=('d1a3bb848e292c805bc9f29e09c27870e2ff4cda6c2fba3b7da8b4bba6547589'
            '0b93df095425fd5d5a9166bb4d62a71a9ab62708b9364cb9da4193d2b60a890f'
            'd9658f3f950d398b62138d82340b5ef2b5aa79774665e8c634cf5c320a43220d')

prepare() {
  cd "${srcdir}/papi-${pkgver}/src"

  # resolve issue with NVCC not understand `-Wl` flag
  patch -p1 < $srcdir/cuda-component-build-targets.patch
  # resolve problem with LDPATHS placed at wrong point in CC commandline
  patch -p1 < $srcdir/papi-utils-ldpath-fix.patch
}

build() {
  cd "${srcdir}/papi-${pkgver}/src"

  export CFLAGS="-fPIC ${CFLAGS}"
  export CC=gcc # for systems with other CC installed
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
    ${pkgdir}/usr/share/licenses/papi/LICENSE
}
